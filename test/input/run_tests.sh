#!/bin/bash
set -o nounset

readonly COMPILER_DIR=${1:-}
readonly RUNTIME_DIR=${2:-}

echo
echo
echo -e "\t\t\t-----------------"
echo -e "\t\t\t-- Input Tests --"
echo -e "\t\t\t-----------------"
echo
echo


# if a test fails we might end up in a random directory
top_dir="$(pwd)"

good_count=0
bad_count=0

for count in {1..100}
do
	cd ${top_dir}

	if [[ -d test${count} ]]; then
		pushd test${count} > /dev/null
			echo
			echo "-------------"
			echo "-- TEST ${count} --"
			echo "-------------"

			if [[ ! -f test${count}.py && ! -f test${count}.in && ! -f test${count}.out ]]; then
				echo "One of the required test files is missing for test ->${count}<-"
				bad_count=$((${bad_count} + 1))
				continue
			fi

			# setup the test
			input_py="$(pwd)/test${count}.py"
			output_s="$(pwd)/test${count}.s"
			output_exe="$(pwd)/test${count}.exe"
			stdin_file="$(pwd)/test${count}.in"
			stdout_file="$(pwd)/test${count}.result"

			rm -f ${output_s}
			rm -f ${output_exe}
			rm -f ${stdout_file}

			# compile the python input file
			pushd ${COMPILER_DIR} > /dev/null
				./compile.py ${input_py}
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
			diff test${count}.out test${count}.result > /dev/null 2>&1

			if [[ $? -eq 0 ]]; then
				echo "TEST ${count} PASSED!"
				good_count=$((${good_count} + 1))
			else
				echo "!!  TEST ${count} FAILED  !!"
				bad_count=$((${bad_count} + 1))
			fi

			# teardown the test
			rm -f ${output_s}
			rm -f ${output_exe}
			rm -f ${stdout_file}
		popd > /dev/null
	else
		break
	fi
done

echo
echo
echo -e "\t\t\t~~~~~~~~~~~~~~~~~"
echo -e "\t\t\tTests Passed:  ${good_count}"
echo -e "\t\t\tTests Failed:  ${bad_count}"
echo -e "\t\t\t~~~~~~~~~~~~~~~~~"
echo
echo

