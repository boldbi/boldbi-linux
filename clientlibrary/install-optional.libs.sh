#!/bin/bash
# command to run this file
# bash install-optional.libs.sh install-optional-libs npgsql,mongodb,influxdb,google,clickhouse
command=$1
arguments=$2
root_path=$3
installoptionlibs="install-optional-libs"
if [ -z "$root_path" ]
then
root_path="/var/www/bold-services"
fi
clientlibrary=$root_path/clientlibrary
clientlibraryzip=$clientlibrary/clientlibrary.zip
clientlibraryextractpath=$clientlibrary/temp
pluginpath=$root_path/application/bi/dataservice/Plugins/connections
# check empty command 
if [ -z "$command" ]
then
echo "Please enter the valid command"
echo "install-optional-libs"

# check valid command
elif [ $command != "$installoptionlibs" ];
then
echo "Please enter the valid command"
echo "install-optional-libs"

# copy optionlib block
else

# check empty assembly names
if [ -z "$arguments" ]
then
echo "Please pass optional library names as arguments."
else

# copy the optional libraries names
if [ -f "$root_path/optional-lib.txt" ]
then
        rm -rf "$root_path/optional-lib.txt"
        echo $2 >>"$root_path/optional-lib.txt"
else
        echo $2 >>"$root_path/optional-lib.txt"
fi

# split assembly name into array
IFS=', ' read -r -a assmeblyarguments <<< "$arguments"
assembly=("mongodb" "mysql" "influxdb" "snowflake" "oracle" "clickhouse" "google")
nonexistassembly=()

# create  invalid assembly array
for element in "${assmeblyarguments[@]}"
do
    if [[ ! " ${assembly[@]} " =~ " ${element} " ]]; then
    nonexistassembly+=("$element")
fi
done

# check non exist assembly count
if [ ${#nonexistassembly[@]} -ne 0 ]; then
echo "The below optional library names do not exist. Please enter valid library names."

for element in "${nonexistassembly[@]}"
do 
echo "$element"
done

else
echo "$clientlibraryextractpath"
rm -r temp
mkdir temp
if [ $arguments != "phantomjs" ]
then
unzip -q clientlibrary.zip -d $clientlibraryextractpath
fi
pluginpath=$root_path/application/bi/dataservice/Plugins/connections
for element in "${assmeblyarguments[@]}"
do
    case $element in
"mongodb")
destination=$pluginpath/mongodbconnections
yes | cp -rf $clientlibraryextractpath/DnsClient.dll $destination
yes | cp -rf $clientlibraryextractpath/MongoDB.Bson.dll $destination
yes | cp -rf $clientlibraryextractpath/MongoDB.Driver.Core.dll $destination
yes | cp -rf $clientlibraryextractpath/MongoDB.Driver.dll $destination
yes | cp -rf $clientlibraryextractpath/MongoDB.Driver.Legacy.dll $destination
yes | cp -rf $clientlibraryextractpath/MongoDB.Libmongocrypt.dll $destination
echo "mongodb libraries are installed"
;;
"mysql")
destination=$pluginpath/mysqlserver
yes | cp -rf $clientlibraryextractpath/MySqlConnector.dll $destination
echo "mysql libraries are installed"
;;
"influxdb")
destination=$pluginpath/influxdb
yes | cp -rf $clientlibraryextractpath/InfluxData.Net.dll $destination
echo "influxdb libraries are installed"
;;
 "snowflake")
destination=$pluginpath/snowflake
yes | cp -rf $clientlibraryextractpath/Snowflake.Data.dll $destination
echo "snowflake libraries are installed"
;;
 "oracle")
destination=$pluginpath/oracle
yes | cp -rf $clientlibraryextractpath/Oracle.ManagedDataAccess.dll $destination
echo "oracle libraries are installed"
;;
"google")
destination=$pluginpath/google
yes | cp -rf $clientlibraryextractpath/Google.Cloud.BigQuery.V2.dll $destination
echo "google libraries are installed"
;;
"clickhouse")
destination=$pluginpath/clickhouse
yes | cp -rf $clientlibraryextractpath/ClickHouse.Client.dll $destination
echo "clickhouse libraries are installed"
;;
esac
done
rm -r $clientlibraryextractpath
fi
fi
fi
