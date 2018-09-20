# -*- coding: utf-8 -*-
from __future__ import print_function
"""setup.py: 
"""
    
__author__           = "Dilawar Singh"
__copyright__        = "Copyright 2017-, Dilawar Singh"
__version__          = "1.0.0"
__maintainer__       = "Dilawar Singh"
__email__            = "dilawars@ncbs.res.in"
__status__           = "Development"

import subprocess
import os
import datetime
import sys
from distutils.core import setup

with open("README.md") as f:
    readme = f.read()

stamp = datetime.datetime.now().strftime( "%Y%m%d" )
gitTag = subprocess.check_output( [ 'git', 'describe', '--tags' ] )
try:
    gitTag = gitTag.decode( )
except Exception as e:
    print( e )
    pass
VERSION = '%s%s' % (gitTag.strip(), stamp)
print( "[INFO ] Version: %s" % VERSION )


classifiers = [
    'Operating System :: OS Independent',
    'Programming Language :: Python'
    ]

setup(
    name = "pymoose-examples",
    version = VERSION,
    description = "Example, demo and tutorials",
    long_description = readme,
    install_requires = [ 'pymoose' ],
    author = "See AUTHORS.md file.",
    author_email = "bhalla@ncbs.res.in",
    url = "http://github.com/BhallaLab/moose-examples",
    license='GPLv3',
    classifiers=classifiers,
)
