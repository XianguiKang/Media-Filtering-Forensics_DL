// Created by Ye Liu (E-mail: jourkliu@163.com) from Sun Yat-sen University @ 2014-12-28
// Modified by Ye Liu @ 2015-01-15
//
// This script converts the text file dataset to the leveldb format used
// by caffe to perform classification.
// Usage:
//    convert_filter_data input_data_file output_db_file input_sample_num input_image_row input_image_column
//

#include <google/protobuf/text_format.h>
#include <glog/logging.h>
#include <leveldb/db.h>

#include <stdint.h>
#include <iostream>
#include <fstream>

#include "caffe/proto/caffe.pb.h"

void convert_dataset(const char* data_filename, const char* db_filename, int sample_num, int image_row, int image_column) 
{
  // Open files
  std::ifstream data_file(data_filename);
  CHECK(data_file) << "Unable to open file " << data_filename;

  uint32_t num_items;
  uint32_t rows;
  uint32_t cols;

  // Open leveldb
  leveldb::DB* db;
  leveldb::Options options;
  options.create_if_missing = true;
  options.error_if_exists = true;
  leveldb::Status status = leveldb::DB::Open(options, db_filename, &db);
  CHECK(status.ok()) << "Failed to open leveldb " << db_filename << ". Is it already existing?";
  
  //num_items = 11338;
  num_items = sample_num;
  //rows = 256;
  //cols = 256;
  rows = image_row;
  cols = image_column;
  
  //int tmppixel;
  double tmppixel;
  double tmplabel;
  int label;
  //char* pixels = new char[rows * cols];
  //int* pixels = new int[rows * cols];
  double* pixels = new double[rows * cols];
  char key[10];
  std::string value;
  
  std::vector<int> lines;
  for (int itemid = 0; itemid < num_items; ++itemid) {  
    lines.push_back(itemid);
  }
  //LOG(INFO) << "Shuffling data";
  //std::random_shuffle(lines.begin(), lines.end());
  LOG(INFO) << "A total of " << lines.size() << " samples.";
  
  caffe::Datum datum;
  LOG(INFO) << "A total of " << num_items << " items.";
  LOG(INFO) << "Rows: " << rows << " Cols: " << cols;
  for (int itemid = 0; itemid < num_items; ++itemid) {  
    datum.set_channels(1);
    datum.set_height(rows);
    datum.set_width(cols);
    datum.clear_data();
    datum.clear_float_data();
	for(int rowid=0;rowid<rows;rowid++){
		for(int colid=0;colid<cols;colid++){
			data_file >> tmppixel;
            if(itemid==0) LOG(INFO) << tmppixel << "|";
			pixels[rowid*cols+colid] = tmppixel;
			datum.mutable_data()->push_back(pixels[rowid*cols+colid]);
		}	
	}
    data_file >> tmplabel;
    LOG(INFO) << "label: " << tmplabel;
	if(tmplabel<0.5) label=0;
	else label=1;
    LOG(INFO) << "item: " << itemid << " label: " << label;
	datum.set_label(label);
    datum.SerializeToString(&value);
	//LOG(INFO) << value;
    sprintf(key, "%08d", lines[itemid]);
    db->Put(leveldb::WriteOptions(), std::string(key), value);
    if(itemid % 1000 == 0){
        LOG(INFO) << "process: " << itemid;
    }
  }

  delete db;
  delete pixels;
}

int main (int argc, char** argv) 
{
  if (argc != 6) {
    printf("This script converts the text file dataset to the leveldb format used\n"
           "by caffe to perform classification.\n"
           "Usage:\n"
           "   convert_filter_data input_data_file output_db_file sample_num image_row image_column\n");
  } else {
    google::InitGoogleLogging(argv[0]);
    convert_dataset(argv[1], argv[2], atoi(argv[3]), atoi(argv[4]), atoi(argv[5]));
  }
  return 0;
}
