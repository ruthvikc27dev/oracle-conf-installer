-- Without configuring tnsnames -
sqlplus userName/myPassword@"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=asdasdasd.com)(PORT=1524))(CONNECT_DATA=(SID=AARCER1)))" 
sqlplus hr/hr@"(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1522))(CONNECT_DATA=(SID=ORCLPDB1)))" 

-- Then you don't need any tnsnames.ora

-- With configuring -
/opt/oracle/product/19c/dbhome_1/network/admin/tnsnames.ora
sqlplus username/password@sid

/opt/oracle/product/19c/dbhome_1/network/admin/sqlnet.ora

-- Set environment variable TNS_ADMIN to location of these files, i.e
export TNS_ADMIN="/opt/oracle/product/19c/dbhome_1/network/admin"

tnsping orclpdb1

sqlplus ruthvikc27/2888@orclpdb

-- Edit listener.ora
-- Linux: $ORACLE_HOME/network/admin/listener.ora
-- Replace localhost with 0.0.0.0

-- ...

-- LISTENER =
--   (DESCRIPTION_LIST =
--     (DESCRIPTION =
--       (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
--       (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))
--     )
--   )

# Restart Oracle services
sudo systemctl restart oracle-xe

lsnrctl status 
lsnrctl reload
lsnrctl start
lsnrctl stop
lsnrctl services