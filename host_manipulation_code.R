# code script written to visualise dummy data for my grant proposal assessment
# Case Study: Does S. solidus manipulate stickleback (secondary host) behaviour in order to increase transmission into birds (tertiary hosts)?




#### Set-Up ####

# clear history
rm(list=ls())

# load necessary packages
library(ggplot2)
library(tidyr)
library(dplyr)




#### FIGURE 3 ####

# Import data sets
attack_rate_3a <- read_excel("./attack_rates.xlsx", sheet = "attack_rate_3a", range = "A1:D46")
predation_3b <- read_excel("./predation_success.xlsx", sheet = "predation_3b", range = "A1:D46")
attack_rate_3c <- read_excel("./attack_rates.xlsx", sheet = "attack_rate_3c", range = "A1:D46")
predation_3d <- read_excel("./predation_success.xlsx", sheet = "predation_3d", range = "A1:D46")
attack_rate_3e <- read_excel("./attack_rates.xlsx", sheet = "attack_rate_3e", range = "A1:D46")
predation_3f <- read_excel("./predation_success.xlsx", sheet = "predation_3f", range = "A1:D46")

# Pivot data frames so that ggplot can read them
attack_rate_3a <- attack_rate_3a %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status", 
               values_to = "attack_rate")
predation_3b <- predation_3b %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status",
               values_to = "predation_success")
attack_rate_3c <- attack_rate_3c %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status", 
               values_to = "attack_rate")
predation_3d <- predation_3d %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status", 
               values_to = "predation_success")
attack_rate_3e <- attack_rate_3e %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status",
               values_to = "attack_rate")
predation_3f <- predation_3f %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status",  
               values_to = "predation_success")

# Plot Figures

# Figure 3a
ggplot(attack_rate_3a, aes(x = infection_status, y = attack_rate, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Avg. Attacks per Individual") +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "springgreen2", "infected_under_50mg" = "springgreen3", "infected_over_50mg" = "springgreen4")) +
  theme_classic() +
  theme(legend.position = "none")

# Figure 3b
ggplot(predation_3b, aes(x = infection_status, y = predation_success, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Probability of Predation per Individual") +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "palegreen2", "infected_under_50mg" = "palegreen3", "infected_over_50mg" = "palegreen4")) +
  theme_classic() +
  theme(legend.position = "none")

# Figure 3c
ggplot(attack_rate_3c, aes(x = infection_status, y = attack_rate, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Avg. Attacks per Individual") +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "springgreen2", "infected_under_50mg" = "springgreen3", "infected_over_50mg" = "springgreen4")) +
  theme_classic() +
  theme(legend.position = "none")

# Figure 3d
ggplot(predation_3d, aes(x = infection_status, y = predation_success, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Probability of Predation per Individual") +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "palegreen2", "infected_under_50mg" = "palegreen3", "infected_over_50mg" = "palegreen4")) +
  theme_classic() +
  theme(legend.position = "none")

# Figure 3e
ggplot(attack_rate_3e, aes(x = infection_status, y = attack_rate, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Avg. Attacks per Individual") +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "springgreen2", "infected_under_50mg" = "springgreen3", "infected_over_50mg" = "springgreen4")) +
  theme_classic() +
  theme(legend.position = "none")

# Figure 3f
ggplot(predation_3f, aes(x = infection_status, y = predation_success, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Probability of Predation per Individual") +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "palegreen2", "infected_under_50mg" = "palegreen3", "infected_over_50mg" = "palegreen4")) +
  theme_classic() +
  theme(legend.position = "none")