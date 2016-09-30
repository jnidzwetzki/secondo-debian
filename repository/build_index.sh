#!/bin/bash

dpkg-scanpackages  -m  ./ /dev/null | gzip > Packages.gz
