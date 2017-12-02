#cat tab.py
#!/usr/bin/env python
# python startup file
import sys
import readline
import rlcompleter
import atexit
import os
# tab completion
import os,django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','adminset.settings')
django.setup()
readline.parse_and_bind('tab: complete')
# history file
histfile = os.path.join(os.environ['HOME'], '.pythonhistory')
try:
    readline.read_history_file(histfile)
except IOError:
    pass

atexit.register(readline.write_history_file, histfile)
del os, histfile, readline, rlcompleter
