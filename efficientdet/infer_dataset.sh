#! /bin/bash

set -e

[[ $# -gt 1 ]]  || ( echo "At least 2 parameters needed"; exit 1 )

MODEL_NAME=$1 # eg. efficientdet-d0
INPUT_LIST=$2
INFER_BATCH_SIZE=${3-1}

SCRIPT_PATH=$( dirname $(realpath $0) )

PYTHONPATH=${SCRIPT_PATH} python ${SCRIPT_PATH}/model_inspect.py \
	 --runmode="infer_and_write_boxes" \
	 --model_name=${MODEL_NAME} \
	 --ckpt_path="${SCRIPT_PATH}/models/${MODEL_NAME}/" \
	 --output_image_dir="${SCRIPT_PATH}/test/output/" \
	 --person_confidence_threshold 0.05 \
	 --infer_batch_size ${INFER_BATCH_SIZE} \
	 --input_list=${INPUT_LIST}
	 # --input_image=test/*.*

