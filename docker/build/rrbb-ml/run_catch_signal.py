#!/usr/bin/env python3

import os
import sys
import time
import signal
import logging


shared_dir, log_filename = sys.argv[1:]
log_path = os.path.join(shared_dir, log_filename)

logging.basicConfig(filename=log_path, level=logging.DEBUG)
LOGGER = logging.getLogger()

signal_dict = {
    '1': 'SIGHUP',
    '2': 'SIGINT',
    '3': 'SIGQUIT',
    '4': 'SIGILL',
    '5': 'SIGTRAP',
    '6': 'SIGABRT',
    '7': 'SIGBUS',
    '8': 'SIGFPE',
    '9': 'SIGKILL',
    '10': 'SIGUSR1',
    '11': 'SIGSEGV',
    '12': 'SIGUSR2',
    '13': 'SIGPIPE',
    '14': 'SIGALRM',
    '15': 'SIGTERM',
    }


def receive_signal(signal_number, frame):
    msg = 'Received %s' % signal_dict[str(signal_number)]
    LOGGER.info(msg)

if __name__ == '__main__':
    signal.signal(signal.SIGHUP, receive_signal)
    signal.signal(signal.SIGINT, receive_signal)
    signal.signal(signal.SIGQUIT, receive_signal)
    signal.signal(signal.SIGILL, receive_signal)
    signal.signal(signal.SIGTRAP, receive_signal)
    signal.signal(signal.SIGABRT, receive_signal)
    signal.signal(signal.SIGBUS, receive_signal)
    signal.signal(signal.SIGFPE, receive_signal)
    #signal.signal(signal.SIGKILL, receive_signal)
    signal.signal(signal.SIGUSR1, receive_signal)
    signal.signal(signal.SIGSEGV, receive_signal)
    signal.signal(signal.SIGUSR2, receive_signal)
    signal.signal(signal.SIGPIPE, receive_signal)
    signal.signal(signal.SIGALRM, receive_signal)
    signal.signal(signal.SIGTERM, receive_signal)

    LOGGER.info('start')

    while True:
        LOGGER.info('waiting...')
        time.sleep(3)
