-- ============================================
-- VIEW: view_tb_spotify_limpa
-- ============================================
-- Descrição: Cria visualização da tabela Spotify
--          com dados limpos e variáveis derivadas
-- 
-- Transformações aplicadas:
--   1. Limpeza de textos (track_name, artist_name)
--   2. Conversão de streams para INT
--   3. Criação de released_date (formato DATE)
--   4. Cálculo de décadas
--   5. Junção com contagem de músicas por artista
--   6. Junção com contagem de músicas solo
-- ============================================

WITH 
tb_musics_by_artist AS (
  SELECT 
    artist_s__name, 
    COUNT(*) AS total_musics_by_artist
  FROM `meu-primeiro-projeto-419811.PROJETO1.tb_spotify` 
  GROUP BY artist_s__name
),

tb_solo_artists AS (
  SELECT 
    artist_s__name, 
    COUNT(*) AS total_solo_music
  FROM `meu-primeiro-projeto-419811.PROJETO1.tb_spotify`
  WHERE artist_count = 1
  GROUP BY artist_s__name
)

SELECT 
  track_id,
  -- Limpeza do nome da música
  UPPER(REGEXP_REPLACE(
    REGEXP_REPLACE(track_name, r'[^a-zA-Z0-9]', ' '), 
    r'\s+', ' '
  )) AS track_name_editados,
  
  -- Limpeza do nome do artista
  UPPER(REGEXP_REPLACE(
    REGEXP_REPLACE(spotify.artist_s__name, r'[^a-zA-Z0-9,]', ' '), 
    r'\s+', ' '
  )) AS artist_s__name_editados,
  
  artist_count,
  released_year,
  released_month,
  released_day,
  
  -- Criação de data completa
  DATE(CONCAT(released_year, "-", released_month, "-", released_day)) AS released_date,
  
  -- Cálculo da década
  CAST(FLOOR(released_year / 10) * 10 AS INT64) AS decade,
  
  in_spotify_playlists,
  in_spotify_charts,
  
  -- Conversão segura para INT
  SAFE_CAST(streams AS INT64) AS streams_inteiros,
  
  -- Métricas por artista
  tb_musics_by_artist.total_musics_by_artist,
  tb_solo_artists.total_solo_music

FROM `meu-primeiro-projeto-419811.PROJETO1.tb_spotify` AS spotify

LEFT JOIN tb_musics_by_artist
  ON spotify.artist_s__name = tb_musics_by_artist.artist_s__name

LEFT JOIN tb_solo_artists
  ON spotify.artist_s__name = tb_solo_artists.artist_s__name;
