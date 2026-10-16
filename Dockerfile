# Imagem oficial com suporte nativo a Intel (amd64) e ARM (arm64)
FROM python:3.11-slim

# Define a pasta de trabalho dentro do container
WORKDIR /app

# Copia primeiro apenas o arquivo de dependências (otimiza o cache do Docker)
COPY requirements.txt .

# Instala as bibliotecas de terceiros sem guardar lixo de cache
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY app.py .

# Documenta que o container escuta na porta 8080
EXPOSE 8080

# Comando que mantém o container vivo rodando o servidor
CMD ["python", "app.py"]