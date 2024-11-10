#!/bin/bash

echo "Iniciando o provisionamento do servidor web..."

# Atualizar o servidor
echo "Atualizando o servidor..."
apt-get update
apt-get upgrade -y

# Instalar o Apache2
echo "Instalando o Apache2..."
apt-get install apache2 -y

# Instalar o unzip
echo "Instalando o unzip..."
apt-get install unzip -y

# Baixar a aplicação
echo "Baixando a aplicação..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# Descompactar o arquivo
echo "Descompactando arquivo..."
unzip main.zip

# Copiar os arquivos para o diretório do Apache
echo "Copiando arquivos para o diretório do Apache..."
cp -R /tmp/linux-site-dio-main/* /var/www/html/

# Limpar arquivos temporários
echo "Limpando arquivos temporários..."
rm -rf /tmp/main.zip /tmp/linux-site-dio-main

# Reiniciar o Apache
echo "Reiniciando o serviço do Apache..."
systemctl restart apache2

echo "Provisionamento concluído com sucesso!"
