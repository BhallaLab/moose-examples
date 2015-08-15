#!/usr/bin/python

"""test_all_scripts.py: 

    This script tests scripts in this repository.

"""
    
__author__           = "Dilawar Singh"
__copyright__        = "Copyright 2015, Dilawar Singh and NCBS Bangalore"
__credits__          = ["NCBS Bangalore"]
__license__          = "GNU GPL"
__version__          = "1.0.0"
__maintainer__       = "Dilawar Singh"
__email__            = "dilawars@ncbs.res.in"
__status__           = "Development"

import os
from collections import defaultdict
import subprocess
import logging
import tempfile
import shutils

blacklisted_files_ = []
interactive_files_ = []

with open("BLACKLISTED", "r") as bf:
    blacklisted_files_ = bf.read().split("\n")
with open("INTERACTIVE", "r") as bf:
    interactive_files_ = bf.read().split("\n")

logging.basicConfig(level=logging.DEBUG,
    format='%(asctime)s %(name)-12s %(levelname)-8s %(message)s',
    datefmt='%m-%d %H:%M',
    filename='test.log',
    filemode='w'
    )

# define a Handler which writes INFO messages or higher to the sys.stderr
console = logging.StreamHandler()
console.setLevel(logging.INFO)
# set a format which is simpler for console use
formatter = logging.Formatter('%(name)-12s: %(levelname)-8s %(message)s')
# tell the handler to use this format
console.setFormatter(formatter)
# add the handler to the root logger
logging.getLogger('').addHandler(console)
_logger = logging.getLogger('')


scripts_ = defaultdict(list)

def run_file(directory, f):
    _logger.info("Running file %s" % filepath)
    # Copy matplotlibrc file to running directory
    output = None
    try:
        command = ["python", filepath]
        output = subprocess.check_output(command)
    except:
        logging.warn("Failed to run: %s" % output)

def test_dir(directory, fileList):
    shutils.copytree(directory, '/tmp')
    for f in fileList:
        filepath = os.path.join(directory, f)
        with open(filepath, "r") as f:
            filetext = f.read()
        if "main(" in filetext:
            _logger.info("This script contains main function")
            run_file(directory, f)
        else:
            _logger.debug("Does not contain main function. Don't run")


def testDirectories():
    global scripts_
    for d in scripts_:
        _logger.info("Testing in directory %s" % d)
        test_dir(d, scripts_[d])

def main():
    for d, sd, fs in os.walk('.'):
        for f in fs:
            if ".py" in f:
                scripts_[d].append(f)
    testDirectories()

if __name__ == '__main__':
    main()
