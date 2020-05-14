# Exploratory-Data-Analysis-Course-Project-2

# Recreating
There are seven R scripts:
loadData.R - Creates missing subdirectories, downloads zip file from source, unzips this data, and reads into R for use
question1.R - Creates the first plot when the data is loaded into the working environment by loadData()
question2.R - Creates the second plot when the data is loaded into the working environment by loadData()
question3.R - Creates the third plot when the data is loaded into the working environment by loadData()
question4.R - Creates the fourth plot when the data is loaded into the working environment by loadData()
question5.R - Creates the fifth plot when the data is loaded into the working environment by loadData()
question6.R - Creates the sixth plot when the data is loaded into the working environment by loadData()

To recreate in R, load in all necessary R scripts and then run loadData(), followed by the function to create the appropriate plot as shown below:
```
#Load in functions from scripts
source("./scripts/loadData.R")
source("./scripts/question1.R")
source("./scripts/question2.R")
source("./scripts/question3.R")
source("./scripts/question4.R")
source("./scripts/question5.R")
source("./scripts/question6.R")

#Use loadData() to load data into working environment
loadData()

#Run functions to create the plot(s) you wish to recreate
question1()
```