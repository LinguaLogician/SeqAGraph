#!/bin/bash

DATASET=uspto_full
SAVENAME=Model0
VOCAB=uspto_full
SEED=17
K=4
KERNEL=spd
FILE_SPLIT=10000
EVAL_SPLIT=10000
AUG_N=2


python preprocess.py \
    --dataset_name="$DATASET" \
    --save_name="$SAVENAME" \
    --vocab_name="$VOCAB" \
    --seed="$SEED" \
    --K="$K" \
    --kernel="$KERNEL" \
    --split_data_len="$EVAL_SPLIT" \
    --smi2token \
    --tokenize \
    --featurize \
    --file_split="$FILE_SPLIT" \
    --augment_N="$AUG_N" \
    --split_shuffle


#    --dataset_name="uspto_full"
#    --save_name="Model0"
#    --vocab_name="uspto_full"
#    --seed="17"
#    --K="4"
#    --kernel="spd"
#    --split_data_len="10000"
#    --smi2token
#    --tokenize
#    --featurize
#    --file_split="10000"
#    --augment_N="2"
#    --split_shuffle