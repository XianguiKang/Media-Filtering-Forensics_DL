#!/usr/bin/env sh
# This script converts the filter data into leveldb format.

EXAMPLE=examples/filter
DATA=data/filter

echo "Creating leveldb..."

rm -rf $EXAMPLE/filter_train_leveldb $EXAMPLE/filter_test_leveldb

./build/examples/filter/convert_filter_data_with_size.bin $DATA/6picAllTrain.txt $EXAMPLE/filter_train_leveldb 15352 64 64 
./build/examples/filter/convert_filter_data_with_size.bin $DATA/6picAllTest.txt $EXAMPLE/filter_test_leveldb 15352  64 64
echo "Done."
