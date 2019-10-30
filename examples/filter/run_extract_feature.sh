#!/usr/bin/env sh
# Created @ 2015-01-27

TOOLS=./build/tools
MODEL=./examples/filter

#ITER_NUM=100000
#GLOG_logtostderr=0 ${TOOLS}/extract_features ${MODEL}/filter_full_iter_${ITER_NUM}.caffemodel ${MODEL}/filter_full_feature.prototxt loss ${MODEL}/filter_full_iter_${ITER_NUM}.features 11338 GPU
#GLOG_logtostderr=0 ${TOOLS}/extract_features ${MODEL}/filter_full_iter_${ITER_NUM}.caffemodel ${MODEL}/filter_full_feature.prototxt loss ${MODEL}/filter_full_iter_${ITER_NUM}.features 48000 GPU

ITER_NUM=97000
#ITER_NUM=10000
#GLOG_logtostderr=0 ${TOOLS}/extract_features ${MODEL}/filter_full_iter_${ITER_NUM}.caffemodel ${MODEL}/filter_full_feature.prototxt loss ${MODEL}/filter_full_iter_${ITER_NUM}.features 4374 GPU
#GLOG_logtostderr=0 ${TOOLS}/extract_features ${MODEL}/filter_full_iter_${ITER_NUM}.caffemodel ${MODEL}/filter_full_feature.prototxt loss ${MODEL}/filter_full_iter_${ITER_NUM}.features 2 GPU
GLOG_logtostderr=0 ${TOOLS}/extract_features ${MODEL}/filter_full_iter_${ITER_NUM}.caffemodel ${MODEL}/filter_full_feature.prototxt loss ${MODEL}/filter_full_iter_${ITER_NUM}.features 2440 GPU

