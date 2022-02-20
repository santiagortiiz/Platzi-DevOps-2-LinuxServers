# WSL Ubuntu sudo pass: think_in_cash

# Creamos un grupo
sudo groupadd docker
# Añadimos nuestro usuario al grupo
sudo usermod -aG docker name_user

# Reiniciar la terminal para activar los comandos del grupo
newgrp docker

# Verificar si todo funciona
docker run hello-world
