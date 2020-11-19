#!/bin/bash


# requires : XRAY POLICY (see policy name in watch.json)

JPD_URL="http://artifactory-eu-yannc3-0.soleng-emea-staging.jfrog.team"
ADMIN_USER="admin"
ADMIN_PASS="password"
BUILD_NAMES="app_python"  #list with comma as a separator


creds="-u$ADMIN_USER:$ADMIN_PASS"

# create repo
echo "[ARTIFACTORY] creating repositories ..."
curl -XPATCH $creds \
    -H "Content-Type: application/yaml" -T repo.yaml \
    $JPD_URL/artifactory/api/system/configuration 

# index build
echo -e "\n[XRAY] indexing builds ... "
curl -XPOST $creds \
    -H "Content-Type: application/json" -d "{\"names\":[\"`echo $BUILD_NAMES | sed 's/,/","/g'`\"]}" \
    $JPD_URL/xray/api/v1/binMgr/builds

# create watch
echo -e "\n[XRAY] creating watch ... !"
curl -XPOST $creds \
    -H "Content-Type: application/json" -d @watch.json \
    $JPD_URL/xray/api/v2/watches




