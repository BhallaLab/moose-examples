#!/usr/bin/env python

__author__           = "Dilawar Singh"
__copyright__        = "Copyright 2017-, Dilawar Singh"
__version__          = "1.0.0"
__maintainer__       = "Dilawar Singh"
__email__            = "dilawars@ncbs.res.in"
__status__           = "Development"

import sys
import os
import subprocess32 as subprocess
import multiprocessing
import re
import glob
import datetime
import signal
from collections import defaultdict
import shutil

sdir_       = os.path.dirname( os.path.realpath( __file__) )
willNotRun_ = defaultdict(set)
result_     = defaultdict(list)

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

def print_results( ):
    print( "[INFO ] Printing results ..." )
    global result_
    for k in result_:
        with open( "%s.txt" % k, 'w' ) as f:
            for f, r in result_[k]:
                f.write( '- %s\n' % f )
                f.write( '```' )
                f.write( r )
                f.write( '```\n')
        print("[INFO ] Wrote files with status %s to %s.txt " % (k,k))

    for k in result_:
        print( k )
        for f, r in result_[k]:
            print( f )
        print( '' )

    if len(result_['FAILED']) > 0:
        for f, r in result_['FAILED']:
            print( f )
            print( '```\n%s\n```\n' % r )
        quit(1)

def find_scripts_to_run( d ):
    print( "[INFO ] Searching for files in %s"  % d )
    files = []
    for d, sd, fs in os.walk( d ):
        for f in fs:
            fname = os.path.join(d, f)
            if '.travis' in fname:
                continue
            fname = renormalize_path(fname)
            if fname.split( '.' )[-1] == 'py':
                timeout = 20
                if 'traub_2015' in fname:
                    timeout = 5
                files.append( (fname,timeout) )

    files = list(filter(filter_scripts, files))
    return files

def run_script( filename, timeout = 30 ):
    global sdir_
    global result_
    # Run the script in the directory of file.
    tgtdir = os.path.dirname( os.path.realpath( filename ) )
    # copy matplotlibrc file to this directory.
    try:
        shutil.copy( os.path.join( sdir_, 'matplotlibrc' ), tgtdir )
    except Exception as  e:
        pass

    status = 'FAILED'
    res = None
    try:
        res = subprocess.run( [ "python", filename ], cwd = tgtdir
                , timeout = timeout
                , stdout = subprocess.PIPE
                , stderr = subprocess.PIPE
                )
        if res.returncode == 0:
            status = 'PASSED'
        else:
            status = 'FAILED'
    except subprocess.TimeoutExpired as e:
        status = 'TIMEOUT'

    stamp = datetime.datetime.now().isoformat()
    print( '[%s] %10s %s' % (stamp, status,filename) )

    if res is not None:
        result_[status].append( (filename,res.stdout+res.stderr) )
    else:
        result_[status].append( (filename,'UNKNOWN') )

def main():
    scripts = find_scripts_to_run(os.path.join(sdir_, '..'))
    print( "[INFO ] Total %s scripts found" % len(scripts) )
    print_ignored( )
    print( '== Now running  %d files' % len(scripts) )
    for i, (x,t) in enumerate(scripts):
        print( '%.2f\% - ' % 100.0*i/x, end = '' )
        run_script( x, t )
    print_results()

if __name__ == '__main__':
    main()
