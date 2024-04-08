install.packages(c("naivebayes", "caret", "ggplot2", "gridExtra"))
library(naivebayes)
library(caret)
library(ggplot2)
library(gridExtra)
weather_data <- read.csv("weather_forecast.csv")
str(weather_data)
set.seed(123)
train_index <- createDataPartition(weather_data$Play, p = 0.8, list = FALSE)
train_data <- weather_data[train_index, ]
test_data <- weather_data[-train_index, ]
nb_model <- naive_bayes(Play ~ Outlook + Temperature + Humidity + Windy, data = train_data)
predictions <- predict(nb_model, newdata = test_data)
conf_matrix <- table(predictions, test_data$Play)
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
print(conf_matrix)
print(paste("Accuracy:", round(accuracy, 4)))
plot1 <- ggplot(weather_data, aes(x = Outlook, fill = Play)) +
    geom_bar(position = "dodge") +
    ggtitle("Play vs. Outlook") +
    labs(x = "Outlook", y = "Count", fill = "Play")

# Barplot for Temperature vs. Play
plot2 <- ggplot(weather_data, aes(x = Temperature, fill = Play)) +
    geom_bar(position = "dodge") +
    ggtitle("Play vs. Temperature") +
    labs(x = "Temperature", y = "Count", fill = "Play")

# Barplot for Humidity vs. Play
plot3 <- ggplot(weather_data, aes(x = Humidity, fill = Play)) +
    geom_bar(position = "dodge") +
    ggtitle("Play vs. Humidity") +
    labs(x = "Humidity", y = "Count", fill = "Play")

# Barplot for Windy vs. Play
plot4 <- ggplot(weather_data, aes(x = Windy, fill = Play)) +
    geom_bar(position = "dodge") +
    ggtitle("Play vs. Windy") +
    labs(x = "Windy", y = "Count", fill = "Play")

# Combine all plots in a grid
grid.arrange(plot1, plot2, plot3, plot4, ncol = 2)