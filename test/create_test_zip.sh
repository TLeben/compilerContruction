#!/bin/bash
set -o nounset

zip_file="tm-tests.zip"
tmp_dir="/tmp/hw_zip"

rm -fr ${tmp_dir}
mkdir -p ${tmp_dir}

for sub_dir in arithmetic \
               input
do
	pushd ${sub_dir} > /dev/null
		count=1
		while [[ 1 -eq 1 ]]
		do
			if [[ -d test${count} ]]; then
				cp -f test${count}/test${count}.py ${tmp_dir}/${sub_dir}_test${count}.py
				cp -f test${count}/test${count}.in ${tmp_dir}/${sub_dir}_test${count}.in
			else
				break
			fi
			count=$((${count} + 1))
		done
	popd > /dev/null
done


rm -f ${zip_file}
zip -qrj ${zip_file} ${tmp_dir}/*.py ${tmp_dir}/*.in
rm -fr ${tmp_dir}
