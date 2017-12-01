# Python Demo

> Connection to Artifactory must have been setup

## Use case 1

1/ fetch dependencies
```
pip install -r requirements.tx
```

2/ call them in a python script 
```
python intro.py
```

## Use case 2 

1/ package + upload displayjson

```
python setup.py bdist_wheel upload -r local
```

2/ reuse package in python script 
```
python test.py
```
