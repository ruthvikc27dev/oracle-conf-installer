-- Creating PDB service -

ALTER SESSION SET container=orclpdb1;
SELECT con_id,name,open_mode FROM v$containers;
EXEC dbms_service.CREATE_SERVICE('orclpdb1','localhost');
EXEC DBMS_SERVICE.DELETE_SERVICE('orclpdb');
SELECT service_id,name,pdb,con_id FROM cdb_services order by con_id;
EXEC dbms_service.start_service('orclpdb1');
ALTER SYSTEM register;


lsnrctl status 
lsnrctl reload
lsnrctl start
lsnrctl stop

USE_SID_AS_SERVICE_ORCLCDB=on 

-- CDB commands -
-- STARTUP [NOMOUNT | MOUNT | RESTRICT | UPGRADE | FORCE | READ ONLY]
-- SHUTDOWN [IMMEDIATE | ABORT]