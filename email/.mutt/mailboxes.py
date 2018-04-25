#!/usr/bin/env python

from __future__ import print_function

import os
import re
import sys


TOPDIR = '/home/cole/.mail/'
IMAP_DIRS = set(['cur', 'new', 'tmp'])

def get_subdirs(path):
    dirs = []
    for subdir in os.listdir(path):
        full_subdir = os.path.join(path, subdir)
        if not os.path.isdir(full_subdir):
            continue
        dirs.append(full_subdir)
    return dirs


def is_maildir(subdirs):
    return 'cur' in [os.path.basename(d) for d in subdirs]


def get_mailboxes(path):
    mailboxes = []
    subdirs = get_subdirs(path)
    if len(subdirs) < 1:
        return mailboxes

    for subdir in [d for d in subdirs if os.path.basename(d) not in IMAP_DIRS]:
        mailboxes += get_mailboxes(subdir)

    if is_maildir(subdirs) or len(mailboxes) > 0:
        mailboxes.append(path)

    return mailboxes


def escape_path(path):
    path = path.replace(' ', '\\ ')
    #path = path.replace('[', '\\[')
    #path = path.replace(']', '\\]')
    return path


mailboxes = []
for acct in get_subdirs(TOPDIR):
    if os.path.basename(acct) in set(['grooveshark']):
        continue
    mailboxes += get_mailboxes(acct)
#mailboxes = get_mailboxes(TOPDIR)
mailboxes = [escape_path(x) for x in mailboxes]
print(' '.join(sorted(mailboxes)))
