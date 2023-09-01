import os

CONTAINING_FOLDER = 'sync_pmdsky_debug'
if os.getcwd().endswith(CONTAINING_FOLDER):
    os.chdir(os.path.join('..', '..'))
