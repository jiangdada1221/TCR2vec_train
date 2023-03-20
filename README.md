# Training code for TCR2vec
TCR2vec heavily relies on the [TAPE](https://github.com/songlab-cal/tape) package. The codes of transformer architecture and the pretraining are adapted from the original TAPE package. TCR2vec is pretrained via jointly optimizing the MLM (masked language modeling) and SPM (similarity preservation modeling). After the pretraining process, TCR2vec can gain a contextual understanding of TCRs in a similarity preserved embedding space.

<img src="https://github.com/jiangdada1221/TCR2vec_train/figures/workflow.jpg" width="800"> <br />

## Installation
 ```
cd tape
pip install .
 ```

## Data
We have deposited the pretraining data (namely the *Emerson data*) on google drive. The data can be accessed via this [link]().

## Training
### Training script
```
tape-train transformer mlm_spm_full --batch_size 64 --learning_rate 1e-4 --fp16 --gradient_accumulation_steps 1 \
--model_config_file tape/config/transformer_10spm.json --output_dir results/ --data_dir tape/data/emerson_small/ 
```

