# DSpace Abridged Code Repository

This _unofficial_ git repository contains tagged snapshots for all stable
[DSpace](http://dspace.org) releases since 1.5.0.

For each release, there are two related tags:

* ```dspace-version-src``` is a snapshot of the source tree at the time of
  the release.
* ```dspace-version-rel``` is a snapshot of the official non-source release.

The tagged commits are designed to make ```git blame```, ```git diff```,
and ```git log``` output as useful as possible:

* All ```-src``` tags have one parent, which matches the stable release from
  which they were originally descended.
* All ```-rel``` tags have one parent, which is the ```-src``` tag for the
  same release.
* Dates for all ```-src``` tags match the latest commit date for the
  associated release as closely as possible.
* Dates for all ```-rel``` tags match the original release date.
* The author and committer names indicate the DSpace release version.
* The log messages contain links to the github page for the relevant tagged
  commit in the
  [official DSpace code repository](https://github.com/dspace/dspace).

This repository was originally created with the help of
[mkrepo](https://github.com/cwilper/mkrepo). See the ```build.sh``` script
and the ```include``` and ```input``` directories in this branch for details.
