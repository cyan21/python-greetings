## Build with Docker

TO DO 

## Build without Docker

use the Jenkinsfile

> requirements : Artifactory PRO + JFrog CLI + miniconda3 installed in /var/opt/miniconda3/

### Install MiniConda3

* Install miniconda 3
https://docs.conda.io/en/latest/miniconda.html#linux-installers

All commands are in <MINICONDA_HOME>/bin/

* List conda info to show cache location, .condarc
```
$ conda info
```

* List virtual env
```
$ conda env list
```

* Create virtual env with python 3.8.0 
```
$ conda create -y -n p380 python=3.8.0
```

* Activate/Enter  virtual env
```
$ conda activate p380
```

* Get out/disconnect from  virtual env
```
$ conda deactivate
```

* Delete virtual env (after disconnecting from the virtual env)
```
$ conda env remove -y -n p380
```

