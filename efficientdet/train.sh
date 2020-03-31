#! /bin/bash

TRAIN_DATASET_ROOT="/home/zssanta/fastdata/COCO/tfrecords/train2017"
MODEL="efficientdet-d0"
TRAIN_OUTPUT="/tmp/${MODEL}"

python main.py \ 
  --training_file_pattern="${TRAIN_DATASET_ROOT}/train*" \
  --model_name=${MODEL} \
  --model_dir=${TRAIN_OUTPUT} \
  --hparams="use_bfloat16=false" \
  --use_tpu=False

