#!/bin/bash

# Checking pre-requisites
./download.sh

if [ $? -ne 0 ]; then
    echo "Issue with pre-requisites";
    echo "Exiting...";
    exit 1;
else
	yum -y localinstall oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm && yum -y localinstall compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm && yum -y localinstall oracle-database-ee-19c-1.0-1.x86_64.rpm
	
	if [ $? -ne 0 ]; then
		echo "Oracle 19c has not installed properly";
		exit 1;
	else
		echo "Oracle 19c has installed succesfully";
		
		# Setting password for user "oracle"
		# echo "Please choose the password for user /"oracle"/"
		su - root 
		passwd oracle --stdin < <( echo "2888" )
		
		# Changing to user "oracle"
		su - oracle < <( echo "2888" )
		
		/etc/init.d/oracledb_ORCLCDB-19c configure
		
		# Setting environment variables
		. /usr/local/bin/oraenv 
		
		# Check SID and set as env variable
		cat /etc/oratab
		. oraenv
		
		echo 'alias sql="sqlplus / as sysdba"' >> ~oracle/.bashrc

		exit 0;
	fi
fi



