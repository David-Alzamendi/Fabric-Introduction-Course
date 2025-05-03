-- Step 1: Create the role
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'BlockedFromInvalidObjects')
BEGIN
    CREATE ROLE BlockedFromInvalidObjects;
    PRINT 'Role BlockedFromInvalidObjects created.'
END

-- Step 2: Declare and populate invalid data types
DECLARE @InvalidTypes TABLE (DataType NVARCHAR(50));
INSERT INTO @InvalidTypes (DataType)
VALUES 
('text'), ('ntext'), ('image'), 
('sql_variant'), ('timestamp'), 
('hierarchyid'), ('xml'), 
('geography'), ('geometry'), 
('cursor'), ('table'), ('variant');

-- Step 3: Generate and execute REVOKE statements dynamically
DECLARE @sql NVARCHAR(MAX) = N'';

-- Revoke from tables
SELECT @sql = @sql + 
    'REVOKE SELECT ON [' + s.name + '].[' + t.name + '] TO BlockedFromInvalidObjects;' + CHAR(13)
FROM sys.columns c
JOIN sys.types ty ON c.user_type_id = ty.user_type_id
JOIN sys.tables t ON c.object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE ty.name IN (SELECT DataType FROM @InvalidTypes);

-- Revoke from views
SELECT @sql = @sql + 
    'REVOKE SELECT ON [' + s.name + '].[' + v.name + '] TO BlockedFromInvalidObjects;' + CHAR(13)
FROM sys.columns c
JOIN sys.types ty ON c.user_type_id = ty.user_type_id
JOIN sys.views v ON c.object_id = v.object_id
JOIN sys.schemas s ON v.schema_id = s.schema_id
WHERE ty.name IN (SELECT DataType FROM @InvalidTypes);

-- Execute the REVOKE commands
EXEC sp_executesql @sql;

PRINT 'Revoked SELECT from all tables/views with unsupported data types.'

