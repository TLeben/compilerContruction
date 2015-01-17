#!/bin/bash
set -o nounset

echo -e "\n\n---->  BEGIN TESTING AT $(date --utc)  <----\n\n"

for sub_dir in arithmetic \
               input
do
	pushd ${sub_dir} > /dev/null
		./run_tests.sh
	popd > /dev/null
done

echo -e "\n\n---->  END   TESTING AT $(date --utc)  <----\n\n"
