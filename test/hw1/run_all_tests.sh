#!/bin/bash
set -o nounset

readonly COMPILER_DIR="${1:-}"
readonly RUNTIME_DIR="${2:-}"

for sub_dir in arithmetic \
               input
do
    echo
    echo "--------->  BEGIN ${sub_dir}  <----------"
	pushd ${sub_dir} > /dev/null
		./run_tests.sh ${COMPILER_DIR} ${RUNTIME_DIR}
	popd > /dev/null
    echo "--------->  END ${sub_dir}  <----------"
    echo
done

