# Project to test the scripts.
cmake_minimum_required(VERSION 2.8)
project(moose-examples LANGUAGES)  

# Pass PYTHON_EXECUTABLE from command line to use a  different one.
find_package( PythonInterp REQUIRED )
message( STATUS "Found ${PYTHON_EXECUTABLE}" )

# Now find all python files.
add_custom_target( lint ALL )
file( GLOB_RECURSE PY_SCRIPTS *.py )

set( TEST_DATA_DIR "${CMAKE_CURRENT_BINARY_DIR}/_cmake_test_data" )
file( MAKE_DIRECTORY ${TEST_DATA_DIR} )

foreach( _script ${PY_SCRIPTS} )
    get_filename_component( _script_filename ${_script} NAME )
    get_filename_component( _script_dirname ${_script} DIRECTORY )
    message( STATUS "Checking ${FILENAME}" )

    set(STATUS_FILE "${TEST_DATA_DIR}/_status_${_script_filename}" )
    add_custom_target( "check_${_script_filename}" DEPENDS ${STATUS_FILE})
    add_custom_command( OUTPUT ${STATUS_FILE}
        COMMAND ${PYTHON_EXECUTABLE} -c ${_script} 
        COMMENT "Compiling with ${PYTHON_EXECUTABLE}"
        WORKING_DIR ${_script_dirname} 
        VERBATIM 
        )

endforeach( )

