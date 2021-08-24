#!/bin/sh

wget -O epaswmm.inp ${INP_FILE_URL}

./epaswmm${EPASWMM_VERSION} epaswmm.inp epaswmm.rpt epaswmm.out;
