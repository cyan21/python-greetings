#!/bin/bash

usage()
{
  echo "=============================================================="
  echo -e "Usage:\n\t $0 -r target_repo -n arty_id [-p yaml_path]"
  echo "=============================================================="
  exit 2
}
yaml_path=.jfrog/projects

while getopts 'hr:s:p:' c
do
  case $c in
    p) yaml_path=$OPTARG/projects ;;
    r) target_repo=$OPTARG ;;
    s) arty_id=$OPTARG ;;
    h) usage ;;
  esac
done

mkdir -p $yaml_path 
echo "[INFO] $yaml_path generated !"

cat <<EOF > $yaml_path/pip.yaml
version: 1
type: pip
resolver:
  repo: $target_repo
  serverId: $arty_id
EOF
                    
cat $yaml_path/pip.yaml
echo "[INFO] $yaml_path/pip.yaml generated !"

