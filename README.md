# Spark Delta

Template for building spark applications with pyspark and delta.
## Setup 

Install [pipenv](https://pipenv-fork.readthedocs.io/en/latest/basics.html) to setup virtual environment and manage package dependencies (run and dev) for the project.

#### Installing with homebrew
```shell
brew install pipenv
```
#### Installing with pip
```shell
pip3 install pipenv
```

#### Starting the virtual environment
```shell
pipenv shell
```

#### Installing new dependencies
```shell
# dependencies for running the app
pipenv --install pyspark

# dependencies for developing the app
pipenv --install --dev pytest
```
#### Locking currently installed packages
```shell
pipenv lock
```



## Tests

## Running the application



