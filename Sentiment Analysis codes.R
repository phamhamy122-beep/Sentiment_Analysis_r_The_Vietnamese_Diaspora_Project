library(readxl)
library(syuzhet)


#importing data for German video 1: Cuộc sống ở Đức - Không nên đến Đức! Nếu bạn không thích 11 điều này 
ko_nen_den_duc <- read_excel("ko_nen_den_duc.xlsx",
                             col_types = c("text", "text", "text",
                                           "skip", "text", "text", "skip", "skip",
                                           "text", "skip", "skip"))
#View(ko_nen_den_duc)

#using NRC method to get sentiment scores
ko_nen_den_duc$sentimentscores <- get_nrc_sentiment(ko_nen_den_duc$description, language = "vietnamese")
plot_KNDD <- barplot(sort(colSums(prop.table(ko_nen_den_duc$sentimentscores[, 1:8]))), horiz = TRUE, xlim = c(0, 0.5), cex.names = 0.7, las = 1, main = "Emotions in Comments of KNDD", xlab = "Percentage")
View(plot_KNDD)

#find the comment with highest trust score
max_trust_value1 <- which.max(ko_nen_den_duc$sentimentscores$trust)
max_trust_item1 <- ko_nen_den_duc$description[max_trust_value1]
max_trust_item1


#importing data for German video 2: Cuộc sống Đức - Những điều người Việt hiểu sai về cuộc sống Đức 
Nhung_dieu_hieu_sai <- read_excel("Nhung_dieu_hieu_sai.xlsx",
                                  col_types = c("text", "text", "text",
                                                "skip", "skip", "text", "skip", "skip",
                                                "skip", "skip", "skip"))
#View(Nhung_dieu_hieu_sai)

#using NRC method to get sentiment scores
Nhung_dieu_hieu_sai$sentimentscores <- get_nrc_sentiment(Nhung_dieu_hieu_sai$description, language = "vietnamese")
plot_NDHS <- barplot(sort(colSums(prop.table(Nhung_dieu_hieu_sai$sentimentscores[, 1:8]))), horiz = TRUE, xlim = c(0, 0.5), cex.names = 0.7, las = 1, main = "Emotions in  Comments of NDHS", xlab = "Percentage")
View(plot_NDHS)

#find the comment with highest trust score
max_trust_value2 <- which.max(Nhung_dieu_hieu_sai$sentimentscores$trust)
max_trust_item2 <- Nhung_dieu_hieu_sai$description[max_trust_value2]
max_trust_item2



#importing data for French video 1: Lấy chồng Tây = AUTO Giàu???|Cuộc sống ở Pháp
Ly_chng_Ty_Php <- read_excel("Ly_chng_Ty_Php.xlsx",
                             col_types = c("text", "text", "text",
                                           "skip", "text", "text", "skip", "skip",
                                           "text", "skip", "skip"))
#View(Ly_chng_Ty_Php)

#using NRC method to get sentiment scores
Ly_chng_Ty_Php$sentimentscores <- get_nrc_sentiment(Ly_chng_Ty_Php$description, language = "vietnamese")
plot_LCTP <- barplot(sort(colSums(prop.table(Ly_chng_Ty_Php$sentimentscores[, 1:8]))), horiz = TRUE, xlim = c(0, 0.5), cex.names = 0.7, las = 1, main = "Emotions in  Comments of LCTP", xlab = "Percentage")
View(plot_LCTP)

#find the comment with highest trust score
max_trust_value3 <- which.max(Ly_chng_Ty_Php$sentimentscores$trust)
max_trust_item3 <- Ly_chng_Ty_Php$description[max_trust_value3]
max_trust_item3


#importing data for French video 2: Lấy chồng Tây/Cuộc sống vùng thôn quê Pháp/Mai Le Cuộc Sống Ở Pháp
Cuoc_song_thon_que_ <- read_excel("Cuoc_song_thon_que_.xlsx",
                                  col_types = c("text", "text", "text",
                                                "skip", "skip", "text", "skip", "skip",
                                                "skip", "skip", "skip"))
#View(Cuoc_song_thon_que_)

#using NRC method to get sentiment scores
Cuoc_song_thon_que_$sentimentscores <- get_nrc_sentiment(Cuoc_song_thon_que_$description, language = "vietnamese")
plot_CSTQ <- barplot(sort(colSums(prop.table(Cuoc_song_thon_que_$sentimentscores[, 1:8]))), horiz = TRUE, xlim = c(0, 0.5), cex.names = 0.7, las = 1, main = "Emotions in  Comments of CSTQ", xlab = "Percentage")
View(plot_CSTQ)

#find the comment with highest trust score
max_trust_value4 <- which.max(Cuoc_song_thon_que_$sentimentscores$trust)
max_trust_item4 <- Cuoc_song_thon_que_$description[max_trust_value4]
max_trust_item4


#Get summary tables of sentiment scores
#Print out the results to csv files.

table_KNDD <- colSums(prop.table(ko_nen_den_duc$sentimentscores[, 1:8]))
table_KNDD
KNDD_csv <- "KNDDsentimentscores.csv"
write.csv(table_KNDD, KNDD_csv)

table_NDHS <- colSums(prop.table(Nhung_dieu_hieu_sai$sentimentscores[, 1:8]))
table_NDHS
NDHS_csv <- "NDHSsentimentscores.csv"
write.csv(table_NDHS, NDHS_csv)

table_LCTP <- colSums(prop.table(Ly_chng_Ty_Php$sentimentscores[, 1:8]))
table_LCTP
LCTP_csv <- "LCTPsentimentscores.csv"
write.csv(table_LCTP, LCTP_csv)

table_CSTQ <- colSums(prop.table(Cuoc_song_thon_que_$sentimentscores[, 1:8]))
table_CSTQ
CSTQ_csv <- "CSTQsentimentscores.csv"
write.csv(table_CSTQ, CSTQ_csv)