# PROJETO HIPÓTESES

- **FICHA TÉCNICA**
    - **OBJETIVOS**
        
        O presente projeto teve por objetivo atender às seguintes questões:
        
        1. Descobrir se existe algum padrão ou característica que faça com que uma música seja muito ouvida em plataformas como Spotify, Apple Music e Deezer.
        2. Lançar um novo artista no cenário musical global, baseada em dados do Spotify e nas seguintes hipóteses, as quais poderiam ser validadas ou refutadas:
        - Hipótese 1 - Músicas com BPM (Batidas Por Minuto) mais altos fazem mais sucesso em termos de número de streams no Spotify.
        - Hipótese 2 - As músicas mais populares no ranking do Spotify também possuem um comportamento semelhante em outras plataformas, como a Deezer.
        - Hipótese 3 -A presença de uma música em um maior número de playlists está correlacionada com um maior número de streams (transmissões)
        - Hipótese 4 -Artistas com um maior número de músicas no Spotify têm mais streams.
        - Hipótese 5 -As características da música influenciam o sucesso em termos de número de streams no Spotify.
    - **MÉTRICAS QUE PRECISAMOS**
        1. Métricas relacionadas às características musicais
        2. Número de streams e posições nos charts nas plataformas
        3. Músicas mais tocadas
        4. Número de playlists em que as músicas aparecem
        5. Número de músicas por artista
    - **EQUIPE**
        
        Trabalho realizado em dupla composta por Alana Felix e Suzan Christoff
        
    - **FERRAMENTAS, LINGUAGENS E TECNOLOGIAS**
        
        As principais linguagens, ferramentas e tecnologias utilizadas neste projeto foram:
        
        - SQL/BigQuery
        - Power BI
        - Python/Google Colab
    - **PROCESSAMENTO E ANÁLISE**
        
        Os dados estavam contidos nas  3 seguintes tabelas:
        
        1. Tabela dados de performance de cada música no Spotify 
        2. Tabela de dados referentes ao desempenho das músicas nas plataformas concorrentes: Deezer, Apple Music e Shazam
        3. Tabela dados referentes características das músicas  
        
        Para dar início a análise, procurou-se entender onde os dados estavam disponíveis, de que tipo eram e como estavam armazenados, para então, saber quais dados seriam necessários para responder às questões levantadas. Em seguida, foi dado início ao processo geral de análise que consistiu nas etapas listadas a seguir.
        
    - **1 PROCESSAMENTO E PREPARAÇÃO DA BASE DE DADOS**
        
        **1 .1  Importação dos dados:** 
        
        Através do Bigquery - serviço de armazenamento e análise de dados  do Google Cloud Platform (GCP), foi criado um projeto de trabalho e um conjunto de dados, onde as tabelas  disponibilizadas foram carregadas.
        
        **1.2  Identificação dos dados nulos:** 
        
        Na tabela **“competition” , na coluna “in*shazam*charts (**presença e classificação da música nas paradas da Shazam.**)”**  foram identificados 50 valores nulos
        
        Na tabela **“technical_info” , na coluna “key (tom musical da música)”**  foram identificados 95 valores nulos
        
        **1.3  Tratamento dos dados nulos:** 
        
        Foram desconsideradas as seguintes variáveis:
        
        - Variável “in*shazam*charts” da tabela “competition” por conter valores nulos (mais de5% dos dados)  e por não haver outra variável com dados relativos ao número de playlists da mesma plataforma(shazam), não haveria a possibilidade de fazer análise de comparação com as demais plataformas em relação à performance das músicas e o número de playlists.
        
        -Variável ”key” , que indica a tonalidade da música, da tabela “technical_info”, por conter valores nulos (quase 10% dos dados) e aos quais não saberíamos qual valor atribuir, foi desconsiderada da análise.
        
        **1.4 Identificação e tratamento dos dados duplicados:**
        
        Foram identificadas 4 nomes de músicas duplicados referentes ao mesmo nome de artista e mesmas datas de lançamento ou datas de lançamento muito próximas, como não encontramos justificativa para haver tal duplicidade, optamos por manter aquelas com dados mais relevantes, como maior número de streams e posição no charts.
        
        **1.5  Identificação e gestão dos dados fora do escopo:**
        
        Foram considerados fora do escopo: os dados contidos na Variável ”key” (por conter os valores nulos mencionados) e na variável  “mode”( pois esta é dependente daquela)
        
        **1.6 Identificação e tratamento dados discrepantes nas variáveis categóricas** 
        
        Foram tratados os dados referentes às variáveis relacionadas aos nomes das músicas e dos artistas, para que ficassem padronizados, em letras maiúsculas e sem caracteres especiais , tornando o processo posterior de pesquisa pelos nomes mais fácil.
        
        **1.7 Verificação e alteração dos tipos dos dados**
        
        Foi verificado que a variável “streams” estava no formato ‘string’ , portanto , para que cálculos posteriores pudessem ser realizados, foi alterada para o tipo ‘inteiro’. 
        
        **1.8 Identificação e tratamento dos dados discrepantes nas variáveis numéricas**
        
        Foram utilizados os comandos MAX, MIN e AVG para identificar valores discrepantes , que permitiu, identificar por exemplo, a música  de track_id “4061483” que não tinha valor correspondente de streams em valor numérico, sendo também retirada da análise.
        
        **1.9 Criação de novas variáveis**
        
        Foram criadas as variáveis “date_released”,, “total_playlists”, ”total_musics_by_artist”, variáveis relativas aos quartis das características musicais e as correspondentes classificações “baixo” e “alto”, onde foi estabelecido que o quartil 4 iria abranger os valores mais altos das características musicais e os demais os valores mais baixos.
        
        **1.10 União das tabelas** 
        
        Uma vez aplicado todo o processo de limpeza e tratamento dos dados, através das consultas SQL, criamos as “visualizações” das tabelas, com os dados já limpos e com o comando de junção “JOIN” fizemos a união das tabelas em uma única tabela denominada “dados integrados” a partir da qual passamos a trabalhar no Power BI na fase exploratória dos dados
        
         
        
    - **2 PROCESSO DE ANÁLISE EXPLORATÓRIA DOS DADOS**
        
        **2.1 Agrupamento dos dados de acordo com as variáveis categóricas**
        
        Através do Power BI, fizemos a utilização das tabelas para fazer agrupamentos diversos, o que nos permitiu visualizar, por exemplo, os posições nos charts das músicas por plataforma, a posição mediana das músicas de acordo com a década em que foram lançadas, os totais de playlists por década de lançamento e por plataforma, o número de músicas lançadas por ano, os totais de streams, o total de músicas por artista, etc.
        
        **2.2  Visualização das variáveis através de gráficos simples**
        
        Para as mesmas variáveis categóricas visualizadas nas tabelas, foram criados gráficos que tornassem a visualização dos dados ainda mais compreensível.
        
        **2.3 Cálculo medidas tendência central (média e mediana) e de dispersão**
        
        Para a obtenção de tais medidas, optamos inicialmente por utilizar as tabelas do Power BI, onde calculamos a média e mediana das variáveis “total_playlists” e “streams”, e posteriormente usamos o comando *.describe( )* da biblioteca Pandas do Python no Google Colab onde pudemos analisar, além da média e mediana, outras medidas estatísticas como intervalo interquartil e desvio padrão de todas as demais variáveis.
        
        **2.4 Visualização das distribuições dos dados**
        
        Para que de maneira mais ágil pudéssemos visualizar a distribuição dos dados das diversas variáveis, através dos histogramas, optamos também pela utilização dos comandos disponíveis *nas* bibliotecas Pandas e Matplotlib do Python no Google Colab onde pudemos gerar e analisar os gráficos desejados.
        
        **2.6 Visualização dos dados ao longo do tempo**
        
        Optou-se aqui pelo uso do gráfico de linha do tempo do Power BI onde pudemos ver o número de músicas lançadas ao longo do período
        
        **2.7 Cálculo dos quartis e quintis**
        
        Para que pudéssemos identificar se havia diferença nos valores médios de streams, por exemplo, para músicas com BPM mais alto ou mais baixo, fizemos o cálculo dos quartis, onde o quartil 4 abrangeria o grupo dos valores mais altos e os demais quartis representariam o grupo dos valores mais baixos. Esse cálculo aplicamos a todas às características musicais para que pudéssemos identificar ou não similaridade nos grupos em relação ao número médio de streams.
        
        **2.8 Cálculo correlações**
        
        O cálculo de correlação se fez necessário para que pudéssemos saber se validaríamos ou não a hipótese de que as características músicais têm influência no sucesso das músicas em termos de números de streams. Para tal cálculo, utilizamos consulta SQL apropriada.
        
    - **3 APLICAÇÃO DA TÉCNICA DE ANÁLISE**
        
        As técnicas de análise consistiram em:
        
        - Segmentar cada característica musical em 2 grupos, um representando os valores mais altos (4º quartil) e o outro representando os valores mais baixos(1º, 2º e 3º quartil). Tendo feito isso, utilizamos as tabelas no Power BI para agrupar os dados nessas duas categorias e calcular a média de streams de cada uma.
        - Validar a hipótese: para a validação ou refutação das hipóteses, fizemos a análise dos resultados obtidos nos cálculos das correlações em conjunto com os gráficos de dispersão .
    - **RESUMO ATRAVÉS DE DASHBOARD**
        
        As informações obtidas através da análise, foram apresentadas por meio de dashboard criado através do POWER BI, onde foi possível visualizar de forma geral:
        
        - Os totais de streams, playlists, músicas e artistas.
        - Os top 5 artistas e as top 10 músicas.
        - Linha do tempo com os totais de músicas lançadas ao longo do período.
        - Totais de playlists por plataforma.
        - Número de músicas de acordo com o número de artistas que as compuseram.
        - Os valores médios das características musicais.
        - Filtros para que se pudesse visualizar as varáveis acima por nome de artista, por música, e por década de lançamento.
        - E ainda, filtro para que se pudesse selecionar as músicas de acordo com suas posições nos charts e o nível de streams obtido, se máximo, alto, médio, baixo ou mínimo.
    - **TÉCNICAS DE ANÁLISES APLICADAS**
        
        Para que o resultados desejados fossem obtidos, optamos por utilizar a **Técnica de Segmentação ,** aplicada às características musicais através dos cálculos dos quartis e a **Técnica de Validação de Hipóteses** através dos cálculos de correlações e gráficos de dispersão.
        
    - **RESULTADOS,  CONCLUSÕES E RECOMENDAÇÕES**
        
        Após uma longa análise de nosso banco de dados e considerando as hipóteses levantadas pela gravadora sobre o que faz uma faixa de música ter sucesso, chegamos as seguintes conclusões:
        
        - Em relação à hipótese sobre o BPM das músicas e seu impacto no número de streams no Spotify, não encontramos uma correlação significativa entre esses dois fatores. Portanto, concluímos que o BPM não pode ser considerado um fator determinante para o sucesso de uma música em termos de streams.
        - Ao comparar o desempenho das músicas nos rankings das plataformas Apple Music, Deezer e Spotify, observamos uma correlação positiva e significativa entre as classificações das músicas nessas plataformas. Isso sugere que as músicas que são populares em uma plataforma tendem a ter um desempenho semelhante nos rankings das outras plataformas, indicando uma consistência no gosto do público.
        - Identificamos uma forte correlação entre o número de playlists em que uma música está presente e o número de streams no Spotify. Isso indica que a presença da música em um maior número de playlists está diretamente relacionada a um maior número de streams.
        - Refutamos a hipótese de que o número de músicas de um artista no Spotify está correlacionado ao número total de streams. Não encontramos evidências significativas para apoiar essa associação.
        - Em relação às características da música, como dançabilidade, valência, energia, etc., não encontramos uma correlação significativa com o número de streams no Spotify. Isso sugere que outros fatores podem ser mais relevantes para determinar o sucesso de uma música em termos de streams.
        
        Com base nessas conclusões, recomendamos à gravadora que se concentre em garantir a presença de suas músicas em playlists populares, promova suas músicas em diferentes plataformas de streaming e crie músicas de alta qualidade que ressoem com o público-alvo. Dessa forma, acreditamos que essas  estratégias podem maximizar o alcance e o impacto do novo artista lançado pela gravadora.
        
        Recomendamos, ainda, que a gravadora explore oportunidades de marketing digital e estratégias de promoção do artista em plataformas de mídias sociais como Instagram, TikTok e Youtube. Também, que pense na possibiilidade  de explorar colaborações estratégicas com artistas já estabelecidos (que são da gravadora) e;ou em ascensão na indústria musical,  pois verificamos, por exemplo, que artistas como Beyoncé, Ed Sheeran, Cardi B e Justin Bieber, alcançaram sucesso significativo após colaborações estratégicas, portanto, acreditamos que os "feats" podem proporcionar excelentes oportunidades para o nosso artista.
        
    - **LIMITAÇÕES E PRÓXIMOS PASSOS**
        
        Durante a realização do projeto identificamos as seguintes limitações :
        
        - A ausência de dados que nos permitissem identificar, por exemplo, se houve ações promocionais, que possam ter contribuído para o aumento do interesse nas músicas. Poderíamos saber assim, quais ações podem ser mais eficazes no lançamento do nosso artista.
        - Dados com a identificação dos gêneros das músicas, que dos permitiram conhecer quais gêneros são mais populares, além de sabermos quais as tendências no mercado musical, se há gêneros em ascendência ou em declínio.
        - Falta de dados referentes à faixa etária dos usuários, que nos permitiria visualizar a distribuição das idades  e assim entender melhor o perfil de consumo musical desses usuários, o que ajudaria na adaptação da estratégia de marketing, além de aperfeiçoar a escolha do repertório e estilo da produção musical do nosso artista.
        - Dados referentes ao desempenho das músicas por regiões geográficas , permitiriam saber , por exemplo, se há uma região que responde mais positivamente, podendo assim, haver um melhor direcionamento das promoções, melhor planejamento das turnês e outros eventos, colaborações com artistas locais e também adaptações musicais. E ainda,  identificar tendências e mudanças nas preferências musicais em diferentes partes do mundo, o que pode contribuir para a tomada de futura decisões, mantendo nosso artista relevante e competitivo em escala global.
        
        Com base nos levantamentos acima, propomos estender o projeto, para que possamos ter ainda mais e melhores insights que contribuam para o sucesso do lançamento do nosso artista.

  
