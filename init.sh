#!/bin/sh

YAML_PATH=.jfrog/projects

mkdir -p $YAML_PATH 
cat <<EOF > $YAML_PATH/pip.yaml
version: 1
type: pip
resolver:
  repo: $1
  serverId: $2 
EOF
                    
cat $YAML_PATH/pip.yaml

