# PRE REQUISITES

JFrog platform enabling Artifactory, Xray, Pipelines

| Service | Type | Name | Description | 
| ----------- | ----------- |----------- | ----------- |
| Artifactory | Python virtual repo | ninja-dev-python | aggregate  dev local and remote | 
| Artifactory | Python local repo   | ninja-dev-python-local | | 
| Artifactory | Python local repo   | ninja-rc-python-local | for promotion | 
| Artifactory | Python remote repo  | ninja-pypi-remote | | 
| Pipelines   | Github Integration | yann_github | pointing to https://github.com/cyan21 |
| Pipelines   | Artifactory Integration | artifactory_eu | |

## Repository creation

````
curl -uadmin:chaysinh -X PATCH "http://localhost:8081/artifactory/api/system/configuration" -H "Content-Type: application/yaml" -T repo.yml
````

if you change the repo names, make sure to edit : 
* repo name in the pipelines.steps.yaml (pipeline variables)


## Integration creation

integrations have to be created manually for now JFrog pipelines
