#! /bin/bash

set -e
set -o pipefail

SCRIPT_PATH=$( dirname `realpath $0` )
TRAIN_DATASET_ROOT="/home/zssanta/fastdata/COCO/tfrecords/train2017"
MODEL="efficientdet-d0"
TRAIN_OUTPUT="${PWD}/training/${MODEL}"
LOG_NAME=${TRAIN_OUTPUT}/train.log

[[ ! -d ${TRAIN_OUTPUT} ]] && mkdir -p ${TRAIN_OUTPUT}

ARGS=(
  --training_file_pattern="${TRAIN_DATASET_ROOT}/train*"
  --model_name=${MODEL}
  --model_dir=${TRAIN_OUTPUT}
  --hparams="use_bfloat16=false"
  --use_tpu=False
  --train_batch_size=10
)

savelog -nl ${LOG_NAME}
python ${SCRIPT_PATH}/main.py "${ARGS[@]}" 2>&1 | tee ${LOG_NAME}

# python main.py --training_file_pattern="${TRAIN_DATASET_ROOT}/train*" \
#   --model_name=${MODEL} \
#   --model_dir=${TRAIN_OUTPUT} \
#   --hparams="use_bfloat16=false" \
#   --use_tpu=False \
#   --train_batch_size=16 \
#   2>&1 | tee ${LOG_NAME}

