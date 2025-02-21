# code script written to visualise dummy data for my grant proposal assessment
# Case Study: Does S. solidus manipulate stickleback (secondary host) behaviour in order to increase transmission into birds (tertiary hosts)?




#### Set-Up ####

# clear history
rm(list=ls())

# load necessary packages
library(ggplot2)
library(tidyr)
library(dplyr)
library(readxl)
library(cowplot)
library(patchwork)




#### FIGURE 3 ####

# Import data sets
attack_rate_3a <- read_excel("data/attack_rates.xlsx", sheet = "attack_rate_3a", range = "A1:D46")
predation_3b <- read_excel("data/predation_success.xlsx", sheet = "predation_3b", range = "A1:D46")
attack_rate_3c <- read_excel("data/attack_rates.xlsx", sheet = "attack_rate_3c", range = "A1:D46")
predation_3d <- read_excel("data/predation_success.xlsx", sheet = "predation_3d", range = "A1:D46")
attack_rate_3e <- read_excel("data/attack_rates.xlsx", sheet = "attack_rate_3e", range = "A1:D46")
predation_3f <- read_excel("data/predation_success.xlsx", sheet = "predation_3f", range = "A1:D46")

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
figure_3a <- ggplot(attack_rate_3a, aes(x = infection_status, y = attack_rate, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Attacks") +
  ylim(0,10) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "springgreen2", "infected_under_50mg" = "springgreen3", "infected_over_50mg" = "springgreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_3a

# Figure 3b
figure_3b <- ggplot(predation_3b, aes(x = infection_status, y = predation_success, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Probability \nof Predation") +
  ylim(0,1) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "palegreen2", "infected_under_50mg" = "palegreen3", "infected_over_50mg" = "palegreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_3b

# Figure 3c
figure_3c <- ggplot(attack_rate_3c, aes(x = infection_status, y = attack_rate, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Attacks") +
  ylim(0,10) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "springgreen2", "infected_under_50mg" = "springgreen3", "infected_over_50mg" = "springgreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_3c

# Figure 3d
figure_3d <- ggplot(predation_3d, aes(x = infection_status, y = predation_success, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Probability \nof Predation") +
  ylim(0,1) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "palegreen2", "infected_under_50mg" = "palegreen3", "infected_over_50mg" = "palegreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_3d

# Figure 3e
figure_3e<- ggplot(attack_rate_3e, aes(x = infection_status, y = attack_rate, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Attacks") +
  ylim(0,10) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "springgreen2", "infected_under_50mg" = "springgreen3", "infected_over_50mg" = "springgreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_3e

# Figure 3f
figure_3f <- ggplot(predation_3f, aes(x = infection_status, y = predation_success, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Probability \nof Predation") +
  ylim(0,1) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "palegreen2", "infected_under_50mg" = "palegreen3", "infected_over_50mg" = "palegreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_3f

# combine plots into one figure
figure_3 <- plot_grid(figure_3a, figure_3b, figure_3c, figure_3d, figure_3e, figure_3f, nrow = 3, ncol = 2, labels = c("A)", "B)", "C)", "D)", "E)", "F)"))

figure_3_final <- plot_grid(
  ggdraw() +
    draw_label("Attempted Attacks", fontface = "bold", size = 12, x = 0.10, y = 0.5) +
    draw_label("Successful Predation Attempts", fontface = "bold", size = 12, x = 0.66, y = 0.5),
  figure_3,
  ncol = 1,
  rel_heights = c(0.05, 1))

figure_3_final

# save final plot
ggsave("figures/figure_3.png", width = 20, height = 20, units = "cm")




#### Figure 4 ####

# Import data sets
attack_rate_4a <- read_excel("data/attack_rates.xlsx", sheet = "attack_rate_4a", range = "A1:D46")
predation_4b <- read_excel("data/predation_success.xlsx", sheet = "predation_4b", range = "A1:D46")

# Pivot data frames so that ggplot can read them
attack_rate_4a <- attack_rate_4a %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status", 
               values_to = "attack_rate")
predation_4b <- predation_4b %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status",
               values_to = "predation_success")

# Plot Figures

# Figure 4a
figure_4a <- ggplot(attack_rate_4a, aes(x = infection_status, y = attack_rate, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Attacks") +
  ylim(0,5) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "springgreen2", "infected_under_50mg" = "springgreen3", "infected_over_50mg" = "springgreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_4a

# Figure 4b
figure_4b <- ggplot(predation_4b, aes(x = infection_status, y = predation_success, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Probability \nof Predation") +
  ylim(0,1) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "palegreen2", "infected_under_50mg" = "palegreen3", "infected_over_50mg" = "palegreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_4b

# combine plots into one figure
figure_4 <- plot_grid(figure_4a, figure_4b, nrow = 1, ncol = 2, labels = c("A)", "B)")) 

figure_4_final <- plot_grid(
  ggdraw() +
    draw_label("Attempted Attacks", fontface = "bold", size = 12, x = 0.10, y = 0.5) +
    draw_label("Successful Predation Attempts", fontface = "bold", size = 12, x = 0.66, y = 0.5),
  figure_4,
  ncol = 1,
  rel_heights = c(0.05, 1))

figure_4_final

# save final plot
ggsave("figures/figure_4.png", width = 20, height = 10, units = "cm")




#### Figure 5 ####

# Import data sets
attack_rate_5a <- read_excel("data/attack_rates.xlsx", sheet = "attack_rate_5a", range = "A1:D46")
predation_5b <- read_excel("data/predation_success.xlsx", sheet = "predation_5b", range = "A1:D46")

# Pivot data frames so that ggplot can read them
attack_rate_5a <- attack_rate_5a %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status", 
               values_to = "attack_rate")
predation_5b <- predation_5b %>%
  pivot_longer(cols = c(non_infected, infected_under_50mg, infected_over_50mg), 
               names_to = "infection_status",
               values_to = "predation_success")

# Plot Figures

# Figure 5a
figure_5a <- ggplot(attack_rate_5a, aes(x = infection_status, y = attack_rate, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Attacks") +
  ylim(0,5) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "springgreen2", "infected_under_50mg" = "springgreen3", "infected_over_50mg" = "springgreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_5a

# Figure 5b
figure_5b <- ggplot(predation_5b, aes(x = infection_status, y = predation_success, fill = infection_status)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Infection Status", y = "Average Probability \nof Predation") +
  ylim(0,1) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.2) +
  scale_x_discrete(limits=c("non_infected", "infected_under_50mg", "infected_over_50mg"), labels = c("Non-Infected", "Infected (<50mg)", "Infected (>50mg)")) +
  scale_fill_manual(values = c("non_infected" = "palegreen2", "infected_under_50mg" = "palegreen3", "infected_over_50mg" = "palegreen4")) +
  theme_classic() +
  theme(legend.position = "none", axis.title = element_text(size = 10), axis.text = element_text(size = 8), plot.title = element_text(hjust = 0, face = "bold")) +
  ggtitle(" ")
figure_5b

# combine plots into one figure
figure_5 <- plot_grid(figure_5a, figure_5b, nrow = 1, ncol = 2, labels = c("A)", "B)")) 

figure_5_final <- plot_grid(
  ggdraw() +
    draw_label("Attempted Attacks", fontface = "bold", size = 12, x = 0.10, y = 0.5) +
    draw_label("Successful Predation Attempts", fontface = "bold", size = 12, x = 0.66, y = 0.5),
  figure_4,
  ncol = 1,
  rel_heights = c(0.05, 1))

figure_5_final

# save final plot
ggsave("figures/figure_5.png", width = 20, height = 10, units = "cm")