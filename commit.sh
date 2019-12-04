#!/bin/bash

echo "status ================================="
git status
echo "add ===================================="
git add .
echo "commit ================================="
git commit -a -m "At `date +'%m%d%H%M'`"
echo "push ==================================="
git push
echo "done ==================================="
