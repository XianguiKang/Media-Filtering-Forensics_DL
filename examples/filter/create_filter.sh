#!/usr/bin/env sh
# This script converts the filter data into leveldb format.

EXAMPLE=examples/filter
DATA=data/filter

echo "Creating leveldb..."

rm -rf $EXAMPLE/filter_train_leveldb $EXAMPLE/filter_test_leveldb

#./build/examples/filter/convert_filter_data.bin $DATA/picAllTrain.txt $EXAMPLE/filter_train_leveldb 11338
#./build/examples/filter/convert_filter_data.bin $DATA/picAllTest.txt $EXAMPLE/filter_test_leveldb 11338
#./build/examples/filter/convert_filter_data2.bin $DATA/picAllTrain2.txt $EXAMPLE/filter_train_leveldb 15352
#./build/examples/filter/convert_filter_data2.bin $DATA/picAllTest2.txt $EXAMPLE/filter_test_leveldb 15352
#./build/examples/filter/convert_filter_data2.bin $DATA/picAllTrain2.txt-part1 $EXAMPLE/filter_train_leveldb 1000
#./build/examples/filter/convert_filter_data.bin $DATA/picAllTrain.txt $EXAMPLE/filter_train_leveldb 1000

./build/examples/filter/convert_filter_data.bin $DATA/2picAllTrain.txt $EXAMPLE/filter_train_leveldb 15352
./build/examples/filter/convert_filter_data.bin $DATA/2picAllTest.txt $EXAMPLE/filter_test_leveldb 15352

echo "Done."

