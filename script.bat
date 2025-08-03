echo "Criando as imagens......."

docker build -t lvcasaa/projeto-backend:1.0 backend/.
docker build -t lvcasaa/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push lvcasaa/projeto-backend:1.0
docker push lvcasaa/projeto-database:1.0

echo "Criando serviços no cluster kubermetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments....."

kubectl apply -f ./deployment.yml
