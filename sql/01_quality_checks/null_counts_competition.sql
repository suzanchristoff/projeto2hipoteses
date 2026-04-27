-- ============================================
-- Verificação de Valores Nulos - Tabela Competition
-- ============================================
-- Descrição: Conta valores nulos nas colunas
--          de posições em charts
-- Tabela: `meu-primeiro-projeto-419811.PROJETO1.tb_competition`
-- ============================================

SELECT 
  COUNT(CASE WHEN track_id IS NULL THEN 1 END) AS track_id_null_count,
  COUNT(CASE WHEN in_apple_playlists IS NULL THEN 1 END) AS in_apple_playlists_null_count,
  COUNT(CASE WHEN in_apple_charts IS NULL THEN 1 END) AS in_apple_charts_null_count,
  COUNT(CASE WHEN in_deezer_playlists IS NULL THEN 1 END) AS in_deezer_playlists_null_count,
  COUNT(CASE WHEN in_deezer_charts IS NULL THEN 1 END) AS in_deezer_charts_null_count,
  COUNT(CASE WHEN in_shazam_charts IS NULL THEN 1 END) AS in_shazam_charts_null_count
  
FROM `meu-primeiro-projeto-419811.PROJETO1.tb_competition`;
