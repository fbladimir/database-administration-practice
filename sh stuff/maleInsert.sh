#!/bin/bash


#iana_ports_url="https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv"
#port_file=""
#wget=$(which wget)
db_name="fcano009_gender_a3"
table_name="male"
#db_user="mysqladmin"


#download iana ports file
#function download_files() {
   # echo "downloading ports file..."
    #port_file=$($wget $iana_ports_url &> /dev/null && ls -1 *.csv)
    #parsing port file for first 4 fields and tcp lines only
    #cat $port_file | sed 1d | cut -d, -f1,2,3,4 | grep tcp | sed 's/^,/null,/g' > temp.csv
    #mv temp.csv $port_file
    #check_error
#}

#create database and tables
#function setup_database() {
    #echo "....setting up database..."
    #echo -n "enter mysql password: "
    #read rootpass
    #sudo mysql -u$db_user -p${rootpass} << MYSQL
#CREATE DATABASE $db_name;
#USE $db_name;
#CREATE TABLE ports (id int NOT NULL AUTO_INCREMENT, service char(50), number varchar(50), proto char(10), description varchar(255), PRIMARY KEY (id));
#MYSQL
#}

#import port into table
function import_ports() {
    #echo "... import port table ..."
    cat males.csv | while IFS=$',' read username first last gender dob country color fruits os shell permission
    do
        echo "INSERT INTO $table_name (username, first, last, gender, dob, country, color, fruits, os, shell, permission) VALUES (DEFAULT, '$username', '$first', '$last', '$gender', '$dob', '$country', '$color', '$fruits', '$os', '$shell', '$permission');"
    done | sudo mysql $db_name
}

#check for errors
#function check_error() {
    #if [ $? -ne 0 ]; then
        #echo "Something went wrong, terminating program!.."
        #exit -1
    #fi
#}

###################
##    MAIN      ###
###################
#download_files
#setup_database
#check_error
import_ports

#END
