#!/bin/bash
set -o nounset

for sub_dir in $(ls -d */)
do
	sub_dir=${sub_dir%/}

    echo
    echo "--------->  BEGIN ${sub_dir}  <----------"
	pushd ${sub_dir} > /dev/null
		./run_all_tests.sh
	popd > /dev/null
    echo "--------->  END ${sub_dir}  <----------"
    echo
done

