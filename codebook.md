# Overview
* The raw data required for analysis should eb downloaded from following link
+ https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
+ The zip file to be extracted to the current file
* It will create following directory structure

activities.txt
features.txt
 ./test
       subject_test.txt
       X_test.txt
       Y_test.txt
 ./train
       subject_train.txt
       X_train.txt
       Y_train.txt


## Read training data
Read training set
Read training labels
Read training subjects who particpated in data capture

## Read test data
Read test set
Read test labels
Read test subjects who particpated in data capture

##Combining data from x and y
combine training and test data set using row bind function (rbind)
combine training and test data labels using row bind function (rbind)
combine training and test data subjects using row bind function (rbind)


## Subsetting of data
Read features only containing mean or standard deviation 

## Assign column names to X values
Provide meaningful names to the columns using features table

## Assign column names to Y values
Provide meaningful names to the columns using activities table

## Combine X values, Y values and Subject data
concate X values, Y Values and sunject data using common keys from these tables


## Calculate means for subject and Activity
Use aggregate function to calculate mean for subject and activities

## Write tidy data to tidy file
Create a file in the currenty directory with final tidy data. The file name is todydata.txt
