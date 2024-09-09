
USE ROLE DEMO_ROLE;
USE WAREHOUSE DEMO_WH;
USE SCHEMA DEMO_DB.DEMO_SCHEMA;


-- ----------------------------------------------------------------------------
-- Step #1: Execute scripts in a Git stage
-- ----------------------------------------------------------------------------
LIST @DEMO_REPO/branches/main;
LIST @DEMO_REPO/branches/main/scripts/02_execute_immediate;

SHOW TABLES;

EXECUTE IMMEDIATE FROM @DEMO_REPO/branches/main/scripts/02_execute_immediate/create-inventory.sql;
