# train_json_file='/home/anuj_g/BTP/Data/json_files/splitted_datasets/train_splitted_'
dev_json_file='/home/anuj_g/BTP/Data/json_files/dev.json'
test_json_file='/home/anuj_g/BTP/Data/json_files/test_withOs.json'
# model_name='bert-base-cased' 
model_name='roberta-large'


for a in 500
do
    train_json_file='/home/anuj_g/BTP/Data/json_files/splitted_datasets/train_splitted_'$a'.json'
    out_dir='/home/anuj_g/BTP/outputs_splitted/'$model_name'_10Ep_'$a'/'

    python "flush.py"
    echo "Training For $model_name on $a tweets using\nTraining File: $train_json_file,\nDev File: $dev_json_file,\n Test File: $test_json_file"
    
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
        --save_steps 250 \
        --load_best_model_at_end \
        --overwrite_output_dir \
        --output_dir $out_dir \
        --do_train \
        --do_eval \
        --do_predict

    python "flush.py"

    echo "Training Completed!!!"
    echo "Saving ouputs at $out_dir"
    # python "/home/anuj_g/BTP/convert_op.py" $out_dir
        
done