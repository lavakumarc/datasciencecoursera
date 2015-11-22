Load all data. 

Applied headers for the both test and train datasets.

Filted only means and standard deviations from the set of observations

test and train data sets were merged into one. For readability column names of SubjectID and Activity were added for the subject and y values respectively.

An aggregation was performed on all columns of the data frame, grouping by SubjectID and Activity.

Activity name was assigned to each of the levels in the Activity column.

When the script is executed it will output tab separated values to a text file (named tidydata.txt) in the users current working directory