#!/bin/bash
set -o nounset

echo -e "\n\n---->  BEGIN TESTING AT $(date --utc)  <----\n\n"

count=1
while [[ 1 -eq 1 ]];
do
	if [[ -d test${count} ]]; then
		pushd test${count} > /dev/null
			echo
			echo "--------------------"
			echo "-- TEST ${count} --"
			echo "--------------------"

			rm -f test${count}.result
			./test${count}.py < test${count}.in > test${count}.result
			diff test${count}.out test${count}.result > /dev/null 2>&1

			if [[ $? -eq 0 ]]; then
				echo "TEST ${count} PASSED!"
			else
				echo "TEST ${count} FAILED!"
			fi
			echo

			rm -f test${count}.result
			count=$((${count} + 1))
		popd > /dev/null
	else
		break
	fi
done
echo -e "\n\n---->  END   TESTING AT $(date --utc)  <----\n\n"
