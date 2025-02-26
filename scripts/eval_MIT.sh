#!/bin/bash

DATASET=uspto_MIT
SAVENAME=Model0
VOCAB=uspto_MIT
SEED=17
K=4
KERNEL=spd
BSZ=64
TOKENLIM=0
D_MODEL=256
D_FILTER=2048
ENC_LAYER=6
DEC_LAYER=8
DROP=0.0
TASK=dualtask
ETASK=forwardsynthesis
EMODE=test
BEAMSIZE=20
T=1.0
BEAM_GROUP=1
K_FILTER=0
P_FILTER=0.0
SEARCH_STEP=300
FFN=vanilla
NORM=rmsnorm
AUG_N=1


python train.py \
    --dataset_name="$DATASET" \
    --save_name="$SAVENAME" \
    --vocab_name="$VOCAB" \
    --seed="$SEED" \
    --K="$K" \
    --kernel="$KERNEL" \
    --eval_batch_size="$BSZ" \
    --eval_token_limit="$TOKENLIM" \
    --d_model="$D_MODEL" \
    --d_ff="$D_FILTER" \
    --enc_layer="$ENC_LAYER" \
    --dec_layer="$DEC_LAYER" \
    --dropout="$DROP" \
    --mode="eval" \
    --task="$TASK" \
    --eval_task="$ETASK" \
    --eval_mode="$EMODE" \
    --split_data_len=0 \
    --T="$T" \
    --beam_group="$BEAM_GROUP" \
    --top_k="$K_FILTER" \
    --top_p="$P_FILTER" \
    --beam_size="$BEAMSIZE" \
    --search_step="$SEARCH_STEP" \
    --ckpt_path="mit" \
    --ckpt_name="AVG_MAIN" \
    --ffn_type="$FFN" \
    --norm_type="$NORM" \
    --augment_N="$AUG_N"




#    --dataset_name="uspto_MIT"
#    --save_name="Model0"
#    --vocab_name="uspto_MIT"
#    --seed="17"
#    --K="4"
#    --kernel="spd"
#    --eval_batch_size="64"
#    --eval_token_limit="0"
#    --d_model="256"
#    --d_ff="2048"
#    --enc_layer="6"
#    --dec_layer="8"
#    --dropout="0.0"
#    --mode="eval"
#    --task="dualtask"
#    --eval_task="forwardsynthesis"
#    --eval_mode="test"
#    --split_data_len=0
#    --T="1.0"
#    --beam_group="1"
#    --top_k="0"
#    --top_p="0.0"
#    --beam_size="20"
#    --search_step="300"
#    --ckpt_path="mit"
#    --ckpt_name="AVG_MAIN"
#    --ffn_type="vanilla"
#    --norm_type="rmsnorm"
#    --augment_N="1"
