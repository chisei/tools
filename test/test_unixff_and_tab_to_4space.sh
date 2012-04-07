#!/bin/bash

# test a file 
testOneFile()
{
    testDir="./testData"
    testFile=$testDir/crlf.txt

    mkdir $testDir
    touch $testFile

    echo -e "foo\r\n	bar" > $testFile

    # execute
    /bin/bash ../unixff_and_tab_to_4space.sh $testFile

    # search crlf
    result=`grep -P "\r\n" $testFile |wc -l`
    assertEquals 0 $result

    # search tab
    result=`grep "	" $testFile |wc -l`
    assertEquals 0 $result

    # end processing
    rm -rf $testDir
}

# test files

. ./shunit2-2.1.6/src/shunit2
