cmake_minimum_required(VERSION 3.0)
project(moose-examples LANGUAGES)

find_package(PythonInterp REQUIRED)

# read the TORUN file.
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/TORUN FILESTORUN)
string(REPLACE "\n" ";" FILESTORUN ${FILESTORUN})

# set variables
set(TIMEOUT 30s)
set(BLACKLISTED_FILE ${CMAKE_CURRENT_BINARY_DIR}/BLACKLISTED)
set(SUCCEEDED_FILE ${CMAKE_CURRENT_BINARY_DIR}/SUCCEEDED)
set(TEMP_FILE ${CMAKE_CURRENT_BINARY_DIR}/TEMP)
set(PYV ${PYTHON_EXECUTABLE})

configure_file( ${CMAKE_CURRENT_SOURCE_DIR}/run.sh.in
    ${CMAKE_BINARY_DIR}/run.sh)

add_custom_target( run_all ALL)

foreach( _script ${FILESTORUN})
    message(STATUS "Script to run ${_script}")
    set(OUTFILE "NONE" )

    get_filename_component(TGT_NAME ${_script} NAME_WE)

    add_custom_target( ${TGT_NAME}
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/run.sh "${_script}"
        DEPENDS ${_script}
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Executing ${_script} ."
        VERBATIM
        )

    add_dependencies( run_all ${TGT_NAME})

endforeach()

# before we run, make sure to run find_files to run script.
add_custom_command(TARGET run_all PRE_BUILD
    COMMAND bash -c ${CMAKE_CURRENT_SOURCE_DIR}/find_scripts_to_run.sh
    VERBATIM
    COMMENT "Searching files to execute."
    )
