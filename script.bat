echo "Criando as imagens."

docker build -t nubiareis/projeto-backend:1.0 backend/.
docker build -t nubiareis/projeto-database:1.0 database/.

echo "Realizando o push das imagens."

docker push nubiareis/projeto-backend:1.0
docker push nubiareis/projeto-database:1.0

echo "Criando serviços no cluester kubernetes."

kubectl apply -f ./services.yml

echo "Criando os deployments."

kubectl apply -f ./deployment.yml

