#!/bin/bash
set -o nounset

zip_file="TangoMikes-hw1.zip"
tmp_dir="/tmp/hw_zip"

rm -fr ${tmp_dir}
mkdir -p ${tmp_dir}

# manually copy the needed files
cp -f compile.py        ${tmp_dir}
cp -f ASTourist.py      ${tmp_dir}
cp -f x86AST.py         ${tmp_dir}

cp -f runtime/runtime.c ${tmp_dir}
cp -f runtime/runtime.h ${tmp_dir}

rm -f ${zip_file}
zip -qrj ${zip_file} ${tmp_dir}/*
rm -fr ${tmp_dir}

