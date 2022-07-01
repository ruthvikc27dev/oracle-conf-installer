#!/bin/bash

if [ -e ./oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm ]; then
    echo "File already exists. [oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm]";
    exit 0;
else 
    wget https://yum.oracle.com/repo/OracleLinux/OL8/appstream/x86_64/getPackage/oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm
    exit 0;
fi

if [ -e './compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm' ]; then
    echo "File already exists. [compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm]"
    exit 0;
else 
    wget http://mirror.centos.org/centos/7/os/x86_64/Packages/compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm
    exit 0;
fi

if [ -e './oracle-database-ee-19c-1.0-1.x86_64.rpm' ]; then
    echo "File already exists. [oracle-database-ee-19c-1.0-1.x86_64.rpm]";
    exit 0;
else
    echo "Please download the official Oracle 19c installer to continue...";
    exit 1;
fi
