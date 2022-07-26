#!/usr/bin/env python3

__author__ = "Dilawar Singh"
__copyright__ = "Copyright 2017-, Dilawar Singh"
__maintainer__ = "Dilawar Singh"
__email__ = "dilawars@ncbs.res.in"
__status__ = "Development"

import sys
import os
import subprocess
import multiprocessing
import threading
import re
import glob
import datetime
import signal
from collections import defaultdict
import shutil
import random

sdir_ = os.path.dirname(os.path.realpath(__file__))
willNotRun_ = defaultdict(set)
result_ = defaultdict(list)
pypath_ = sys.executable


def renormalize_path(path):
    return os.path.normpath(path)


def filter_scripts(filename):
    # filter scripts by criteria.
    global willNotRun_
    with open(filename, mode='r', encoding='utf-8') as f:
        txt = f.read()

    if not re.search(r'if\s+__name__\s+==\s+(\'|\")__main__(\'|\")\s*\:', txt):
        willNotRun_['NO_MAIN'].add(filename)
        return False

    if re.search(r'import\s+PyQt(4|5)|from\s+PyQt(4|5)\s+import', txt):
        willNotRun_['PYQT_REQUIRED'].add(filename)
        return False

    m = re.search(r'input\(\s*\)|raw_input\(\s*\)', txt)
    if m:
        #  print( "[INFO ] User input required in %s. Ignoring" % filename )
        #  print( "\t%s" % m.group(0) )
        willNotRun_['USER_INTERACTION'].add(filename)
        return False

    return True


def print_ignored():
    global willNotRun_
    with open('WILL_NOT_RUN', 'w') as f:
        for k in willNotRun_:
            fs = willNotRun_[k]
            fs = ['- [ ] %3d: %s' % (i, x) for i, x in enumerate(fs)]
            print(k, file=f)
            print('\n'.join(fs), file=f)
            print('\n\n', file=f)


def print_results():
    print("[INFO ] Printing results ...")
    global result_
    for k in result_:
        with open("%s.txt" % k, 'w') as f:
            for fl, r in result_[k]:
                f.write('- [ ] %s\n' % fl)
                f.write('```')
                try:
                    r = r.decode('utf8')
                except Exception as e:
                    pass
                f.write(str(r))
                f.write('```\n')
        print("[INFO ] Wrote files with status %s to %s.txt " % (k, k))

    for k in result_:
        print(k)
        for f, r in result_[k]:
            print(f)
        print('')

    if len(result_['FAILED']) > 0:
        for f, r in result_['FAILED']:
            print(f)
            print('```\n%s\n```\n' % r)
        quit(1)


def find_scripts_to_run(d):
    print("[INFO ] Searching for files in %s" % d)
    files = []
    for d, sd, fs in os.walk(d):
        d = renormalize_path(d)
        if d == sdir_:
            continue
        for f in fs:
            fname = renormalize_path(os.path.join(d, f))
            if fname.split('.')[-1] == 'py':
                files.append(fname)

    if os.environ.get('TRAVIS', '') or (not args.run_all):
        print("[INFO ] Running filters to exclude some files.")
        files = [f for f in files if filter_scripts(f)]
    return files


def execute(cmd, cwd, timeout=10):
    command = ' '.join(cmd)
    s = subprocess.run(cmd,
                       timeout=timeout,
                       cwd=cwd,
                       stdout=subprocess.PIPE,
                       stderr=subprocess.STDOUT)
    if s.returncode:
        print('\t' + str(s.stdout))
    return s


def run_script(filename, args):
    global sdir_
    global result_
    global pypath_
    # Run the script in the directory of file.
    tgtdir = os.path.dirname(os.path.realpath(filename))
    # copy matplotlibrc file to this directory.
    try:
        shutil.copy(os.path.join(sdir_, 'matplotlibrc'), tgtdir)
    except Exception as e:
        print(e)

    status = 'FAILED'
    stamp = datetime.datetime.now().isoformat()
    command = [sys.executable, filename]
    r = ''
    print('\t Executing %s' % filename)
    try:
        p = execute(command, tgtdir, args.timeout)
        r = p.stdout.decode('utf8')
        if p.returncode == 0:
            status = 'SUCCESS'
        else:
            status = 'FAILED'
    except subprocess.TimeoutExpired as e:
        status = 'TIMEOUT'
    print('[%s] %s' % (status, filename))
    result_[status].append((filename, r))
    if status == 'FAILED':
        if args.strict:
            quit(1)


def main(args):
    scripts = find_scripts_to_run(os.path.join(sdir_, '..'))
    print("[INFO ] Total %s scripts found" % len(scripts))
    print_ignored()

    if not args.run_all:
        scripts = random.sample(scripts, args.howmany)

    print('= Now running randomly selected %d files' % len(scripts))
    for i, f in enumerate(scripts):
        print('%3d/%d-' % (i, len(scripts)), end='')
        run_script(f, args)
    print_results()

    # if there is any FAILED script. Fail the build.
    if result_.get('FAILED', []):
        quit(1)


if __name__ == '__main__':
    import argparse
    # Argument parser.
    description = '''Run tests.'''
    parser = argparse.ArgumentParser(description=description)
    parser.add_argument('--python',
                        '-p',
                        required=False,
                        help='Python executable to run scripts.',
                        default=sys.executable)
    parser.add_argument(
        '--howmany',
        '-n',
        required=False,
        default=50,
        type=int,
        help='How many test to run. Default 50 (randomly sampled)')
    parser.add_argument('--timeout',
                        '-t',
                        required=False,
                        default=30,
                        type=float,
                        help=' Timeout at running tests.')
    parser.add_argument('--strict',
                        '-s',
                        action='store_true',
                        default=False,
                        help='Stop at first failure.')
    parser.add_argument('--run-all',
                        '-a',
                        action='store_true',
                        default=False,
                        help='Run all scripts dont run filter')

    class Args:
        pass

    args = Args()
    parser.parse_args(namespace=args)
    main(args)
