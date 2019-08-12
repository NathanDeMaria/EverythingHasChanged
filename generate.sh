#!/bin/bash

REQUIREMENTS_FILE=/env/requirements.txt
ENV_FILE=/env/env.yaml
OUT_FILE=/env/full-requirements.txt
OUT_ENV_FILE=/env/full-env.yaml

if [ -e ${REQUIREMENTS_FILE} ]
then
    pip install -r ${REQUIREMENTS_FILE}
    pip freeze > ${OUT_FILE}
    # copy all lines starting with -- from the old one into the new one.
    grep ^-- ${REQUIREMENTS_FILE} >> ${OUT_FILE}
elif [ -e ${ENV_FILE} ]
then
    conda env update -f ${ENV_FILE} -n base
    # sed to remove "prefix: /path/to/miniconda/"
    conda env export -n base | sed -e 's/^prefix:.*//' > ${OUT_ENV_FILE}
    # copy all lines starting with "- --" from the old one into the new one.
    grep "^[ ]*- --" ${ENV_FILE} >> ${OUT_ENV_FILE}
else
    echo "Must include a requirements.txt or env.yaml file in the mounted volume"
    exit 1
fi
