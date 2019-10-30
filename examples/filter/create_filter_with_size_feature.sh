#!/usr/bin/env sh
# This script converts the filter data into leveldb format for feature extraction.
# Created by Ye Liu @ 2015-01-27

EXAMPLE=./examples/filter
DATA=./data/filter

echo "Creating leveldb..."

rm -rf $EXAMPLE/filter_test_leveldb_feature

#./build/examples/filter/convert_filter_data_with_size.bin $DATA/5picAllTrain.txt $EXAMPLE/filter_train_leveldb 15352 64 64 
#./build/examples/filter/convert_filter_data_with_size.bin $DATA/5picAllTest.txt $EXAMPLE/filter_test_leveldb 15352 64 64

#./build/examples/filter/convert_filter_data_with_size.bin $DATA/9picAllTest.txt $EXAMPLE/filter_test_leveldb_feature 48000 64 64

#./build/examples/filter/convert_filter_data_with_size.bin $DATA/picBlockTest.txt $EXAMPLE/filter_test_leveldb_feature 4374 64 64
./build/examples/filter/convert_filter_data_with_size.bin $DATA/picBlockTest.txt $EXAMPLE/filter_test_leveldb_feature 2440 64 64

#./build/examples/filter/convert_filter_data_with_size.bin $DATA/pic2Test.txt $EXAMPLE/filter_test_leveldb_feature 2 64 64

echo "Done."
