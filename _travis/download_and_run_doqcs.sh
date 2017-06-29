#!/usr/bin/env bash

source colors.sh

# Download all models.
wget -q -A"*.g" -r https://doqcs.ncbs.res.in/database/simfile/
echo "Done downloading"

MODELS=`find . -type f -name "*.g"`
for _model in ${MODELS}; do
    OUT=$(python -c "
import moose
moose.loadModel( '${_model}', '/model', 'gsl' )
")
    OUTTRIMMED=`echo $OUT | xargs`
    if [[ ! -z $OUTTRIMMED ]]; then 
        colorPrint "WARN" "$_model did not load cleanly..."
        echo $OUTTRIMMED
    else
        colorPrint "INFO" "$_model loaded just fine. We did not run it"
    fi
done
