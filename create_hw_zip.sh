#!/bin/bash
set -o nounset

zip_file="TangoMikes-hw5.zip"
tmp_dir="/tmp/hw_zip"

rm -fr ${tmp_dir}
mkdir -p ${tmp_dir}

# manually copy the needed files
cp -f compile.py           ${tmp_dir}
cp -f flatten.py           ${tmp_dir}
cp -f flatten1.py          ${tmp_dir}
cp -f flatten2.py          ${tmp_dir}
cp -f explicate.py         ${tmp_dir}
cp -f explicate2.py        ${tmp_dir}
cp -f freeVars2.py         ${tmp_dir}
cp -f heapify2.py          ${tmp_dir}
cp -f pyAST.py             ${tmp_dir}
cp -f uniquify.py          ${tmp_dir}
cp -f tourist.py           ${tmp_dir}
cp -f x86AST.py            ${tmp_dir}
cp -f RegisterAllocator.py ${tmp_dir}
cp -f InterferenceGraph.py ${tmp_dir}

cp -f runtime/*    ${tmp_dir}


rm -f ${zip_file}
zip -qrj ${zip_file} ${tmp_dir}/*
rm -fr ${tmp_dir}

