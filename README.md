## :whale: Go + Docker 



Este projeto é uma demonstração de como criar uma imagem Docker extremamente leve (menor que 2 MB) para um programa simples em Go que imprime "Full Cycle Rocks!!" no console. 

Aproveitando as capacidades de compilação estática do Go e técnicas de otimização, o projeto mostra como criar uma imagem Docker minimalista, ideal para aplicações em ambientes de recursos limitados.

## Estrutura do Projeto

- **main.go**: Código-fonte do programa em Go. O programa apenas imprime "Full Cycle Rocks!!" ao ser executado.
- **Dockerfile**: Arquivo de configuração Docker com um **multi-stage build** que compila e otimiza o binário Go para rodar na imagem `scratch`, uma imagem base vazia, garantindo o menor tamanho possível.

## Tecnologias Utilizadas

- **Go**: Linguagem de programação utilizada para o desenvolvimento do programa.
- **Docker**: Utilizado para criar uma imagem containerizada ultra-leve do programa.

## Como Funciona

O Dockerfile está estruturado em duas etapas:

1. **Compilação do Binário**: Utiliza a imagem `golang:alpine` para compilar o código em um binário estático e otimizado para Linux.
2. **Imagem Final**: Copia o binário para uma imagem `scratch`, que é minimalista e sem sistema operacional, reduzindo o tamanho ao mínimo necessário.


## Imagem Docker Hub

Abaixo segue o link da imagem docker:
https://hub.docker.com/r/madrugou/fullcycle/tags

## Como Executar

1. Baixar a imagem:

```bash 
docker pull madrugou/fullcycle:latest
```

2. Para construir e executar a imagem Docker:

```bash
docker build -t hello-fullcycle-go .
```

3. Execute o container:

```bas
docker run --rm hello-fullcycle-go
```

3. A saída deverá ser:

```bash
Full Cycle Rocks!!
```

## Otimizações Realizadas

- **Flags de Compilação**: Foram usadas flags como `-ldflags="-s -w"` para remover informações de depuração, reduzindo o tamanho do binário.
- **Compactação do Binário** (opcional): Utilizou-se `upx` para compactar ainda mais o binário, reduzindo o tamanho sem comprometer a funcionalidade.

## Benefícios

- **Desempenho e Eficiência**: Esta imagem ultra-leve é adequada para ambientes onde o espaço e o desempenho são críticos, como em microservices e sistemas embarcados.
- **Portabilidade**: A imagem containerizada permite fácil implementação em diversos ambientes sem dependências adicionais.

## Contribuição

Sinta-se à vontade para contribuir com melhorias, sugestões e otimizações adicionais para reduzir ainda mais o tamanho da imagem ou aprimorar o projeto.
