# Weather App

Aplicativo para visualizar o clima atual da sua cidade.


## Tech Stack

**Framework:**

![Logo](https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg)

**State Managment:** Bloc/Cubit


## APIs used

#### Weather API ([Open Weather Map](https://openweathermap.org))

API para consultar os dados de clima. 
Dados consultados a partir da geolocalização (Latitude e Longitude).

#### City Search API ([Geoapify](https://www.geoapify.com/))

API para pesquisar as cidades com autocomplete.


## Environment Variables

Para rodar o projeto, criar um arquivo `.env` na raiz do projeto com as variaveis listadas abaixo:

`WEATHER_API_URL`

`WEATHER_API_APP_ID`

`GEO_API_URL`

`GEO_API_KEY`


## Features

- Consulta do Clima com base na localização atual do dispositivo
- Consulta do Clima com base na busca de cidade
- Pesquisa de cidades
- Armazenamento local das cidades pesquisadas


## Documentation

Detalhes do funcionamento do App:

Ao abrir o App, a Splash será exibida e, nela será realizada a **verificação da permissão de localização do dispositivo**.

Caso o usuário tenha **permitido** o uso da localização, o App redireciona para a tela principal, faz a consulta do clima atual com os dados de localização atual do dispositivo, e exibe os dados em tela.

Caso o usuário tenha **negado** o uso da localização, o App abre a tela de Pesquisa de Cidade, onde o usuário terá que buscar sua cidade através do nome, e será gerada uma lsita (com base no nome digitado) para que ele selecione a sua cidade. Após selecionar, o App redireciona para a tela principal, faz a consulta do clima atual com os dados da cidade pesquisada, e exibe os dados em tela.

Na tela principal do App (tela que exibe os dados climáticos), o ususário tem a possibilidade de abrir a tela de pesquisa, caso queira visualizar os dados climáticos de outra cidade.

Também, a cada cidade pesquisada e com o clima consultado, é realizado o armazenamento local desta cidade. Ou seja, a cidade foi pesquisada e depois foi selecionada para consulta de clima, ela será salva localmente no dispositivo. Então, cada vez que abrir a tela de pesquisa de cidade, já serão listadas as cidades já consultadas, como um histórico de busca.


## links

- [Logo](https://www.iconfinder.com/icons/6802383/climate_cloud_cloudy_element_forecast_sunny_weather_icon)
- [Icons and Images](https://icons8.com.br/icon/set/clima/officel)
- [Icons and Images](https://www.iconfinder.com/iconsets/weather-filled-outline-6)


## Authors

- [@PatrickSLuz](https://www.github.com/patricksluz)
