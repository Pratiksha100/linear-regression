# Simple Linear Regression

# Data Preprocessing

# Importing datset
dataset = read.csv('Salary_Data.csv')

#splitting the data into training set and testing set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to Training Set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

# Predicting The Test Set Results
y_pred = predict(regressor, newdata = test_set)

# Visualizing The Trainig Set Results
install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), 
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary Vs Experience(Trainig Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

# Visualizing The Test Set Results
install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), 
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary Vs Experience(Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')











