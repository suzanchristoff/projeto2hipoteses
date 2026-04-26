# Dados — Dicionário de Variáveis

Este projeto utilizou três tabelas originais carregadas no **BigQuery (Google Cloud Platform)**. Abaixo está a descrição de cada tabela e suas variáveis.

---

## 1. `track_in_spotify`

Dados de performance de cada música na plataforma Spotify.

| Variável | Tipo | Descrição |
| --- | --- | --- |
| `track_id` | Inteiro | Identificador exclusivo da música (7 dígitos, sem repetição) |
| `track_name` | Texto | Nome da música |
| `artist(s)_name` | Texto | Nome do(s) artista(s) da música |
| `artist_count` | Inteiro | Número de artistas que contribuíram na música |
| `released_year` | Inteiro | Ano de lançamento da música |
| `released_month` | Inteiro | Mês de lançamento da música |
| `released_day` | Inteiro | Dia do mês de lançamento da música |
| `in_spotify_playlists` | Inteiro | Número de playlists do Spotify em que a música está incluída |
| `in_spotify_charts` | Inteiro | Presença e posição da música nas paradas do Spotify |
| `streams` | Inteiro | Total de streams — número de vezes que a música foi ouvida |

---

## 2. `track_in_competition`

Dados de desempenho das músicas nas plataformas concorrentes: Apple Music, Deezer e Shazam.

| Variável | Tipo | Descrição |
| --- | --- | --- |
| `track_id` | Inteiro | Identificador exclusivo da música (7 dígitos, sem repetição) |
| `in_apple_playlists` | Inteiro | Número de playlists da Apple Music em que a música está incluída |
| `in_apple_charts` | Inteiro | Presença e classificação da música nas paradas da Apple Music |
| `in_deezer_playlists` | Inteiro | Número de playlists do Deezer em que a música está incluída |
| `in_deezer_charts` | Inteiro | Presença e posição da música nas paradas do Deezer |
| `in_shazam_charts` | Inteiro | Presença e classificação da música nas paradas do Shazam  |

> `in_shazam_charts` foi **excluída da análise** por conter mais de 5% de valores nulos e por não haver variável complementar de playlists da mesma plataforma para viabilizar comparação.
> 

---

## 3. `track_technical_info`

Dados referentes às características técnicas e musicais de cada faixa.

| Variável | Tipo | Descrição |
| --- | --- | --- |
| `track_id` | Inteiro | Identificador exclusivo da música (7 dígitos, sem repetição) |
| `bpm` | Inteiro | Batidas por minuto — medida do tempo/andamento da música |
| `key` | Texto | Tom musical da música  |
| `mode` | Texto | Modo da música: maior ou menor  |
| `danceability_%` | Inteiro | Percentual que indica o quão adequada a música é para dançar |
| `valence_%` | Inteiro | Positividade do conteúdo musical |
| `energy_%` | Inteiro | Nível de energia percebido da música |
| `acousticness_%` | Inteiro | Quantidade de som acústico na música |
| `instrumentalness_%` | Inteiro | Quantidade de conteúdo instrumental |
| `liveness_%` | Inteiro | Presença de elementos de performance ao vivo |
| `speechiness_%` | Inteiro | Quantidade de palavras faladas na música |

> `key` foi **excluída da análise** por conter ~10% de valores nulos, sem possibilidade de imputação confiável.
> 
> 
> `mode` foi **excluída da análise** por ser dependente de `key`.
> 

---

## Variáveis Criadas Durante o Processamento

Além das variáveis originais, as seguintes foram criadas durante o tratamento dos dados no BigQuery:

| Variável | Descrição |
| --- | --- |
| `date_released` | Data completa de lançamento (combinação de `released_year`, `released_month` e `released_day`) |
| `total_playlists` | Total de playlists somando todas as plataformas disponíveis |
| `total_musics_by_artist` | Total de músicas por artista no dataset |
| `[característica]_quartil` | Classificação de cada característica musical em quartis (Q1 a Q4) |
| `[característica]_nivel` | Classificação binária: `alto` (Q4) ou `baixo` (Q1, Q2, Q3) |
