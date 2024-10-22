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

SET ENV_TABLE_NAME = 'UTIL_' || $FHLB_ENV || '_TABLE';
SELECT COUNT(*) FROM IDENTIFIER($ENV_TABLE_NAME);
