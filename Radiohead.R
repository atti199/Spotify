# install.packages("devtools")
# devtools::install_github('charlie86/spotifyr')
# install.packages("spotifyr")
# install.packages("tidyverse")
library(spotifyr)
library(tidyverse)
library(knitr)
Sys.setenv(SPOTIFY_CLIENT_ID = '196e96f8a0c6493fb713c2a2c41757e6')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '4866d222b15a47c0a83fdff5d47fb653')

library (spotifyr)

access_token <- get_spotify_access_token(
)

beatles <- get_artist_audio_features('the beatles')
radiohead <- get_artist_audio_features('Radiohead')
# radiohead2 <- get_artist("4Z8W4fKeB5YxbusRsdQVPb")

variable.names(spotify_tracks)
# df <- spotify_tracks <- read_csv("~/Documents/R/felmero/Spotify/SpotGenTrack/Data Sources/spotify_tracks.csv")
df <- spotify_tracks[c("popularity", "energy", "key", "loudness", "mode", "tempo", "valence", "acousticness", "danceability", "instrumentalness", "liveness", "speechiness" ,"time_signature")]
sample <- df[sample(nrow(df), 3000), ]

m1 <- lm(data = sample, popularity ~ energy + key + loudness + mode + tempo + valence + acousticness + danceability + instrumentalness + liveness + speechiness + time_signature)
summary(m1)
