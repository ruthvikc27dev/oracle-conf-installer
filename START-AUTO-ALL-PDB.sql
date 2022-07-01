CREATE OR REPLACE trigger OPEN_ALL_PLUGGABLES 
   AFTER startup 
   ON  database 
BEGIN 
   EXECUTE IMMEDIATE 'alter pluggable database all open'; 
END open_all_pdbs;