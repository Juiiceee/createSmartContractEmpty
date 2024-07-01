#!/bin/bash
echo "Entrez le nom du fichier :"
read fileName

echo "Entrez le type de fichier (1: contract, 2: interface, 3: library, 4: test):"
read fileTypeNum

if [ $fileTypeNum -eq 1 ]
then
	fileType="contract"
elif [ $fileTypeNum -eq 2 ]
then
	fileType="interface"
elif [ $fileTypeNum -eq 3 ]
then
	fileType="library"
elif [ $fileTypeNum -eq 4 ]
then
	fileType="contract"
	fileTest="$fileName.t.sol"
else
	echo "Type de fichier non reconnu."
	exit 1;
fi

echo "Voulez-vous placer le fichier dans le dossier src ? (y/n)"
read placeInSrc

if [ "$placeInSrc" == "y" ]
then
	destination="src/$fileName.sol"
else
	destination="$fileName.sol"
fi
if [ $fileTypeNum -eq 4 ]
then
	echo "// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import \"forge-std/Test.sol\";

contract $fileName"Test" is Test {
	address public constant ADD_0 = 0x0000000000000000000000000000000000000000;
	address testAdd1;
	function setUp() public {
	}
}" >> test/$fileTest
	exit
fi
echo "// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

$fileType $fileName {

}" > $destination
