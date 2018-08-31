#!/usr/bin/bash

SKI=ski-1.3.2.tar.gz
SRCDIR=ski-1.3.2

mkdir tmp

cd tmp

tar xvfzk ../${SKI}

mkdir generated
cd generated
mkdir temp

awk -f ../${SRCDIR}/src/decoder/instID.awk -v prefix=../${SRCDIR}/src/decoder ../${SRCDIR}/src/encodings/encoding.opcode ../${SRCDIR}/src/encodings/encoding.unusedop
awk -f ../${SRCDIR}/src/decoder/operands.awk -v prefix=../${SRCDIR}/src/decoder ../${SRCDIR}/src/encodings/encoding.opcode
awk -v prefix=../${SRCDIR}/src/ -f ../${SRCDIR}/src/mkfns.awk ../${SRCDIR}/src/exec.c ../${SRCDIR}/src/fp_exec.c ../${SRCDIR}/src/mem_exec.c ../${SRCDIR}/src/mm_exec.c ../${SRCDIR}/src/read.c ../${SRCDIR}/src/sys_exec.c ../${SRCDIR}/src/write.c
awk -v prefix=../${SRCDIR}/src/ -f ../${SRCDIR}/src/combfns.awk ../${SRCDIR}/src/execTbl

