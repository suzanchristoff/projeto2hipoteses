-- ============================================
-- CRIAÇÃO DA TABELA INTEGRADA FINAL
-- ============================================
-- Descrição: Une as 3 views (Spotify, Competition, Technical)
--          em uma única tabela para análise
-- 
-- Tabela criada: `PROJETO1.tb_dados_integrados`
-- 
-- Dimensões incluídas:
--   - Dados do Spotify (streams, playlists, artistas)
--   - Dados de competição (Apple, Deezer)
--   - Dados técnicos (bpm, danceability, energy, etc.)
--   - Métricas derivadas (total_playlists)
--   - Classificações (quartis e categorias)
-- ============================================

CREATE OR REPLACE TABLE `meu-primeiro-projeto-419811.PROJETO1.tb_dados_integrados` AS

SELECT 
  -- Spotify data
  spotify.track_id,
  track_name_editados AS track_name,
  artist_s__name_editados AS artist_s_name,
  artist_count,
  released_year,
  released_month,
  released_day,
  released_date,
  decade,
  in_spotify_playlists,
  in_spotify_charts,
  streams_inteiros AS streams_spotify,
  total_musics_by_artist,
  total_solo_music,

  -- Competition data
  in_apple_playlists,
  in_apple_charts,
  in_deezer_playlists,
  in_deezer_charts,
  
  -- Derived metric: total playlists across platforms
  (in_spotify_playlists + in_apple_playlists + in_deezer_playlists) AS total_playlists, 

  -- Technical data
  bpm,
  danceability__ AS danceability,
  valence__ AS valence,
  energy__ AS energy,
  acousticness__ AS acousticness,
  instrumentalness__ AS instrumentalness,
  liveness__ AS liveness,
  speechiness__ AS speechiness,
  
  -- Quartis e classificações
  quartile_bpm,
  classif_bpm,
  quartile_danceability,
  classif_danceability,
  quartile_valence,
  classif_valence,
  quartile_energy,
  classif_energy,
  quartile_acousticness,
  classif_acousticness,
  quartile_instrumentalness,
  classif_instrumentalness,
  quartile_liveness,
  classif_liveness,
  quartile_speechiness,
  classif_speechiness

FROM `meu-primeiro-projeto-419811.PROJETO1.view_tb_spotify_limpa` AS spotify 

LEFT JOIN `meu-primeiro-projeto-419811.PROJETO1.view_tb_competition_limpa` AS competition
  ON spotify.track_id = competition.track_id

LEFT JOIN `meu-primeiro-projeto-419811.PROJETO1.view_tb_technical_info_limpa` AS technical_info
  ON spotify.track_id = technical_info.track_id

-- Removendo track_ids irrelevantes
WHERE spotify.track_id NOT IN ('3814670', '5080031', '1119309', '8173823', '4061483');
