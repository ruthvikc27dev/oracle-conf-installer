# Download the latest oracle package from the official website
sudo -s

# run preinstall rpm
yum install -y oracle-database-preinstall-19c

# OR
wget https://yum.oracle.com/repo/OracleLinux/OL8/appstream/x86_64/getPackage/oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm
yum -y localinstall oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm
yum -y localinstall compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm

# install oracle 19c database software using rpm
yum -y localinstall oracle-database-ee-19c-1.0-1.x86_64.rpm

# create oracle 19c database.
/etc/init.d/oracledb_ORCLCDB-19c configure

. /usr/local/bin/oraenv 

su - i
passwd oracle
cat /etc/oratab
. oraenv
sqlplus / as sysdba
SELECT name, open_mode, database_role FROM v$database;
SELECT * FROM v$version;

cd /opt/oracle/oradata/ORCLCDB
alter pluggable database ORCLPDB open;
sqlplus sys/2888>@localhost/ORCLPDB1 as sysdba

------------------------------------------------------------

If your goal is to create an Oracle user and then use it to do stuff with your DB you probably want to consider doing this:

log as sysdba
create a pdb (a.k.a. pluggable database)
create a user for your pdb
What follows assume you are working with a db in localhost, if not simply change "localhost" with your db uri.

Sample code
Log as sysdba:

$ sqlplus sys/<your_admin_pws>@localhost as sysdba
then execute this:

------------------------------------------------------------

create pluggable database MYDATABASE admin user Scott identified by tiger file_name_convert = ('/pdbseed/', '/mydatabase/');

create pluggable database ORCLPDB admin user ruthvikc27 identified by 2888  file_name_convert = ('/pdbseed/', '/mydatabase/');

------------------------------------------------------------

alter pluggable database MYDATABASE open;

alter pluggable database ORCLPDB open;

------------------------------------------------------------

then you may want to grant some permission to user Scott: log out from @localhost and log back in as sysdba to your new db

$ sqlplus sys/<your_admin_pws>@localhost/MYDATABASE as sysdba
and grant Scott whatever permission you want, e.g.

grant connect to Scott;
grant create view to Scott;
grant create table to Scott;
grant create trigger to Scott;
now you are good to go: you have an empty database instance and a user. Just log in by doing

$ sqlplus Scott/tiger@localhost/MYDATABASE

--------------------------------------------------------------------------------------

