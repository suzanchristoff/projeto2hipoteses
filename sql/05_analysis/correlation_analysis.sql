-- ============================================
-- ANÁLISE DE CORRELAÇÃO ENTRE VARIÁVEIS
-- ============================================
-- Descrição: Calcula correlações entre diferentes
--          métricas e streams da Spotify
-- 
-- Fórmula: Coeficiente de Correlação de Pearson (CORR)
-- Interpretação:
--   Próximo a +1: correlação positiva forte
--   Próximo a 0: sem correlação
--   Próximo a -1: correlação negativa forte
-- ============================================

SELECT 
  -- Relação artista vs streams
  CORR(total_solo_music, streams_spotify) AS correlation_solo_music_streams,
  
  -- Relação entre charts de diferentes plataformas
  CORR(in_spotify_charts, in_deezer_charts) AS correlation_charts_spotify_deezer,
  CORR(in_spotify_charts, in_apple_charts) AS correlation_charts_spotify_apple,
  
  -- Relação playlists vs streams
  CORR(total_playlists, streams_spotify) AS correlation_playlists_streams,
  
  -- Relação características técnicas vs streams
  CORR(bpm, streams_spotify) AS correlation_bpm_streams,
  CORR(danceability, streams_spotify) AS correlation_danceability_streams,
  CORR(valence, streams_spotify) AS correlation_valence_streams,
  CORR(energy, streams_spotify) AS correlation_energy_streams,
  CORR(acousticness, streams_spotify) AS correlation_acousticness_streams,
  CORR(instrumentalness, streams_spotify) AS correlation_instrumentalness_streams,
  CORR(liveness, streams_spotify) AS correlation_liveness_streams,
  CORR(speechiness, streams_spotify) AS correlation_speechness_streams

FROM `meu-primeiro-projeto-419811.PROJETO1.tb_dados_integrados`;
