#!/bin/bash

usage()
{
  echo "=============================================================="
  echo "This script requires the following environment variables :"
  echo -e "\t ARTY_URL (example :  http://192.168.41.41/artifactory)"
  echo -e "\t ARTY_USER (example :  admin)"
  echo -e "\t ARTY_APIKEY"
  echo -e "==============================================================\n"
  echo -e "Usage:\n\t $0 -i build_id -n build_number -t target_folder -r target_repo -a arty_id [-m module_id ] [-v]"
  echo -e "==============================================================\n"
  exit 2
}

checkVar() 
{
  for e in $1; do 
    echo "[INFO] $e : ${!e}"
    if [ "${!e}" == "" ]; then
      echo "[ERROR] $e not set"
      exit 1
    fi
  done
}

#####################################
#### MAIN 		
#####################################
module_id="my_module"
target_folder="release"

#source env.sh

checkVar "ARTY_URL ARTY_USER ARTY_APIKEY"

while getopts 'ha:i:n:m:r:t:' c
do
  case $c in
    a) arty_id=$OPTARG ;;
    i) build_id=$OPTARG ;;
    n) build_number=$OPTARG ;;
    m) module_id=$OPTARG ;;
    t) target_folder=$OPTARG ;;
    r) target_repo=$OPTARG ;;
    h) usage ;;
  esac
done

checkVar "build_id build_number module_id target_repo arty_id"

echo "[INFO] configuring JFrog CLI ..."
jfrog rt c --interactive=false \
  --url=$ARTY_URL \
  --user=$ARTY_USER \
  --apikey=$ARTY_APIKEY \
$arty_id

echo "[INFO] pinging Artifactory ..."
jfrog rt use $arty_id
jfrog rt curl api/system/ping

if [ $? -eq 0 ]; then 
  echo -e "\n[INFO] ping OK !"
else
  echo -e "\n[ERROR] ping KO !!"
  exit 1
fi


arty_host=`echo "$ARTY_URL" | cut -d "/" -f3 | cut -d":" -f1`
echo "[INFO] arty_host : $arty_host!"

echo "[INFO] installing dependencies ..."
echo "jfrog rt pipi -r requirements.txt --no-cache-dir --force-reinstall --trusted-host $arty_host"
jfrog rt pipi -r requirements.txt --no-cache-dir --force-reinstall --trusted-host $arty_host \
  --build-name=$build_id \
  --build-number=$build_number \
  --module=$module_id

echo "[INFO] dependencies installed !"

echo "[INFO] generating wheel package ..."
python setup.py sdist bdist_wheel -d $target_folder 
echo "[INFO] wheel package generated ! "

echo "[INFO] uploading wheel package to Artifactory ... "
jfrog rt u $target_folder/ $target_repo/ \
  --build-name=$build_id \
  --build-number=$build_number \
  --module=$module_id
echo "[INFO] wheel package uploaded !"

jfrog rt bce $build_id $build_number
jfrog rt bp $build_id $build_number

