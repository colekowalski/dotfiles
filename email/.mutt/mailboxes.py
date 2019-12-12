#!/usr/bin/env python

from __future__ import print_function

import os

TOPDIR = '/home/cole/.mail/'

# The presence of these subdirectories within a directory indicates
# that the directory is a maildir
IMAP_DIRS = set(['cur', 'new', 'tmp'])

# Do not include these mailboxes in the mailbox list. Only the folder
# name is checked so ignores are global and applied across all
# accounts
IGNORED_MAILBOXES = [
    'Trash',
    'Deleted Items',
]


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


def is_ignored(mailbox):
    path = os.path.normpath(mailbox)
    parts = path.split(os.sep)
    return parts[-1] in IGNORED_MAILBOXES


def get_mailboxes(path):
    mailboxes = []
    subdirs = get_subdirs(path)
    if len(subdirs) < 1:
        return mailboxes

    # Ignore both the maildir itself as well as any subfolders if the
    # maildir is in the ignored list
    if is_ignored(path):
        return mailboxes

    for subdir in [d for d in subdirs if os.path.basename(d) not in IMAP_DIRS]:
        if is_ignored(subdir):
            continue
        mailboxes += get_mailboxes(subdir)

    # Only include the current path if it is a valid maildir
    if is_maildir(subdirs):
        mailboxes.append(path)

    return mailboxes


def escape_path(path):
    path = path.replace(' ', '\\ ')
    return path


mailboxes = []
for acct in get_subdirs(TOPDIR):
    if os.path.basename(acct) in set(['grooveshark']):
        continue
    mailboxes += get_mailboxes(acct)
mailboxes = [escape_path(x) for x in mailboxes]
print(' '.join(sorted(mailboxes)))
