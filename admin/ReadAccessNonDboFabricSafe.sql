-- Step 1: Create the role if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'ReadAccessNonDboFabricSafe')
BEGIN
    CREATE ROLE ReadAccessNonDboFabricSafe;
    PRINT 'Created role: ReadAccessNonDboFabricSafe';
END

-- Step 2: Declare unsupported types
DECLARE @UnsupportedTypes TABLE (DataType NVARCHAR(50));
INSERT INTO @UnsupportedTypes (DataType)
VALUES 
('text'), ('ntext'), ('image'),
('sql_variant'), ('timestamp'),
('hierarchyid'), ('xml'),
('geography'), ('geometry'),
('cursor'), ('table'), ('variant');

-- Step 3: Build dynamic SQL to GRANT SELECT and VIEW DEFINITION
DECLARE @sql NVARCHAR(MAX) = N'';

SELECT @sql = @sql + 
    'GRANT SELECT, VIEW DEFINITION ON [' + s.name + '].[' + t.name + '] TO ReadAccessNonDboFabricSafe;' + CHAR(13)
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    s.name NOT IN ('dbo', 'datamovement') -- ✅ exclude both schemas
    AND NOT (
        s.name = 'HumanResources' AND t.name IN ('Shift', 'Employee')
    )
	  AND NOT (
        s.name = 'Person' AND t.name IN ('Password')
    )
	  AND NOT (
        s.name = 'Sales' AND t.name IN ( 'CTTest')
    )
		  AND NOT (
        s.name = 'Production' AND t.name IN ('ProductProductPhoto', 'ProductPhoto')
    )

    AND NOT EXISTS (
        SELECT 1
        FROM sys.columns c
        JOIN sys.types ty ON c.user_type_id = ty.user_type_id
        WHERE c.object_id = t.object_id
        AND ty.name IN (SELECT DataType FROM @UnsupportedTypes)
    );

-- Step 4: Execute the GRANTs
EXEC sp_executesql @sql;
