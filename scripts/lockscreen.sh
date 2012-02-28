#!/bin/bash
Start=`date +%s`
cmatrix -s
End=`date +%s`
let Total=End-Start

if [[ ${Total} > 30 ]]; then
	vlock -c
fi
