## Docker Build 

* Build

```
docker build -t python-build:1.0 --rm  \
  --build-arg BUILD_NAME=test_wheel  \
  --build-arg BUILD_NUMBER=10  \
  --build-arg ARTY_URL='http://192.168.41.41:8081/artifactory'  \
  --build-arg ARTY_USER='admin' \
  --build-arg ARTY_APIKEY='AKCp5btpCwjQnQr3QSZv7XK7i7W7Yf1BXyzdXqsUKPePDHqYE3HLDPHdF9F7spexvso3sNJSN' \
  --build-arg ARTY_MAIN_REPO='asgardian-pypi' \
CI/DockerBuild/ 
```

* Run

```
docker run -ti --rm python-build:1.0
```

## Jenkins Build 

* Jenkins requirements

credentials: create art_apikey creds (user/apikey) 

node(s) : 
* tagged with "linux" label and Docker installed 
* tagged with "jfrog_cli" label and JFrog CLI installed 


* Run
Configure the environment variables in the Jenkinsfile + ```jfrog_cli_path``` 
