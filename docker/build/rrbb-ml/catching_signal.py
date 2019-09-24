#!/usr/bin/env python3

import os
import sys
import time
import signal
import logging

log_dir, log_filename = sys.argv[1:]
log_path = os.path.join(log_dir, log_filename)
log_format = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
logging.basicConfig(format=log_format, filename=log_path, level=logging.DEBUG)

LOGGER = logging.getLogger(__name__)

signal_dict = {
        1: 'SIGHUP',
        2: 'SIGINT',
        3: 'SIGQUIT',
        9: 'SIGKILL',
        15: 'SIGTERM',
    }

def catch_signal(signal_number, frame):
    msg = 'Catched signal: ' + signal_dict[signal_number]
    LOGGER.info(msg)

if __name__ == '__main__':
    signal.signal(signal.SIGHUP, catch_signal)
    signal.signal(signal.SIGINT, catch_signal)
    signal.signal(signal.SIGQUIT, catch_signal)
    signal.signal(signal.SIGTERM, catch_signal)
    
    LOGGER.info('test started')
    
    while True:
        LOGGER.info('Waiting..')
        time.sleep(3)
