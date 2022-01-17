# AppMoviesBruno

Este projeto inicou-se apartir de um teste de recrutamento da empresa Mobile2You, que foi proposto alguns requisitos.

## Resumo
O Aplicativo consome dados da API do The Movie DB, onde consiste em uma tela unica que apresenta um filme escolhido com algumas informacoes (Imagem, Titulo, Likes e Popularidade) e logo abaixo uma lista de filmes similares.

## POD UTILIZADOS 
Nesse projeto foi utilizado o pod KingFisher versão 7.0.0 (https://cocoapods.org/pods/Kingfisher).
Foi utilizado esse pod  para baixar e armazenar as imagens em cache, proporcionando uma resposta mais rapida das imagens no app. 

## ARQUITETURA: VIPER
A Arquitetura adota nesse projeto foi a arquitetura VIPER, onde podemos ter uma boa separacao de responsabilidades(desacoplamento) e uma possível escalabilidade caso necessario. 

## Observações
* Requisicoes feita de forma nativa, sem utilizacao de pods externos
* Utilizado Xibs e StoryBoards
* Utilizado o efeito fade na imagem do filme Principal, utilizando o metodo scrollViewDidScroll da TableViewDelegate e alterando o alpha da UIImageView

## Features
1. Usar algum design pattern: MVP, MVVM, MVVM-C, VIPER.
R = Foi utilizado a arquitetura VIPER 

2. As informações do filme devem vir do endpoint getMovieDetails.
R= O id do filme escolhido foi 585083

3. Usar o vote_count que retorna da API para representar o número de likes .
R= OK

4. Substituir o “3 of 10 watched” por “ <popularity> views”, utilizando o valor retornado da API e
mantendo algum ícone ao lado.
R= OK

5. O ícone de like (coração) deve mudar quando clicado, alternando entre preenchido e vazio.
R = Ok

6. Deve haver uma lista de filmes abaixo dos detalhes.
R = Consumido a API com endPoint Get Similar Movies

7. O app deve ser desenvolvido utilizando a linguagem Swift.
R = Ok

8. O projeto deve ser disponibilizado em um repositório aberto no GitHub. Envie a URL assim que
possível.
R= Enviado por e-mail o url do repositorio.


