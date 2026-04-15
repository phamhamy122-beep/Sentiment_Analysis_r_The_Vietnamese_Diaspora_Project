library(readxl)
library(syuzhet)

#importing data 
#French video 1: Lấy chồng Tây/Cuộc sống vùng thôn quê Pháp/Mai Le Cuộc Sống Ở Pháp
vid1 <- read_excel("Scraped_data_4_videos.xlsx", sheet = 1,
                                  col_types = c("text", "text", "text",
                                                "skip", "skip", "text", "skip", "skip",
                                                "skip", "skip", "skip"))
#View(vid1)

#using NRC method to get sentiment scores
vid1$sentimentscores <- get_nrc_sentiment(vid1$description, language = "vietnamese")
plot_vid1 <- barplot(sort(colSums(prop.table(vid1$sentimentscores[, 1:8]))), horiz = TRUE, xlim = c(0, 0.5), cex.names = 0.7, las = 1, main = "Emotions in  Comments of CSTQ", xlab = "Percentage")
View(plot_vid1)

#find the comment with highest trust score
max_trust_value1 <- which.max(vid1$sentimentscores$trust)
max_trust_item1 <- vid1$description[max_trust_value1]
max_trust_item1

#French video 2: Lấy chồng Tây = AUTO Giàu???|Cuộc sống ở Pháp
vid2 <- read_excel("Scraped_data_4_videos.xlsx", sheet = 2,
                             col_types = c("text", "text", "text",
                                           "skip", "text", "text", "skip", "skip",
                                           "text", "skip", "skip"))
#View(vid2)

#using NRC method to get sentiment scores
vid2$sentimentscores <- get_nrc_sentiment(vid2$description, language = "vietnamese")
plot_vid2 <- barplot(sort(colSums(prop.table(vid2$sentimentscores[, 1:8]))), horiz = TRUE, xlim = c(0, 0.5), cex.names = 0.7, las = 1, main = "Emotions in  Comments of LCTP", xlab = "Percentage")
View(plot_vid2)

#find the comment with highest trust score
max_trust_value2 <- which.max(vid2$sentimentscores$trust)
max_trust_item2 <- vid2$description[max_trust_value2]
max_trust_item2


#German video 1: Cuộc sống ở Đức - Không nên đến Đức! Nếu bạn không thích 11 điều này 
vid3 <- read_excel("Scraped_data_4_videos.xlsx", sheet = 3,
                             col_types = c("text", "text", "text",
                                           "skip", "text", "text", "skip", "skip",
                                           "text", "skip", "skip"))
#View(vid3)

#using NRC method to get sentiment scores
vid3$sentimentscores <- get_nrc_sentiment(vid3$description, language = "vietnamese")
plot_vid3 <- barplot(sort(colSums(prop.table(vid3$sentimentscores[, 1:8]))), horiz = TRUE, xlim = c(0, 0.5), cex.names = 0.7, las = 1, main = "Emotions in Comments of KNDD", xlab = "Percentage")
View(plot_vid3)

#find the comment with highest trust score
max_trust_value3 <- which.max(vid3$sentimentscores$trust)
max_trust_item3 <- vid3$description[max_trust_value3]
max_trust_item3


#German video 2: Cuộc sống Đức - Những điều người Việt hiểu sai về cuộc sống Đức 
vid4 <- read_excel("Scraped_data_4_videos.xlsx", sheet = 4,
                                  col_types = c("text", "text", "text",
                                                "skip", "skip", "text", "skip", "skip",
                                                "skip", "skip", "skip"))
#View(vid4)

#using NRC method to get sentiment scores
vid4$sentimentscores <- get_nrc_sentiment(vid4$description, language = "vietnamese")
plot_vid4 <- barplot(sort(colSums(prop.table(vid4$sentimentscores[, 1:8]))), horiz = TRUE, xlim = c(0, 0.5), cex.names = 0.7, las = 1, main = "Emotions in  Comments of NDHS", xlab = "Percentage")
View(plot_vid4)

#find the comment with highest trust score
max_trust_value4 <- which.max(vid4$sentimentscores$trust)
max_trust_item4 <- vid4$description[max_trust_value4]
max_trust_item4




#Get summary tables of sentiment scores
#Print out the results to csv files.

table_vid1 <- colSums(prop.table(vid1$sentimentscores[, 1:8]))
table_vid1
vid1_csv <- "CSTQsentimentscores.csv"
write.csv(table_vid1, vid1_csv)

table_vid2 <- colSums(prop.table(vid2$sentimentscores[, 1:8]))
table_vid2
vid2_csv <- "LCTPsentimentscores.csv"
write.csv(table_vid2, vid2_csv)

table_vid3 <- colSums(prop.table(vid3$sentimentscores[, 1:8]))
table_vid3
vid3_csv <- "KNDDsentimentscores.csv"
write.csv(table_vid3, vid3_csv)

table_vid4 <- colSums(prop.table(vid4$sentimentscores[, 1:8]))
table_vid4
vid4_csv <- "NDHSsentimentscores.csv"
write.csv(table_vid4, vid4_csv)




