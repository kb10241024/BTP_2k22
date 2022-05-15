# import zipfile
import sys

out_dir=sys.argv[1]
in_f=out_dir+'predictions.txt'
#input file
fin = open(in_f, "rt")

op_f=out_dir+"ner_hin_eng.txt"
#output file to write the result to
fout = open(op_f, "wt")

#for each line in the input file
for line in fin:
	#read replace the string and write to output file
	fout.write(line.replace('\n', '\n\n').replace(' ','\n'))
#close input and output files
fin.close()
fout.close()

# zipfile.ZipFile(out_dir+'submission.zip', mode='w').write(op_f)