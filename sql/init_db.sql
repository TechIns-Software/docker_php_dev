IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'delta')
BEGIN
  CREATE DATABASE delta;
END;

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'test_delta')
BEGIN
    CREATE DATABASE test_delta
END;