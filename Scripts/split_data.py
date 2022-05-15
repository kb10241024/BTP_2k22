import json
import random

ip_Path='/home/anuj_g/BTP/Data/json_files/train_aligned_merged_data.json'
out_f='/home/anuj_g/BTP/Data/json_files/splitted_datasets/train_splitted'

with open(ip_Path, encoding='utf-8') as data_file:
#    data = json.loads(data_file.read())
#    data = json.load(data_file)
    data = data_file.readlines()
    random.shuffle(data)
    l=len(data)
    print(l)
    for i in range(500,l,500):
        # print(i)
        # print(len(data[:i]))
        with open(out_f+"_"+str(i)+".json",'w') as f:
            f.writelines(data[:i])