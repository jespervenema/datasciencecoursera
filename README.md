This program reads the necessary text files and computes a summary table as follows:

1. the Activities (in the "y_test" and "y_train" files) are appropiately renamed
2. the main two data tables ("test" and "trains") have column names added from the "features" file
3. the renamed Activities ("activities_test" and "activities_train" respectivaly) added to both databases as a new variable named "activity"
4. similarly, a "Person" variable ("Subject_test" and "Subject_train" respectivaly) is added to both databases

Now, both datatables have a similar column structure, each with a different number of rows identified by both "activity" and "person"

5. Merging of the two datasets using "rbind" function into a "MergedDB" dataset
6. construction of a compact dataset by selecting the relevant columns as "compactMergedDB"
(the columns are selected using the "grep" function incorporating the textual identiers of the mean() and std() variables)

7. Cleansing of the column names: I choose to retain the identifying variables "activity" and "person" while renaming the descriptive variables as 1 to 66. These variables can be sees in the CodeBook.md file.

8. Writing of an output files: averages grouped by the identifying variables "activity" and "person".
