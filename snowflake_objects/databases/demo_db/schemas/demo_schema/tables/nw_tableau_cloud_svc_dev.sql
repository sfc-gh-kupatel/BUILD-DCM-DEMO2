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


-----------------------------------------------------
-----           Network rules creation          -----
-----                                           -----		
-----   This section should only be modified    -----
-----      if a NEW network rule is needed      -----
-----------------------------------------------------
USE ROLE SF_NETWORKADMIN;
USE DATABASE FHLB_UTILITY;
USE SCHEMA NETWORK;

CREATE NETWORK RULE IF NOT EXISTS NETRULE_TABLEAU_CLOUD_FHLB_INT
	TYPE = IPV4
	MODE= INGRESS
	COMMENT ='FHLB Internal IP subnet connecting to SF ENV via PL, network segmentation by IP ranges';

CREATE NETWORK RULE IF NOT EXISTS NETRULE_TABLEAU_CLOUD_EXT
	TYPE = IPV4
	MODE= INGRESS
	COMMENT ='Tableau Cloud IP';


