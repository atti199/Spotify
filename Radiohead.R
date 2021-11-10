# install.packages("devtools")
# devtools::install_github('charlie86/spotifyr')
# install.packages("spotifyr")
# install.packages("tidyverse")
library(spotifyr)
library(tidyverse)
library(knitr)
Sys.setenv(SPOTIFY_CLIENT_ID = '196e96f8a0c6493fb713c2a2c41757e6')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'c23af2ddc61e464e8e95b21406010a50')

access_token <- get_spotify_access_token()

beatles <- get_artist_audio_features('the beatles')
radiohead <- get_artist_audio_features('Radiohead')
# radiohead2 <- get_artist("4Z8W4fKeB5YxbusRsdQVPb")
library(lubridate)

get_my_recently_played(limit = 5) %>% 
  mutate(artist.name = map_chr(track.artists, function(x) x$name[1]),
         played_at = as_datetime(played_at)) %>% 
  select(track.name, artist.name, track.album.name, played_at) %>% 
  kable()
get_my_top_artists_or_tracks(type = 'artists', time_range = 'long_term', limit = 5) %>% 
  select(name, genres) %>% 
  rowwise %>% 
  mutate(genres = paste(genres, collapse = ', ')) %>% 
  ungroup %>% 
  kable()
