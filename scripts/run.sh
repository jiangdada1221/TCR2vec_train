tape-train transformer mlm_spm_full --batch_size 64 --learning_rate 1e-4 --fp16 --gradient_accumulation_steps 1 --model_config_file ../tape/config/transformer_10spm.json --output_dir ../tape/results/ --data_dir ../tape/data/emerson_small/ 
tape-train transformer mlm_spm_cdr3 --batch_size 64 --learning_rate 1e-4 --fp16 --gradient_accumulation_steps 1 --model_config_file ../tape/config/transformer_10spm.json --output_dir ../tape/results/ --data_dir ../tape/data/emerson_small/ 