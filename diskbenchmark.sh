#!/bin/bash

# Sample Script executes 4 java programs for disk benchmark
# one by one for different thread count and buffer size
# 4 Disk Benchmark are executed - Random Read , Random Write , Sequential Read , Sequential Write
# Script was used in Cloud Computing Coursework Assigment to run on AWS EC2

echo " "

echo "###Disk Benchmark###"

echo ""

echo "Read Disk Benchmark uses randomaccessfile and nio API"

echo " "

echo "Creating input files requried for program please wait as it may take 2-5 mins to create 1 GB random file"

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 500 | head -n 20000 > file1.txt
echo "file1.txt done"
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 700 | head -n 100000 > file1byte.txt
echo "file1byte.txt done"
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 1100 | head -n 1000000 > file.txt
echo "file.txt done"

echo "----"


echo "Below files are created"

echo " "

echo "file1.txt - used as input file for write oprations approx 10 MB"
echo "file1byte.txt - used to read 1 byte buffer data approx size 65 MB"
echo "file.txt - used to read 1KB and 1 MB buffer data approx size 1 GB"

echo " "

echo "Starting Sequential read benchmarking"

for i in {1,1024,1048576}
do
	for j in {1,2}
	do
	if [ $i -eq 1 ]
        then
        filepath=`pwd`/file1byte.txt
        else
        filepath=`pwd`/file.txt
        fi

	javac readSeq.java

	echo "#################################################"
	echo "Running Sequential Read for $i Byte and $j thread"

	java readSeq $filepath $i $j

	done

done

echo  " "

echo "Sequential Read Completed"

echo ""
echo "-----------------------------------"

echo "Starting Random read benchmarking"


for i in {1,1024,1048576}
do
	for j in {1,2}
        do
	if [ $i -eq 1 ]
	then
	filepath=`pwd`/file1byte.txt
	else
	filepath=`pwd`/file.txt
	fi

        javac readRandom.java

        echo "#############################################"
        echo "Running Random Read for $i Byte and $j thread"

        java readRandom $filepath $i $j

        done
done

echo " "

echo "Random Read Completed"

echo ""
echo "####################################################################################"
echo ""

echo "Write Disk Benchmark uses NIO file and BufferedOutputStream and RandomAccessFile  API"

echo " "

filepath=`pwd`/file1.txt

echo "Starting Sequential write benchmarking"


for i in {1,1024,1048576}
do
        for j in {1,2}
        do
	rm writefile.txt

        javac writeSeq.java

        echo "##################################################"
        echo "Running Sequential write for $i Byte and $j thread"

        java writeSeq $filepath $i $j

        done
done

echo " "

echo "Sequential Write Completed"

echo "------------------------------------------------------------- "

echo "Starting Random write benchmarking"

for i in {1,1024,1048576}
do
        for j in {1,2}
        do
	rm writefile.txt

        javac writeRandom.java

        echo "##############################################"
        echo "Running Random write for $i Byte and $j thread"

        java writeRandom $filepath $i $j

        done
done

echo " "

echo "Random Write Completed"

 rm writefile.txt

echo " "

echo "###Disk Benchmark Completed### "
