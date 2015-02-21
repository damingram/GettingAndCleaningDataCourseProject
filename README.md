
# Description of how the run_analysis.R script works.

Firstly, I'd just like to say that inspecting the TidyDataSet submitted on the course project web page is easily done by
saving it as a file, then reading it back into R, ie: data <- read.table(file_path, header = TRUE)

## Running the script.

**Please note!,** to run the run_analysis.R script successfully you must have installed the 'dplyr' package on your computer!
(ie in R:  install.packages("dplyr")).

As instructed by the assignment, the script will output a tidy data set as a text file into your working directory!
The file will be called "TidyDataSetingram.txt". For inspection, the tidy data set can then be read back into R.
(ie   data <- read.table("TidyDataSetingram.txt", header = TRUE) )

The script assumes all required files are in the "UCI HAR Dataset" folder in your working directory
ie the Smartphones Dataset files downloaded from the course project page, unzipped and unaltered in your working directory.

For steps 1 to 4 of the assignment the script operates by performing the following:

* Loads all the required tables from the Samsung files in your working directory.
* Names all the X_train and X_test columns using the feature table for variable names.
* Extracts only the measurements on the mean and standard deviation for each measurement by indexing those columns in X_train and X_test.
* Converts y number codes into activity labels by converting them to factors and adjusting factor levels to the activity labels provided.
* Joins the appropriate subject number and y activity labels as columns at the front of the  X_train and X_test data frames.
* Joins the resulting test data frame rows onto the bottom of the resulting train data frame and orders rows by Subject then Activity.

The necessary Smartphones data has now been merged into a tidy data frame ready for the final grouping and summarising analysis 
of step 5 which the script performs as follows:
 
* Loads dplyr, (assuming the 'dplyr' package has been installed!)
* Groups the data by Subject and Activity and then calculates the mean of each column by group by chaining
* Finally, outputs the data as "TidyDataSetingram.txt" file into your working directory!

There are 88 variables (columns) and 180 rows in the table.
Once again, to inspect it, read it back into R ..   read.table("TidyDataSetingram.txt", header = TRUE)

CodeBook.md describes the variables, the data, and any transformations or work performed to clean up the Smartphones data for analysis.