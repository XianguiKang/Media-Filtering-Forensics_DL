#!/usr/bin/env sh

TOOLS=./build/tools

GLOG_logtostderr=0 $TOOLS/caffe train \
		--solver=examples/filter/filter_full_solver.prototxt

# reduce learning rate by factor of 10
#GLOG_logtostderr=0 $TOOLS/caffe train \
        #--solver=examples/filter/filter_full_solver_lr1.prototxt \
            #--snapshot=examples/filter/filter_full_iter_60000.solverstate

# reduce learning rate by factor of 10
#GLOG_logtostderr=0 $TOOLS/caffe train \
        #--solver=examples/filter/filter_full_solver_lr2.prototxt \
            #--snapshot=examples/filter/filter_full_iter_65000.solverstate
