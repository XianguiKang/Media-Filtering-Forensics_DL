#!/usr/bin/env sh
# This script converts the filter data into leveldb format.

EXAPLE=examples/filter
DATA=data/filter

echo "Creating leveldb..."

rm -rf $EXAPLE/filter_train_leveldb $EXAPLE/filter_test_leveldb

#./build/examples/filter/convert_filter_data.bin $DATA/picAllTrain.txt $EXAPLE/filter_train_leveldb 11338
#./build/examples/filter/convert_filter_data.bin $DATA/picAllTest.txt $EXAPLE/filter_test_leveldb 11338
#./build/examples/filter/convert_filter_data2.bin $DATA/picAllTrain2.txt $EXAPLE/filter_train_leveldb 15352
#./build/examples/filter/convert_filter_data2.bin $DATA/picAllTest2.txt $EXAPLE/filter_test_leveldb 15352
#./build/examples/filter/convert_filter_data2.bin $DATA/picAllTrain2.txt-part1 $EXAPLE/filter_train_leveldb 1000
#./build/examples/filter/convert_filter_data.bin $DATA/picAllTrain.txt $EXAPLE/filter_train_leveldb 1000

./build/examples/filter/convert_filter_data.bin $DATA/2picAllTrain.txt $EXAPLE/filter_train_leveldb 15352
./build/examples/filter/convert_filter_data.bin $DATA/2picAllTest.txt $EXAPLE/filter_test_leveldb 15352

echo "Done."
