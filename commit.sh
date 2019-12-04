#!/bin/bash

git status
git add .
git commit -a -m "At `date +'%m%d%H%M'`"
git push
