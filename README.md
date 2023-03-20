# Training code for TCR2vec
TCR2vec heavily relies on the [TAPE](https://github.com/songlab-cal/tape) package. The codes of transformer architecture and the pretraining are adapted from the original TAPE package. TCR2vec is pretrained via jointly optimizing the MLM (masked language modeling) and SPM (similarity preservation modeling). After the pretraining process, TCR2vec can gain a contextual understanding of TCRs in a similarity preserved embedding space.
<!-- <img src="https://github.com/jiangdada1221/TCR2vec_train/blob/main/figures/workflow.jpg" width="800"> <br /> -->

## Installation
 ```
cd tape
pip install .
 ```
Note that, you need to install [parasail](https://github.com/jeffdaily/parasail) to train TCR2vec.

## Data
We have deposited the pretraining data (namely the *Emerson data*) on google drive. The data can be accessed via this [link]().

## Training
### Training script
```
tape-train transformer mlm_spm_full --batch_size 64 --learning_rate 1e-4 --fp16 --gradient_accumulation_steps 1 \
--model_config_file tape/config/transformer_10spm.json --output_dir results/ --data_dir tape/data/emerson_small/ 
```
We have also provided the script for CDR3vec. Just change __mlm_spm_full__ to __mlm_spm_cdr3__. For more options, please refer to the original [TAPE](https://github.com/songlab-cal/tape). <br />

Moreover, example scripts for pretraining can be found in [*scripts/*](https://github.com/jiangdada1221/TCR2vec_train/blob/main/scripts/run.sh).

### Architecture
The parameters for the transformer arthitecture are specified by the json files in [tape/config/](https://github.com/jiangdada1221/TCR2vec_train/tree/main/tape/config). You can modify the config files to change the complexity of the model architecture. Besides, the *spm_weight* specify the task weight of SPM. 

### Custom dataset
If you want to pretrain TCR2vec on your own dataset, please make sure that the dataset format is *.tsv*; compression='gzip' (see [to_csv](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.to_csv.html)); sep='\t'; the respective column names for CDR3 and full TCR are *cdr3* and *full_seq*. 

