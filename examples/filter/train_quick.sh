#!/usr/bin/env sh

TOOLS=./build/tools

$TOOLS/caffe train \
  --solver=examples/filter/filter_quick_solver.prototxt

# reduce learning rate by factor of 10 after 8 epochs
#$TOOLS/caffe train \
  #--solver=examples/filter/filter_quick_solver_lr1.prototxt \
  #--snapshot=examples/filter/filter_quick_iter_4000.solverstate
