-----------------------------------------------------------------------------------
----- Network rule and policies for tableau cloud
----- Policies get applied during service account/user creation, not in this script
-----
----- Prereqs :
-----   1.  Standard FHLBP admin roles created
-----   2.  FHLB_UTILITY creation script run
-----   3.  Setthe FHLB_ENV variable to the environment you are running this in
-----------------------------------------------------------------------------------

SET FHLB_ENV = 'DEV';

-----------------------------------------------------
-----             Verify correct env            -----
-----------------------------------------------------

-- Determine environment and set username
-- Replace FHLB_ENV with a public function to determine account/env at a later time
USE DATABASE FHLB_UTILITY;
USE SCHEMA FHLBUTL;

SET ENV_TABLE_NAME = 'FHLBP_' || $FHLB_ENV || '_TABLE';
SELECT COUNT(*) FROM IDENTIFIER($ENV_TABLE_NAME);

