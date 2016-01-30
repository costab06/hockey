library(randomForest)
library(caret)
library(doParallel)

# readin and set the data column types

df<-read.csv("hockey_stage.csv")
df$GAME_DATE<-as.Date(df$GAME_DATE,format="%Y-%b-%d")
df$GAME_DOW<-as.factor(df$GAME_DOW)
df$TEAM_ID<-as.factor(df$TEAM_ID)



# Create a coupld of data frames for models

gf_df<-df
gf_df<-gf_df[,-c(1,2,3,8)]


ga_df<-df
ga_df<-ga_df[,-c(1,2,3,7)]


set.seed(1234)

tControl<-trainControl(method = "repeatedcv",number=10,repeats=10)

#run model in parallel

# Calculate the number of cores
no_cores <- detectCores() - 1

# Initiate cluster
cl <- makeCluster(no_cores)

registerDoParallel(cl) 

modelFitGA<-randomForest(GOALS_AGAINST ~ .,data=ga_df, method="rf", trControl=tControl, verbose=FALSE)
modelFitGF<-randomForest(GOALS_FOR ~ ., data=gf_df, method="rf", trControl=tControl, verbose=FALSE)



stopCluster(cl)




gf_df2<-gf_df
ga_df2<-ga_df
gf_df2$GOALS_FOR<-as.factor(gf_df2$GOALS_FOR)
ga_df2$GOALS_AGAINST<-as.factor(ga_df2$GOALS_AGAINST)
 
modelFitGA2<-randomForest(GOALS_AGAINST ~ ., data=ga_df2, method="rf", trControl=tControl, verbose=FALSE)
modelFitGF2<-randomForest(GOALS_FOR ~ ., data=gf_df2, method="rf", trControl=tControl, verbose=FALSE)
