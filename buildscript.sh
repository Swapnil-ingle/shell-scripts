#!/bin/bash

Plugin_Home="/Users/swapnil/Downloads/apache-tomcat-9.0.10/plugins"
Automate_Build_Home=`pwd`
Plugin_Name=$(echo `pwd`/build/libs | xargs ls)

$Plugin_Home/../bin/./shutdown.sh -force
cd $Automate_Build_Home
gradle clean
gradle build

rm $Plugin_Home/$Plugin_Name

cp $Automate_Build_Home/build/libs/$Plugin_Name $Plugin_Home/

echo "Changing directories to the plugin home and displaying the content"
ls -l $Plugin_Home
echo "Displying current timestamp `date "+TIME: %H:%M:%S"`"
$Plugin_Home/../bin/./catalina.sh jpda start
