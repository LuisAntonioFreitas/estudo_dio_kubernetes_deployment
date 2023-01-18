#!/bin/bash

echo "Criando as imagens..."

docker build -t luisantoniofreitas/estudo-dio-denilsonbonatti-projeto-backend:1.0 backend/.

docker build -t luisantoniofreitas/estudo-dio-denilsonbonatti-projeto-database:1.0 database/.

docker build -t luisantoniofreitas/estudo-dio-denilsonbonatti-projeto-frontend:1.0 frontend/.

echo "Realizando o push das imagens..."

docker push luisantoniofreitas/estudo-dio-denilsonbonatti-projeto-backend:1.0

docker push luisantoniofreitas/estudo-dio-denilsonbonatti-projeto-database:1.0

docker push luisantoniofreitas/estudo-dio-denilsonbonatti-projeto-frontend:1.0

echo "Criando os servicos no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments no cluster kubernetes..."

kubectl apply -f ./deployment.yml
