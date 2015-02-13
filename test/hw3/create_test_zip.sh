#!/bin/bash
set -o nounset

zip_file="TangoMikes-tests.zip"
tmp_dir="/tmp/test_zip"

rm -fr ${tmp_dir}
mkdir -p ${tmp_dir}

for sub_dir in $(ls -d */)
do
	sub_dir=${sub_dir%/}
	pushd ${sub_dir} > /dev/null
		count=1
		while [[ 1 -eq 1 ]]
		do
			if [[ -d test${count} ]]; then
				cp -vf test${count}/test${count}.py ${tmp_dir}/${sub_dir}_test${count}.py
				cp -vf test${count}/test${count}.in ${tmp_dir}/${sub_dir}_test${count}.in
			else
				break
			fi
			count=$((${count} + 1))
		done
	popd > /dev/null
done

rm -f ${zip_file}
zip -qrj ${zip_file} ${tmp_dir}/*
rm -fr ${tmp_dir}
