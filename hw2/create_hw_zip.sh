#!/bin/bash
set -o nounset

zip_file="TangoMikes-hw2.zip"
tmp_dir="/tmp/hw_zip"

rm -fr ${tmp_dir}
mkdir -p ${tmp_dir}

# manually copy the needed files
cp -f ../compile.py        ${tmp_dir}
cp -f ../ASTourist.py      ${tmp_dir}
cp -f ../x86AST.py         ${tmp_dir}

cp -f ../runtime/runtime.c ${tmp_dir}
cp -f ../runtime/runtime.h ${tmp_dir}

cp -f lexer.py             ${tmp_dir}
cp -f parse.py             ${tmp_dir}

cp -fR ply-3.4             ${tmp_dir}

rm -f ${zip_file}
zip_dir="$(pwd)"
pushd ${tmp_dir} > /dev/null
    zip -r ${zip_dir}/${zip_file} *
popd > /dev/null
rm -fr ${tmp_dir}

