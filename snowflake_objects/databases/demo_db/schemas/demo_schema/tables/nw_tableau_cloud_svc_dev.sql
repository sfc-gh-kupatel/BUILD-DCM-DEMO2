
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



-----------------------------------------------------
-----         Network polices creation          -----
-----                                           -----
-----   This section should only be modified    -----
-----     if a NEW network policy is needed     -----
-----------------------------------------------------
USE ROLE SF_NETWORKADMIN;
USE DATABASE FHLB_UTILITY;
USE SCHEMA NETWORK;

CREATE NETWORK POLICY IF NOT EXISTS NETPOL_TABLEAU_CLOUD;


-----------------------------------------------------
-----         Network rule assignments          -----
-----                                           -----
-----  IP list for each network rule goes here  -----
-----------------------------------------------------
USE ROLE SF_NETWORKADMIN;
USE DATABASE FHLB_UTILITY;
USE SCHEMA NETWORK;

ALTER NETWORK RULE NETRULE_TABLEAU_CLOUD_FHLB_INT SET
	VALUE_LIST = ('10.130.3.0/24');

ALTER NETWORK RULE NETRULE_TABLEAU_CLOUD_EXT SET
	VALUE_LIST = ('3.219.176.16/28','155.226.144.0/22'); --provided by the vendor


-----------------------------------------------------
-----      Network Policy rule assignments      -----
-----                                           -----
-----  Rules for each network policy goes here  -----
-----------------------------------------------------
USE ROLE SF_NETWORKADMIN;
USE DATABASE FHLB_UTILITY;
USE SCHEMA NETWORK;

--ALTER NETWORK POLICY NETPOL_TABLEAU_CLOUD SET
--	ALLOWED_NETWORK_RULE_LIST = 
--		( 
--			'NETRULE_FHLB_DC_EXT', --remove after move to Azure Palo AVD
--			'NETRULE_FHLB_AZURE_EXT',
--			'NETRULE_AWS_PL_FHLB_INT',
--			'NETRULE_TABLEAU_CLOUD_FHLB_INT',
--			'NETRULE_TABLEAU_CLOUD_EXT'
--		);
	--BLOCKED_NETWORK_RULE_LIST = ( 'optional blocked list of IPs');
