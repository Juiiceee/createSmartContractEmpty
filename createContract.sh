#!/bin/bash
echo "Entrez le nom du fichier :"
read fileName

echo "Entrez le type de fichier (1: contract, 2: interface, 3: library):"
read fileType

if [ $fileType -eq 1 ]
then
    fileType="contract"
elif [ $fileType -eq 2 ]
then
    fileType="interface"
elif [ $fileType -eq 3 ]
then
    fileType="library"
else
    echo "Type de fichier non reconnu."
    exit 1;
fi

echo "// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

$fileType $fileName {

}" > $fileName.sol
