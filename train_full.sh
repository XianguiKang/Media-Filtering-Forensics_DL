TOOLS=./build/tools

GLOG_logtostderr=0 $TOOLS/caffe train \
		--solver=filter_full_solver.prototxt