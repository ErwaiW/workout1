
nba2018 = read.csv("~/Desktop/workout1/data/nba2018.csv")
nba2018$experience=as.character(nba2018$experience)
nba2018$experience[nba2018$experience=="R"] <- "0"
nba2018$experience=as.integer(nba2018$experience)
salary=nba2018$salary/1000000
levels(nba2018$position) <- c("center","power_fwd","point_guard","small_fwd","shoot_guard")
library(dplyr)
missed_fg=nba2018$field_goals_atts-nba2018$field_goals
missed_ft=nba2018$points1_atts-nba2018$points1
rebounds=nba2018$off_rebounds+nba2018$def_rebounds
efficiency=(nba2018$points+rebounds+nba2018$assists+nba2018$steals+nba2018$blocks-missed_fg-missed_ft-nba2018$turnovers)/nba2018$games
nba2018new=mutate(nba2018,missed_fg,missed_ft,rebounds,efficiency)
setwd("Desktop/workout1/code")
summary(efficiency,sink("../output/efficiency-summary.txt"))

nba = group_by(nba2018new,team)
teams=data.frame(nba$team,nba$experience,nba$salary,nba$points3,nba$points2,nba$points1,nba$points,nba$off_rebounds,nba$def_rebounds,nba$assists,nba$steals,nba$blocks,nba$turnovers,nba$fouls,nba$efficiency)
summary(teams,sink("../data/teams-summary.txt"))
write.csv(teams,"../data/nba2018-teams.csv")
