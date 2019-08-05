#!/bin/bash

REQUIREMENTS_FILE=/env/requirements.txt
OUT_FILE=/env/full-requirements.txt

if [ ! -e ${REQUIREMENTS_FILE} ]
then
    echo "Must include a requirements.txt file in the mounted volume"
    exit 1
fi

pip install -r ${REQUIREMENTS_FILE}

pip freeze > ${OUT_FILE}
# copy all lines starting with -- from the old one into the new one.
grep ^-- ${REQUIREMENTS_FILE} >> ${OUT_FILE}
