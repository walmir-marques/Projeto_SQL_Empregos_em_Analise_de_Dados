# Introdução

📊 Mergulhe no mercado de trabalho de dados! Focando em cargos de ciêntista de dados, este projeto explora 💰 os empregos mais bem remunerados, 🔥 as habilidades mais requisitadas e 📈 onde a alta demanda encontra altos salários na ciência de dados.

🔍 Consultas SQL? Confira aqui: [pasta project_sql](/project_sql/)

# Contexto

Movido pela busca de navegar no mercado de trabalho de ciêntista de dados de forma mais eficaz, este projeto nasceu do desejo de identificar as habilidades mais bem pagas e requisitadas, facilitando o trabalho de outros para encontrar empregos ideais.

Os dados são provenientes de um curso de SQL, no qual foi levantada as informações através de pesquisas feitas com profissionais na área de dados do mundo inteiro. [SQL Course](https://lukebarousse.com/sql). Eles estão repletos de insights sobre cargos, salários, localizações e habilidades essenciais.

### As perguntas que eu queria responder com minhas consultas SQL foram:

1. Quais são os empregos de ciêntista de dados mais bem pagos?
2. Quais habilidades são exigidas para esses empregos mais bem pagos?
3. Quais habilidades são mais requisitadas para ciêntistas de dados?
4. Quais habilidades estão associadas a salários mais altos?
5. Quais são as habilidades mais vantajosas para aprender?

# Ferramentas que Usei

Para meu mergulho profundo no mercado de trabalho de ciêntista de dados, utilizei o poder de várias ferramentas-chave:

- **SQL:** A base da minha análise, permitindo consultas no banco de dados e a descoberta de insights críticos.
- **PostgreSQL:** O sistema de gerenciamento de banco de dados escolhido, ideal para lidar com os dados de anúncios de empregos.
- **Visual Studio Code:** Meu editor preferido para gerenciar bancos de dados e executar consultas SQL.
- **Git & GitHub:** Essenciais para controle de versão e compartilhamento dos meus scripts SQL e análises, garantindo colaboração e rastreamento do projeto.

# A Análise

Cada consulta deste projeto teve como objetivo investigar aspectos específicos do mercado de trabalho de ciêntista de dados. Veja como abordei cada questão:

### 1. Empregos de Ciêntista de Dados Mais Bem Pagos

Para identificar os cargos mais bem remunerados, filtrei as posições de ciêntista de dados pelo salário médio anual e localização, com foco em empregos remotos. Esta consulta destaca as oportunidades de alta remuneração na área.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title = 'Data Scientist' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

Aqui está o resumo dos principais empregos de ciêntista de dados em 2023:

- **Ampla Variedade Salarial:** Os cargos mais bem pagos variam de $185.000 a $375.000 anuais, mostrando o grande potencial salarial na área de ciência de dados.
- **Empregadores Diversificados:** Empresas como Algo Capital Group, Smith Hanley Associates e Grammarly estão entre as que oferecem altos salários, evidenciando o interesse de diferentes setores pela contratação de ciêntista de dados.
- **Variedade de Títulos de Cargos:** A lista apresenta uma variedade de títulos de cargos, todos focados em Data Scientist, mas com diferentes faixas salariais, refletindo diferentes exigências e especializações dentro da ciência de dados.

![Maiores Cargos Pagantes](assets/chart-1)
_Gráfico de barras para visualiazar os 10 maiores salarios para os cargos de ciêntista de dados; ChatGPT gerou este gráfico a partir dos resultados da minha consulta SQL_

### 2. Habilidades para os Trabalhos com Melhores Salários

Para entender quais habilidades são necessárias para os trabalhos com melhores salários, eu combinei as publicações de vagas com os dados de habilidades, oferecendo insights sobre o que os empregadores valorizam em cargos de alta remuneração.

```sql
WITH top_paying_jobs AS (
  SELECT
      job_id,
      job_title,
      salary_year_avg,
      job_posted_date,
      company_dim.name as company_name
  FROM
      job_postings_fact
  LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
  WHERE
      job_title = 'Data Scientist' AND
      job_location = 'Anywhere' AND
      salary_year_avg IS NOT NULL
  ORDER BY 
      salary_year_avg DESC
  LIMIT 10
)

SELECT 
  top_paying_jobs.*,
  skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
  salary_year_avg DESC
```

A seguir está a divisão das habilidades mais demandadas para os 10 cargos de ciêntista de dados com os melhores salários em 2023:

- **Python** lidera as demandas, aparecendo em 10 ocorrências.
- **AWS**, **R**, **Spark**, e **Tableau** são habilidades com 3 ocorrências cada, mostrando uma demanda consistente nessas áreas.
- **Scala**, **MongoDB**, **Hadoop**, **Cassandra**, e **Java** aparecem em 2 ocorrências cada, representando habilidades ainda bastante relevantes.
  Outras habilidades, como **Airflow**, **JavaScript**, **HTML**, **VBA**, **PHP**, **TensorFlow**, **Scikit-learn**, **Excel**, **PowerPoint**, **Snowflake**, **Sheets**, e **Databricks**, apresentam 1 ocorrência cada, indicando uma demanda mais específica ou nichada.


![Skills maiores remuneradas](assets/chart-2)
_Gráfico de barras de contagem das skills mais demandadas para os 10 cargos com maiores salários de Ciêntista de Dados. Esse gráfico foi gerado usando matplotlib_

### 3. Habilidades em Alta para ciêntista de Dados.

Esta consulta ajudou a identificar as habilidades mais frequentemente solicitadas nas vagas de emprego, direcionando o foco para áreas com alta demanda.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' 
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

Aqui está a divisão das habilidades mais demandadas para ciêntista de dados em 2023.

- **Python** e **SQL** continuam sendo fundamentais, destacando a necessidade de habilidades sólidas em programação e consulta de bancos de dados.
- Ferramentas de Visualização, como **Tableau**, são essenciais, refletindo a crescente importância de habilidades técnicas na apresentação e interpretação de dados.
- **R** também se destaca, apontando para a demanda por habilidades avançadas em análise estatística e modelagem de dados.
- **AWS** emerge como uma habilidade relevante, sublinhando a crescente necessidade de profissionais com experiência em ambientes de computação em nuvem.

| Skills   | Demand Count |
| -------- | ------------ |
| Python   | 10390        |
| SQL      | 7488         |
| R        | 4674         |
| AWS      | 2593         |
| Tableau  | 2458         |

_Tabela de demanda das 5 habilidades requeridas para empregos em Ciência de Dados._

### 4. Habilidades baseadas no salário. 

Explorar os salários médios associados a diferentes habilidades revelou quais são as habilidades mais bem remuneradas.

```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```

Aqui está a divisão dos resultados das habilidades mais bem remuneradas para Ciêntista de Dados:



- **Habilidades Altamente Remuneradas em Tecnologias de Nicho:** Os salários mais altos são comandados por ciêntistas com habilidades em tecnologias de nicho como **Neo4j**, **Airtable** e **Watson**, demonstrando a alta demanda do mercado por especialistas em ferramentas avançadas de gerenciamento de dados e inteligência artificial, com foco em tecnologias de banco de dados e plataformas de aprendizado de máquina.
- **Desenvolvimento de Software e Linguagens de Programação:** O domínio de linguagens de programação como **Lua**, **Clojure** e **Objective-C** reflete o valor atribuído a habilidades versáteis de desenvolvimento de software. Essas linguagens são frequentemente usadas para programação de sistemas e aplicações especializadas, com grande potencial de ganhos para ciêntistas que dominam essas áreas.
- ****Tecnologias Emergentes e Ferramentas de Automação:**** Habilidades em tecnologias emergentes como **RShiny** e **Solidity** destacam a crescente importância da automação, aplicações em nuvem e tecnologias de blockchain na análise de dados. Essas ferramentas impulsionam a demanda por ciêntistas capazes de construir soluções escaláveis e inovadoras em ambientes tecnológicos dinâmicos.
- **Ferramentas de Comunicação e Colaboração:** A inclusão de plataformas como **Zoom** reflete a mudança do setor para ambientes de trabalho remotos e híbridos, onde ferramentas fortes de colaboração são essenciais. ciêntistas com expertise em ferramentas que suportam comunicação virtual e colaboração em equipe estão bem posicionados para oportunidades bem remuneradas na força de trabalho digital de hoje.



| Skills        | Average Salary ($) |
| ------------- | -----------------: |
| neo4j         |           215616,25|
| airtable      |           215500,00|
| watson        |           214250,00|
| rshiny        |           205357,14|
| zoom          |           190000,00|
| solidity      |           175000,00|
| lua           |           170500,00|
| clojure       |           170500,00|
| objective-c   |           164500,00|
| node          |           157500,00|

_Tabela com a média salarial para as 10 habilidades bem mais pagas para cargos em Ciência de Dados._

### 5. Melhores habilidades para se aprender

Combinando insights dos dados de demanda e salários, essa análise teve como objetivo identificar as habilidades que são tanto altamente demandadas quanto bem remuneradas, oferecendo um foco estratégico para o desenvolvimento de habilidades.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

| Skill        | Demand Count | Average Salary |
|--------------|--------------|----------------|
| C            | 48           | 164,865        |
| Go           | 57           | 164,691        |
| Qlik         | 15           | 164,485        |
| Looker       | 57           | 158,715        |
| Airflow      | 23           | 157,414        |
| BigQuery     | 36           | 157,142        |
| Scala        | 56           | 156,702        |
| GCP          | 59           | 155,811        |
| Snowflake    | 72           | 152,687        |
| Pytorch      | 115          | 152,603        |

_Tabela das melhores habilidades para ciêntista de dados ordenadas por salário_

Aqui está a divisão das habilidades mais ótimas para ciêntistas de dados em 2023:

- **Linguagens de Programação de Alta Demanda:** **C** e **Go** são as linguagens mais requisitadas, com contagens de demanda de 48 e 57, respectivamente. Ambas possuem salários médios elevados, com Go alcançando $164,691 e C $164,865. Isso destaca a alta valorização dessas linguagens, que são essenciais para o desenvolvimento de sistemas e software de alto desempenho.
- **Ferramentas de Visualização e Business Intelligence:** **Qlik** e **Looker** são bastante demandadas, com salários médios de $164,485 e $158,715, respectivamente. Ambas as ferramentas são essenciais para a criação de dashboards e insights estratégicos a partir de grandes volumes de dados, refletindo a crescente importância das ferramentas de BI na análise de dados empresariais.
- **Tecnologias de Processamento de Dados e Cloud:** **Airflow**, **BigQuery** e **GCP** são altamente requisitados, com salários médios variando de $157,142 para BigQuery a $157,414 para **Airflow** e $155,811 para **GCP**. Esses números refletem a demanda crescente por ferramentas de orquestração de dados, análise em larga escala e soluções de cloud computing, essenciais para empresas que lidam com grandes volumes de dados.
- **Plataformas de Big Data e Machine Learning:** **Scala** e **Pytorch** se destacam com a demanda crescente em áreas de big data e machine learning, com salários médios de $156,702 para **Scala** e $152,603 para **Pytorch**. Esses dados apontam para a crescente valorização de habilidades em linguagens e frameworks usados para processamento de dados complexos e desenvolvimento de modelos preditivos.
- **Armazenamento e Análise de Dados em Nuvem:** **Snowflake** é a plataforma de análise em nuvem mais demandada, com um salário médio de $152,687, refletindo o aumento na necessidade de ferramentas que integrem armazenamento e análise de dados em tempo real, especialmente em ambientes de big data.

# O que eu aprendi

Ao longo dessa jornada, turbinei meu conjunto de ferramentas SQL com um poder de fogo considerável:

- **🧩 Criação de Consultas Complexas:** Dominei a arte do SQL avançado, combinando tabelas como um profissional e utilizando cláusulas WITH para manobras de tabelas temporárias em nível ninja.
- **📊 Agregação de Dados:** Me tornei íntimo do GROUP BY e transformei funções agregadas como COUNT() e AVG() em meus aliados para resumir dados.
- **💡 Magia Analítica:** Aprimorei minhas habilidades de resolução de problemas no mundo real, transformando perguntas em consultas SQL acionáveis e perspicazes.

# Conclusões

### Insights

From the analysis, several general insights emerged:

1. **Empregos com maiores salários em ciência de dados**:  As vagas mais bem remuneradas para ciêntista de dados que oferecem trabalho remoto apresentam uma ampla variedade de salários, sendo o mais alto de $375.000!
2. **Habilidades para os empregos com maiores salários**: Vagas de ciêntista de dados bem remuneradas exigem proficiência avançada em Python, sugerindo que essa é uma habilidade crucial para alcançar um salário elevado.
3. **Habilidades mais Demandadas**: Python também é a habilidade mais requisitada no mercado de trabalho para ciêntista de dados, tornando-a essencial para os candidatos a vagas.
4. **Habilidades com Salários Mais Altos:** Habilidades especializadas, como **neo4j** e **airtable**, estão associadas aos salários médios mais altos, indicando um valor elevado para a expertise em nichos específicos.
5. **Melhores Habilidades para se aprender.**: C lidera em demanda e oferece um alto salário médio, posicionando-se como uma das habilidades mais ótimas para ciêntista de dados aprenderem a fim de maximizar seu valor no mercado.

### Considerações Finais

Este projeto aprimorou minhas habilidades em SQL e forneceu insights valiosos sobre o mercado de trabalho para ciêntista de dados. Os resultados da análise servem como um guia para priorizar o desenvolvimento de habilidades e os esforços na busca por emprego. Ciêntistas de dados em potencial podem se posicionar melhor em um mercado de trabalho competitivo ao focar nas habilidades de alta demanda e alto salário. Esta exploração destaca a importância do aprendizado contínuo e da adaptação às tendências emergentes no campo da ciência de dados.
