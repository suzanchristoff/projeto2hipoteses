# Análise de Dados — Spotify: O que faz uma música fazer sucesso?

> Projeto de análise de dados desenvolvido com o objetivo de identificar padrões de sucesso musical e apoiar o lançamento estratégico de um novo artista no mercado global.
> 

---

## Sumário

- [Contexto e Objetivos](#Contexto-e-Objetivos)
- [Hipóteses Investigadas](#Hipóteses-Investigadas)
- [Ferramentas e Tecnologias](#Ferramentas-e-Tecnologias)
- [Estrutura do Repositório](#Estrutura-do-Repositório)
- [Metodologia](#Metodologia)
- [Resultados e Conclusões](#Resultados-e-Conclusões)
- [Recomendações](#Recomendações)
- [Limitações e Próximos Passos](#Limitações-e-Próximos-Passos)
- [Equipe](#Equipe)

---

## Contexto e Objetivos

Uma gravadora busca lançar um novo artista no cenário musical global e contratou uma análise baseada em dados do Spotify para embasar suas decisões estratégicas. O projeto teve dois objetivos principais:

1. **Identificar padrões** de características musicais que contribuem para o alto volume de streams em plataformas como Spotify, Apple Music e Deezer.
2. **Validar ou refutar hipóteses** sobre os fatores que determinam o sucesso de uma música, fornecendo recomendações concretas à gravadora.

---

## Hipóteses Investigadas

| # | Hipótese | Resultado |
| --- | --- | --- |
| H1 | Músicas com BPM mais alto fazem mais sucesso em streams | ❌ Refutada |
| H2 | Músicas populares no Spotify têm desempenho similar no Deezer | ✅ Validada |
| H3 | Presença em mais playlists está correlacionada com mais streams | ✅ Validada |
| H4 | Artistas com mais músicas no Spotify têm mais streams | ❌ Refutada |
| H5 | Características musicais influenciam o número de streams | ❌ Refutada |

---

## Ferramentas e Tecnologias

| Etapa | Ferramenta |
| --- | --- |
| Armazenamento e tratamento de dados | SQL / BigQuery (Google Cloud Platform) |
| Análise exploratória e estatística | Python (Pandas, Matplotlib) / Google Colab |
| Visualização e dashboard | Power BI |

---

## Estrutura do Repositório

```
spotify-hipoteses/
│
├── README.md                   # Documentação principal do projeto
│
├── dados/
│   └── README.md               # Descrição das tabelas originais e variáveis
│
├── sql/
│   ├── 01_importacao.sql       # Criação do projeto e carregamento das tabelas
│   ├── 02_nulos.sql            # Identificação de valores nulos
│   ├── 03_duplicados.sql       # Identificação e tratamento de duplicatas
│   ├── 04_discrepantes.sql     # Tratamento de outliers (MAX, MIN, AVG)
│   ├── 05_novas_variaveis.sql  # Criação de variáveis derivadas e quartis
│   ├── 06_join_tabelas.sql     # União das tabelas em "dados_integrados"
│   └── 07_correlacoes.sql      # Cálculo de correlações entre variáveis
│
├── analise/
│   └── eda_spotify.ipynb       # Notebook Python com EDA, histogramas e estatísticas
│
├── dashboard/
│   └── dashboard_spotify.pbix  # Arquivo Power BI com dashboard interativo
│
└── imagens/
    └── dashboard_preview.png   # Print do dashboard para visualização rápida
```

---

## Metodologia

### 1. Processamento e Preparação dos Dados

Os dados foram organizados em três tabelas no BigQuery:

- **Tabela de performance**: dados de streams e posição no Spotify
- **Tabela de competição**: desempenho nas plataformas Deezer, Apple Music e Shazam
- **Tabela técnica**: características musicais (BPM, dançabilidade, energia, valência, etc.)

As etapas de limpeza incluíram:

- **Identificação e tratamento de nulos**: a variável `in_shazam_charts` (50 nulos) e `key` (95 nulos, ~10% dos dados) foram excluídas da análise por não viabilizarem imputação confiável
- **Remoção de duplicatas**: 4 músicas duplicadas identificadas; mantidas as entradas com maior número de streams
- **Padronização de texto**: nomes de músicas e artistas normalizados em caixa alta e sem caracteres especiais
- **Correção de tipos**: variável `streams` convertida de `string` para `inteiro`
- **Criação de variáveis**: `date_released`, `total_playlists`, `total_musics_by_artist` e classificações por quartil (`alto` / `baixo`) para todas as características musicais

### 2. Análise Exploratória

- Agrupamentos e visualizações por variáveis categóricas no Power BI
- Cálculo de média, mediana, desvio padrão e intervalo interquartil via Python (`Pandas`)
- Histogramas de distribuição gerados com `Matplotlib`
- Análise temporal (número de músicas lançadas ao longo do tempo)

### 3. Técnicas de Análise Aplicadas

- **Segmentação por quartis**: cada característica musical foi dividida em dois grupos — valores mais altos (Q4) vs. mais baixos (Q1–Q3) — para comparar a média de streams entre os grupos
- **Cálculo de correlações**: via SQL, para validar ou refutar a influência de cada variável no número de streams
- **Gráficos de dispersão**: para visualização das correlações e identificação de padrões

### 4. Dashboard

O dashboard em Power BI apresenta:

- Totais de streams, playlists, músicas e artistas
- Top 5 artistas e Top 10 músicas
- Linha do tempo de lançamentos
- Total de playlists por plataforma
- Distribuição de músicas por número de artistas participantes
- Médias das características musicais
- Filtros por artista, música, década, posição nos charts e nível de streams

---

## Resultados e Conclusões

**H1 — BPM e streams:** nenhuma correlação significativa encontrada. O BPM não é um fator determinante para o sucesso em termos de streams.

**H2 — Desempenho entre plataformas:** correlação positiva e significativa entre os rankings do Spotify, Apple Music e Deezer. Músicas populares em uma plataforma tendem a se sair bem nas demais, indicando consistência nas preferências do público.

**H3 — Playlists e streams:** forte correlação confirmada. Estar presente em mais playlists está diretamente associado a um maior volume de streams — este é o fator com maior impacto identificado no projeto.

**H4 — Quantidade de músicas por artista:** hipótese refutada. O volume de músicas de um artista no Spotify não apresenta correlação significativa com o total de streams.

**H5 — Características musicais (dançabilidade, energia, valência, etc.):** nenhuma correlação significativa com streams encontrada. Outros fatores parecem exercer maior influência sobre o sucesso.

---

## Recomendações

Com base nos resultados, recomendamos à gravadora:

1. **Priorizar a presença em playlists**: é o fator com maior impacto comprovado nos streams. Investir em pitching para playlists editoriais e algorítmicas do Spotify deve ser estratégia central.
2. **Promover o artista em múltiplas plataformas simultaneamente**: dado que o desempenho é consistente entre plataformas, uma estratégia multiplataforma potencializa o alcance.
3. **Explorar colaborações estratégicas (feats)**: artistas como Beyoncé, Ed Sheeran, Cardi B e Justin Bieber alcançaram resultados expressivos via parcerias. Feats com artistas estabelecidos ou em ascensão podem impulsionar o lançamento.
4. **Investir em marketing digital**: presença ativa no Instagram, TikTok e YouTube como canais de divulgação e construção de audiência.

---

## Limitações e Próximos Passos

**Limitações identificadas:**

- Ausência de dados sobre ações promocionais (impossibilidade de medir impacto de campanhas)
- Falta de informação sobre gênero musical (impede análise de tendências por estilo)
- Sem dados de faixa etária dos usuários (limita segmentação de estratégia de marketing)
- Sem dados geográficos de desempenho (impede direcionamento regional de campanhas e turnês)

**Próximos passos:**

Ampliar a base de dados com as variáveis ausentes listadas acima, para possibilitar análises mais granulares e recomendações ainda mais precisas para o lançamento do artista.

---

## Equipe

| Nome | Perfil |
| --- | --- |
| Alana Felix | [LinkedIn](https://www.linkedin.com/in/suzanchristoff/) |
| Suzan Christoff | [LinkedIn](https://claude.ai/chat/7a3a9d3e-fd24-4328-9737-d5324445c4f5#) |

---

*Projeto desenvolvido como parte do programa de formação em análise de dados.*
