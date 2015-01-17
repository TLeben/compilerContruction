#!/bin/bash
set -o nounset

zip_file="tm-tests.zip"

rm -f ${zip_file}
zip -rj ${zip_file} test*/test*.py test*/test*.in
