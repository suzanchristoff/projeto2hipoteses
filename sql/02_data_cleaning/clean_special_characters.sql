-- ============================================
-- Limpeza de Caracteres Especiais - Spotify
-- ============================================
-- Descrição: Remove caracteres não alfanuméricos
--          e padroniza espaços nos nomes das músicas
-- Resultado: Texto limpo e em CAIXA ALTA
-- ============================================

SELECT  
  UPPER(REGEXP_REPLACE(
    REGEXP_REPLACE(track_name, r'[^a-zA-Z0-9]', ' '), 
    r'\s+', ' '
  )) AS track_name_editados
FROM `meu-primeiro-projeto-419811.PROJETO1.tb_spotify`;
