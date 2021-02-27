#!/usr/bin/env bash

function check_pipenv_install() {
  if [ -x "$(which pipenv)" ]
  then
    echo "We're good"
  else
    echo 'ERROR - pipenv is not installed --> run `pip3 install pipenv` to load pipenv into global site packages or install via a system package manager.'
    exit 1
  fi
}

function check_exists_piplock() {
  if [ ! -e Pipfile.lock ]
  then
      echo 'ERROR - cannot find Pipfile.lock'
      exit 1
  else
    echo "We're good piplock is there"
  fi
}

function install_requirements() {
    echo '... creating requirements.txt from Pipfile.lock'
    pipenv lock -r > requirements.txt

    # install packages to a temporary directory and zip it
    touch requirements.txt  # safeguard in case there are no packages
    pip3 install -r requirements.txt --target ./packages
}

function check_external_dependencies() {
  if [ -z "$(ls -A packages)" ]
  then
    touch packages/empty.txt
  fi
}

function zip_dependencies() {
  if [ ! -d packages ]
  then
    echo "ERROR - pip failed to import dependencies"
    exit 1
  fi
  cd packages || exit
  zip -9mrv packages.zip .
  mv packages.zip ..
  cd ..
}

function clean_stuff() {
  rm -rf packages
  rm requirements.txt
}

check_pipenv_installed
check_exists_piplock
install_requirements
check_external_dependencies
zip_dependencies
clean_stuff

exit 0
