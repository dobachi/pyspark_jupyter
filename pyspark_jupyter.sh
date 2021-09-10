#!/bin/bash

########################################################
# pyspark_jupyter
#
# This script is a helper script to run Jupyter Lab
# with PySpark in your environment.
# 
# You can modify or define environmental variables
# to overwrite the internal parameters.
########################################################

# Note:
# Use .profile to define private environmental vairables
# e.x. OPTIONS
if [ -e .profile ]; then
. .profile
fi

# Note: Please modify the following variables or define variables in andvance accoriding to your environments

export PYSPARK_DRIVER_PYTHON=${PYSPARK_DRIVER_PYTHON:-jupyter}

## Note: By default, we use Jupyter Lab but you can use such as Jupyter notebook by modifying 'lab' -> 'notebook'
export PYSPARK_DRIVER_PYTHON_OPTS=${PYSPARK_DRIVER_PYTHON_OPTS:-lab --ip=0.0.0.0 --no-browser}

## Note: You can use any AWS profile to execute Jupyter Lab by uncommenting the following.
# export AWS_PROFILE=${delta_sharing:-delta_sharing}

export SPARK_LOCAL_IP=${SPARK_LOCAL_IP:-localhost}

## Note: By default, I use downloaded Spark package but you can use any Spark binaries.
export SPARK_HOME=${SPARK_HOME:-/usr/local/spark/default}
PYSPARK_BIN=${PYSPARK_BIN:-/usr/local/spark/default/bin/pyspark}

${PYSPARK_BIN} ${OPTIONS}
