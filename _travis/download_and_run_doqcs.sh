#!/usr/bin/env bash

source colors.sh

colorPrint "INFO" "Downloading DOQCS database silently"
# Download all models.
wget -q -A"*.g" -r https://doqcs.ncbs.res.in/database/simfile/
colorPrint "INFO" "Done downloading"

MODELS=`find . -type f -name "*.g"`
for _model in ${MODELS}; do
    echo "===================================================================="
    colorPrint "INFO" "Running $_model for 1 sec"
    T1=$(date +%s.%N)
    OUT=$(timeout 3m python -c "
import moose
moose.loadModel( '${_model}', '/model', 'gsl' )
moose.reinit( )
moose.start( 1 )
")
    T2=$(date +%s.%N)
    DT=$(echo "$T2-$T1" | bc)
    OUTTRIMMED=`echo $OUT | xargs`
    colorPrint "INFO" "TOOK $DT seconds to run 1 sec."
    if [[ ! -z $OUTTRIMMED ]]; then 
        colorPrint "WARN" "$_model did not load/run cleanly"
        echo $OUTTRIMMED
    else
        colorPrint "INFO" "$_model loaded just fine. We did NOT check output results"
    fi
done
