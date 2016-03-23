#!/bin/bash

die() {
    echo "Error: $1"
    exit 1
}

rm input/root/input/* > /dev/null 2>&1 || die "Unable to delete input/root/input/*"
cp input/* input/root/input/ > /dev/null 2>&1

rm -rf input/root/include > /dev/null 2>&1
cp -r include input/root/include > /dev/null 2>&1

rm -rf src > /dev/null 2>&1 || die "Unable to delete src"
mkrepo input src include || die "Failed to make repository"

# move master branch to root
cd src
git reset --hard root

# no need for the root tag; get rid of it
git tag -d root

# make the dspace-1.5.0-src ref a root commit, permanently
git rev-parse dspace-1.5.0-src > .git/info/grafts
git filter-branch -- --all
rm -rf .git/refs/original

# drop all unused objects and refs, and pack everything
git reflog expire --expire=now --all
git gc --prune=now --aggressive
