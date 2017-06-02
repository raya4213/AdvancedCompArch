#!/bin/sh
#####################################################################
# go.sh
# Generated by bench-run.pl
# /home/students/raya4213/benchmarks/bin/bench-run.pl --bench spec-cpu2006:int:401.bzip2:train --build base --prefix pin -t  /home/students/raya4213/checkpoints/checkPoint1A2Bit/obj-intel64/checkpoint1A2Bit.so -o bzip2.out -l 10000000000 -- --copy bzip2.out --log LOG
#####################################################################

#####################################################################
# Creating logfile
date >> LOG
#####################################################################

#####################################################################
# benchmark: spec-cpu2006/int/401.bzip2 input: train 0
#####################################################################
# log file update
echo -n "Started : spec-cpu2006/int/401.bzip2 input: train 0 at " >> LOG 
date >> LOG
# setup
ln -s /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/builds/base/401.bzip2 /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2
ln -s -f -n --target-directory=/home/students/raya4213/checkpoints/checkPoint1AGaG /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/train/input/byoudoin.jpg /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/train/input/control /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/all/input/input.combined /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/all/input/input.program
# setup experiment files
# run benchmark
pin -t  /home/students/raya4213/checkpoints/checkPoint1A2Bit/obj-intel64/checkpoint1A2Bit.so -o bzip2.out -l 10000000000 -- /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2 input.program 10 > input.program.out 2> input.program.err 
# verify benchmark
# post-copy benchmark
cp /home/students/raya4213/checkpoints/checkPoint1AGaG/bzip2.out /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/builds/base/bzip2.out;
# run custom script
# clean benchmark
rm -f /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2
rm -r -f byoudoin.jpg control input.combined input.program byoudoin.jpg.err byoudoin.jpg.out input.combined.err input.combined.out input.program.err input.program.out
# clean experiment files
# log file update
echo -n "Finished: spec-cpu2006/int/401.bzip2 input: train 0 at " >> LOG 
date >> LOG
#####################################################################
# benchmark: spec-cpu2006/int/401.bzip2 input: train 1
#####################################################################
# log file update
echo -n "Started : spec-cpu2006/int/401.bzip2 input: train 1 at " >> LOG 
date >> LOG
# setup
ln -s /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/builds/base/401.bzip2 /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2
ln -s -f -n --target-directory=/home/students/raya4213/checkpoints/checkPoint1AGaG /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/train/input/byoudoin.jpg /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/train/input/control /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/all/input/input.combined /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/all/input/input.program
# setup experiment files
# run benchmark
pin -t  /home/students/raya4213/checkpoints/checkPoint1A2Bit/obj-intel64/checkpoint1A2Bit.so -o bzip2.out -l 10000000000 -- /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2 byoudoin.jpg 5 > byoudoin.jpg.out 2> byoudoin.jpg.err 
# verify benchmark
# post-copy benchmark
cp /home/students/raya4213/checkpoints/checkPoint1AGaG/bzip2.out /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/builds/base/bzip2.out;
# run custom script
# clean benchmark
rm -f /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2
rm -r -f byoudoin.jpg control input.combined input.program byoudoin.jpg.err byoudoin.jpg.out input.combined.err input.combined.out input.program.err input.program.out
# clean experiment files
# log file update
echo -n "Finished: spec-cpu2006/int/401.bzip2 input: train 1 at " >> LOG 
date >> LOG
#####################################################################
# benchmark: spec-cpu2006/int/401.bzip2 input: train 2
#####################################################################
# log file update
echo -n "Started : spec-cpu2006/int/401.bzip2 input: train 2 at " >> LOG 
date >> LOG
# setup
ln -s /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/builds/base/401.bzip2 /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2
ln -s -f -n --target-directory=/home/students/raya4213/checkpoints/checkPoint1AGaG /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/train/input/byoudoin.jpg /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/train/input/control /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/all/input/input.combined /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/data/all/input/input.program
# setup experiment files
# run benchmark
pin -t  /home/students/raya4213/checkpoints/checkPoint1A2Bit/obj-intel64/checkpoint1A2Bit.so -o bzip2.out -l 10000000000 -- /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2 input.combined 80 > input.combined.out 2> input.combined.err 
# verify benchmark
# post-copy benchmark
cp /home/students/raya4213/checkpoints/checkPoint1AGaG/bzip2.out /home/students/raya4213/benchmarks/src/spec-cpu2006/int/401.bzip2/builds/base/bzip2.out;
# run custom script
# clean benchmark
rm -f /home/students/raya4213/checkpoints/checkPoint1AGaG/401.bzip2
rm -r -f byoudoin.jpg control input.combined input.program byoudoin.jpg.err byoudoin.jpg.out input.combined.err input.combined.out input.program.err input.program.out
# clean experiment files
# log file update
echo -n "Finished: spec-cpu2006/int/401.bzip2 input: train 2 at " >> LOG 
date >> LOG
#####################################################################
# Finishing logfile
date >> LOG
#####################################################################

