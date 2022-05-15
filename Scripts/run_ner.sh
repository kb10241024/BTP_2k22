# train_json_file='/home/anuj_g/BTP/Data/json_files/cleaned_train_3500.json'
train_json_file='/home/anuj_g/BTP/Data/json_files/train_aligned_4k.json'
# train_json_file='/home/anuj_g/BTP/Data/json_files/train_aligned_merged_data.json'
dev_json_file='/home/anuj_g/BTP/Data/json_files/dev.json'
test_json_file='/home/anuj_g/BTP/Data/json_files/test_withOs.json'
# model_name='bert-base-cased' 
# model_name='albert-base-v2'
# model_name='roberta-base'
model_name='distilroberta-base'
# model_name='xlm-roberta-base'
# model_name='roberta-large'
# model_name='xlm-roberta-large'
# /home/anuj_g/BTP/btp_venvmodel_name='facebook/bart-base'

# model_name='/home/anuj_g/BTP/outputs/roberta_large_2Ep/checkpoint-1000'
out_dir='/home/anuj_g/BTP/outputs/randoutputs/'$model_name'_10Ep/'
# echo $out_dir
python "/home/anuj_g/BTP/transformers/examples/pytorch/token-classification/run_ner.py" \
  --model_name_or_path $model_name \
  --train_file  $train_json_file \
  --validation_file  $dev_json_file \
  --test_file  $test_json_file \
  --num_train_epochs 10 \
  --metric_for_best_model 'f1'\
  --save_strategy 'steps' \
  --evaluation_strategy 'steps' \
  --eval_steps 250 \
  --save_steps 500 \
  --load_best_model_at_end \
  --overwrite_output_dir \
  --output_dir $out_dir \
  --do_train \
  --do_eval \
  --do_predict


python "/home/anuj_g/BTP/convert_op.py" $out_dir


#   --per_device_eval_batch_size 2 \
#   --per_device_train_batch_size 2 \
#   --gradient_accumulation_steps 4 \