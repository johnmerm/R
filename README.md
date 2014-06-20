Getting and Cleaning Data Assignment:

THe script run_analysis will do the following
a) get the names of the features fromm the features.txt in working directory
b) f_selector will poroduce the sel_features which are features containin the mean() and std() tokens
c) get the activity names from activity_labels.txt
for both train & test directories:
  parse the txt files and create the dat_{train|test} with all subject,sel_features & actrivity
  change the activity number with the activity word, as parsed from activity_labels.txt. (c)
  
rbing will merge the two sets
then I change the activity number with the activity word, as parsed from activity_labels.txt. (c)

split the dat by Subject & activiy (sa_data)

run mean for each column of each sub group in sa_dat

reformat to create the tsm file and write it
