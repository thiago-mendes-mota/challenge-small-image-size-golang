#Imagem simples, mais enxuta
FROM golang:1.12.7-alpine3.10 as stage01

#FROM golang:1.14-alpine as stage01

RUN mkdir /app 
COPY . /app/ 
WORKDIR /app 

# gerando a build
RUN go build -o main .

# Criando imagem com apenas o estritamente necessário
FROM scratch
COPY --from=stage01 /app/main .

#Rodando programinha Desafio Full Cycle!!
ENTRYPOINT ["/main"]
