#!/bin/bash

# An array containing the names of the functions to be deleted:
_exclude_list=( ds.asCharacter \
               ds.asFactor \
               ds.asList \
               ds.asMatrix \
               ds.asNumeric \
               ds.assign \
               ds.c \
               ds.cbind \
               ds.changeRefGroup \
               ds.dataframe \
               ds.isValid
               ds.list \
               ds.names \
               ds.recodeLevels \
               ds.rowColCalc \
               ds.vectorCalc )


delete_functions() {
# Iterate through the elements in the array above:
    for i in ${_exclude_list[@]}; do
# if an R file exists with the same name as the array element, delete it:
        if [[ -f "${i}.R" ]]; then
            rm "${i}.R" && echo "Removed $i.R"
        fi
    done
}


## script

# Get the dsBaseClient code
git clone https://github.com/datashield/dsBaseClient.git

# Delete the functions named in the exclude list above
cd dsBaseClient/R
delete_functions
cd -

# Rename the code directory
mv dsBaseClient dsBaseClientSingleSite
