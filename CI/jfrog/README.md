# PRE REQUISITES

JFrog platform enabling Artifactory, Xray, Pipelines

| Service | Type | Name | Description | 
| ----------- | ----------- |----------- | ----------- |
| Artifactory | Python virtual repo | asgardian-python | aggregate  dev local and remote | 
| Artifactory | Python local repo   | asgardian-dev-python-local | | 
| Artifactory | Python local repo   | asgardian-rc-python-local | for promotion | 
| Artifactory | Python remote repo  | asgardian-pypi-remote | | 
| Artifactory | Docker virtual repo | asgardian-python | aggregate  dev local and remote | 
| Artifactory | Docker local repo   | asgardian-dev-docker-local | | 
| Artifactory | Docker local repo   | asgardian-release-docker-local | | 
| Artifactory | Docker remote repo  | asgardian-pypi-remote | | 
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

## Generate a custom runtime image

````
docker build -t asgardian-docker.artifactory-eu.soleng-emea.jfrog.team/continuumio/miniconda3:4.7.12-jfrog CI/jfrog/

docker login asgardian-docker.artifactory-eu.soleng-emea.jfrog.team

docker push asgardian-docker.artifactory-eu.soleng-emea.jfrog.team/continuumio/miniconda3:4.7.12-jfrog 
````