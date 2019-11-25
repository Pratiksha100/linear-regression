#Data Preprocessing
#common libraries are already included in R

#importing datset
dataset = read.csv('kc_house_data.csv')

#splitting the data into training set and testing set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$price, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to Training Set
regressor = lm(formula = price ~ sqft_living, data = training_set)

# predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

# Visualizing the Training Set Result
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$sqft_living, y = training_set$price),
             color = 'orange') +
  geom_line(aes(x = training_set$sqft_living, y =predict(regressor, newdata = training_set),
             color = 'blue')) +
  ggtitle('Area for Living Vs Price of the House (Training Set)') +
  xlab('Price') +
  ylab('Area for Linving')

# Visualizing the Test Set Result
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$sqft_living, y = test_set$price),
             color = 'orange') +
  geom_line(aes(x = training_set$sqft_living, y =predict(regressor, newdata = training_set),
                color = 'blue')) +
  ggtitle('Area for Living Vs Price of the House (Test Set)') +
  xlab('Price') +
  ylab('Area for Linving')


