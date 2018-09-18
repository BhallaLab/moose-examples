#!/usr/bin/env python3
"""run_travis.py: 

Run test on travis.

"""
    
__author__           = "Dilawar Singh"
__copyright__        = "Copyright 2017-, Dilawar Singh"
__version__          = "1.0.0"
__maintainer__       = "Dilawar Singh"
__email__            = "dilawars@ncbs.res.in"
__status__           = "Development"

import sys
import os
import subprocess
import multiprocessing
import re
import glob
import signal
from collections import defaultdict

sdir_       = os.path.dirname( os.path.realpath( __file__) )
willNotRun_ = defaultdict(set)
timeout_    = 30

def renormalize_path( path ):
    global sdir_
    ps = []
    for i, s in enumerate(path.split(os.sep)):
        if s == '..':
            ps.pop()
            continue
        ps.append(s)
    return os.sep + os.path.join(*ps)


def filter_scripts( filename ):
    # filter scripts by criteria.
    global willNotRun_
    with open( filename, 'r' ) as f:
        txt = f.read()

    if not re.search( r'if\s+__name__\s+==\s+(\'|\")__main__(\'|\")\s*\:', txt):
        willNotRun_['NO_MAIN'].add(filename)
        return False

    m = re.search( r'input\(\s*\)|raw_input\(\s*\)', txt)
    if m:
        #  print( "[INFO ] User input required in %s. Ignoring" % filename )
        #  print( "\t%s" % m.group(0) )
        willNotRun_['USER_INTERACTION'].add(filename)
        return False

    return True

def print_ignored( ):
    global willNotRun_
    for k in willNotRun_:
        fs = willNotRun_[k]
        fs = [ '- [ ] %3d: %s' % (i,x) for i, x in enumerate(fs) ]
        print( k )
        print( '\n'.join(fs) )
        print( '\n\n' )

def find_scripts_to_run( d ):
    print( "[INFO ] Searching for files in %s"  % d )
    files = []
    for d, sd, fs in os.walk( d ):
        for f in fs:
            fname = os.path.join(d, f)
            fname = renormalize_path(fname)
            if fname.split( '.' )[-1] == 'py':
                files.append( fname )
    files = list(filter(filter_scripts, files))
    return files

def run_script( filename ):
    import shutil
    global sdir_
    # Run the script in the directory of file.
    tgtdir = os.path.dirname( os.path.realpath( filename ) )
    # copy matplotlibrc file to this directory.
    shutil.copy( os.path.join( sdir_, 'matplotlibrc' ), tgtdir )
    res = subprocess.run( [ "python", filename ], cwd = tgtdir, timeout = timeout_
            , stdout = subprocess.PIPE
            , stderr = subprocess.PIPE
            )

    if res.returncode == 0:
        print( "PASSED: %s" % filename )
    else:
        print( "FAILED: %s" % filename )
        print( res.stderr )

def init_worker( ):
    signal.signal( signal.SIGINT, signal.SIG_IGN )

def run_all( scripts, workers = 2 ):
    pool = multiprocessing.Pool( workers, init_worker )
    try:
        pool.map( run_script, scripts )
    except KeyboardInterrupt as e:
        print( "[INFO ] Keyboard interrupt. Shutting down" )
        pool.terminate()
        pool.join()
    return True

def main():
    scripts = find_scripts_to_run(os.path.join(sdir_, '..'))
    print( "[INFO ] Total %s scripts found" % len(scripts) )
    print_ignored( )
    print( '== Now running files' )
    run_all( scripts )

if __name__ == '__main__':
    main()

