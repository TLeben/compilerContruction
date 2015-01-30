#!/bin/bash
set -o nounset

readonly COMPILER_DIR=${1:-}
readonly RUNTIME_DIR=${2:-}

# if a test fails we might end up in a random directory
top_dir="$(pwd)"

good_count=0
bad_count=0

for sub_dir in $(ls -d */)
do
	cd ${top_dir}

	test_name=${sub_dir%/}

	pushd ${test_name} > /dev/null
		echo
		echo "------------------"
		echo "-- TEST ${test_name} --"
		echo "------------------"

		if [[ ! -f ${test_name}.py && ! -f ${test_name}.in && ! -f ${test_name}.out ]]; then
			echo "One of the required test files is missing for test ->${test_name}<-"
			bad_count=$((${bad_count} + 1))
			continue
		fi

		# setup the test
		input_py="$(pwd)/${test_name}.py"
		output_s="$(pwd)/${test_name}.s"
		output_exe="$(pwd)/${test_name}.exe"
		stdin_file="$(pwd)/${test_name}.in"
		stdout_file="$(pwd)/${test_name}.result"

		rm -f ${output_s}
		rm -f ${output_exe}
		rm -f ${stdout_file}

		# compile the python input file
		pushd ${COMPILER_DIR} > /dev/null
			python compile.py ${input_py}
		popd > /dev/null

		if [[ ! -f ${output_s} ]]; then
			echo "Could not locate assembly file!  Compiler must have failed!"
			bad_count=$((${bad_count} + 1))
			continue
		fi

		# compile the assembly into an executable
		pushd ${RUNTIME_DIR} > /dev/null
			make clean
			make INPUT="${output_s}" OUTPUT="${output_exe}"
		popd > /dev/null

		if [[ ! -f ${output_exe} ]]; then
			echo "Could not locate executable!  Compilation must have failed!"
			bad_count=$((${bad_count} + 1))
            rm -f ${output_s}
			continue
		fi

		# run the executable and compare expected results
		${output_exe} < ${stdin_file} > ${stdout_file}
		diff ${test_name}.out ${test_name}.result > /dev/null 2>&1

		if [[ $? -eq 0 ]]; then
			echo "TEST ${test_name} PASSED!"
			good_count=$((${good_count} + 1))
		else
			echo "!!  TEST ${test_name} FAILED  !!"
			bad_count=$((${bad_count} + 1))

			# save off the results for post-mortem analysis
			save_dir="/tmp/${test_name}"
			rm -fr ${save_dir}
			mkdir -p ${save_dir}
			cp -f ${input_py} ${save_dir}
			cp -f ${output_s} ${save_dir}
			cp -f ${output_exe} ${save_dir}
			cp -f ${stdin_file} ${save_dir}
			cp -f ${stdout_file} ${save_dir}
			cp -f ${test_name}.out ${save_dir}
		fi

		# teardown the test
		rm -f ${output_s}
		rm -f ${output_exe}
		rm -f ${stdout_file}
	popd > /dev/null
done

echo
echo
echo -e "\t\t\t~~~~~~~~~~~~~~~~~"
echo -e "\t\t\tTests Passed:  ${good_count}"
echo -e "\t\t\tTests Failed:  ${bad_count}"
echo -e "\t\t\t~~~~~~~~~~~~~~~~~"
echo
echo

