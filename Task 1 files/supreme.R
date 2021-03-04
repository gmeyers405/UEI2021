#load packages
library(tidyverse)
library(ggplot2)

#load data
scdbv_mod <- read_csv(here::here("data", "SCDB_2019_01_justiceCentered_Citation.csv"))
scdbv_leg <- read_csv(here::here("data", "SCDB_Legacy_05_justiceCentered_Citation.csv"))
scdbv <- bind_rows(scdbv_mod, scdbv_leg)

#upload newly made csvs with relevant labels
issues <- read_csv("issues - Sheet1.csv")
states <- read_csv("states - Sheet1.csv")

#combine everything
scdbv1 <-left_join(x = scdbv, y = issues) 
scdbv2 <-left_join(x = scdbv1, y = states)

#filter out non-states and only include years in which all 50 states were in the US
scotus <- scdbv2 %>%
  filter(caseSourceState != c(3, 10, 11, 14, 24, 40, 44, 46, 54, 60:65)) %>%
  filter(term >= 1960)

#create a table with the first row as each state and the next columns representing how many times each state was a source
freqtable <- scotus %>%
  distinct(caseId, State) %>%
  count(State) %>%
  drop_na(State) %>%
  arrange(desc(n))
knitr::kable(freqtable[1:10, ],caption = "Frequency of Supreme Court Case Sources by State (1960-2020)", col.names = c("State", "Frequency"))

#special dataset for the top ten states
scotus1 <- scotus %>%
  filter(State == "California"|State == "Florida"|State == "New York"|State == "Illinois"|State == "Texas"|State == "Louisiana"|State == "Ohio"|State == "Georgia"|State == "Alabama"|State == "Washington")

#special factor for the top ten states
state_levels <- c("California", "Florida", "New York", "Illinois", "Texas", "Louisiana", "Ohio", "Georgia", "Alabama", "Washington")

#line graph to see what percent of the time did cases result in a declaration of unconstitutionality
unconst <- scotus %>%
  distinct(term, caseId, declarationUncon) %>%
  group_by(term) %>%
  summarize(uncon = 1- mean(declarationUncon == 1), na.rm = TRUE)

unconst %>%
  ggplot(mapping = aes(term, uncon)) +
  geom_line() +
  labs(title = "Declarations of Unconstitutionality by Term (1960-2020)", x = "Term", y = "Percent of Cases with a Declaration of Unconstitutionality") +
  scale_y_continuous(labels = scales::percent)

#line graph organized by the top ten states
unconst1 <- scotus1 %>%
  distinct(term, caseId, declarationUncon, State) %>%
  group_by(term, State) %>%
  summarize(uncons = 1- mean(declarationUncon == 1), na.rm = TRUE)

unconst1 %>%
  ggplot(mapping = aes(term, uncons, color = factor(State, levels = state_levels))) +
  geom_line() +
  facet_wrap(~factor(State, levels = state_levels)) +
  labs(title = "Declarations of Unconstitutionality by Term (1960-2020)", x = "Term", y = "Percent of Cases with a Declaration of Unconstitutionality") +
  scale_y_continuous(labels = scales::percent) +
  theme(legend.position = "none")

#line graph to see what percent of the time cases were won for conservatives
scotus$decisiondirection <- plyr::mapvalues(scotus$decisionDirection, from = c(1, 2), to = c(1, 0))

conservative <- scotus %>%
  distinct(term, caseId, decisiondirection) %>%
  group_by(term) %>%
  summarize(ratio = mean(decisiondirection == 1, na.rm = TRUE))

conservative %>%
  ggplot(mapping = aes(term, ratio)) +
  geom_line() +
  labs(title = "Conservative Wins by Term (1960-2020)", x = "Term", y = "Percent of Cases with Conservative Decisions") +
  scale_y_continuous(labels = scales::percent)

#make line graph organized by the top 10 states
scotus1$decisiondirection <- plyr::mapvalues(scotus1$decisionDirection, from = c(1, 2), to = c(1, 0))

conservative1 <- scotus1 %>%
  distinct(term, caseId, decisiondirection, State) %>%
  group_by(term, State) %>%
  summarize(ratios = mean(decisiondirection == 1), na.rm = TRUE)

conservative1 %>%
  ggplot(mapping = aes(term, ratios, color = factor(State, levels = state_levels))) +
  geom_line() +
  facet_wrap(~factor(State, levels = state_levels)) +
  labs(title = "Conservative Wins by Term (1960-2020)", x = "Term", y = "Percent of Cases with a Conservative Decisions") +
  scale_y_continuous(labels = scales::percent) +
  theme(legend.position = "none")

#create a bar graph for cases by issue area, then facet it by state
scotissues <- scotus %>%
  distinct(IssueArea, caseId, State) %>%
  count(IssueArea) %>%
  drop_na(IssueArea)
ggplot(data = scotissues, mapping = aes(x = IssueArea, y = n, fill = IssueArea)) +
  geom_col() +
  labs(title = "Supreme Court Cases by Issue (1960-2020)", x = "Issue Area", y = "Number of Cases"
) +
  theme(axis.text.x= element_blank()) 

#filter top 10 states
scotissues1 <- scotus1 %>%
  distinct(IssueArea, caseId, State) %>%
  drop_na(IssueArea) %>%
  group_by(IssueArea, State) %>%
  summarize(n = n())

ggplot(data = scotissues1, mapping = aes(x = IssueArea, y = n, fill = IssueArea)) +
  geom_col() +
  facet_wrap(~factor(State, levels = state_levels)) +
  labs(title = "Supreme Court Cases by Issue (1960-2020)", x = "Issue Area", y = "Number of Cases"
  ) +
  theme(axis.text.x= element_blank())
  coord_flip() 


