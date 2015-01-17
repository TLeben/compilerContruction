#!/bin/bash
set -o nounset

echo
echo "----------------------"
echo "-- Arithmetic Tests --"
echo "----------------------"
echo

count=1
while [[ 1 -eq 1 ]];
do
	if [[ -d test${count} ]]; then
		pushd test${count} > /dev/null
			echo
			echo "-------------"
			echo "-- TEST ${count} --"
			echo "-------------"

			status=0

			if [[ ! -f test${count}.py && ! -f test${count}.in && ! -f test${count}.out ]]; then
				echo "One of the required test files is missing for test ->${count}<-"
				status=1
			else
				rm -f test${count}.result
				chmod 0755 test${count}.py
				./test${count}.py < test${count}.in > test${count}.result
				diff test${count}.out test${count}.result > /dev/null 2>&1
				status=$?
			fi

			if [[ ${status} -eq 0 ]]; then
				echo "TEST ${count} PASSED!"
			else
				echo "!!  TEST ${count} FAILED  !!"
			fi

			rm -f test${count}.result
			count=$((${count} + 1))
		popd > /dev/null
	else
		break
	fi
done

echo
echo "---------------------------------------------------"
echo
