#!/bin/bash
# bash strict mode
set -eu pipefail
IFS=$'\n\t'

err() {
  echo "$@" >&2
}

make cython

echo "Building distribution"
python setup.py clean
python setup.py build_ext --inplace
python setup.py sdist --formats=gztar
