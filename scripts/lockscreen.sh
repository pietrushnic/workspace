#!/bin/bash
Start=`date +%s`
cmatrix -s
End=`date +%s`
let Total=End-Start

if [[ ${Total} > 1800 ]]; then
	vlock -c
fi
