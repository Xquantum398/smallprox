# Usa l'immagine base di Python
FROM python:3.12-slim

# Installa git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Imposta la directory di lavoro
WORKDIR /app

# Clona il repository
RUN git clone https://github.com/Xquantum398/smallprox.git .

# Copia i file necessari
COPY requirements.txt .
COPY app.py .

# Installa le dipendenze
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Espone la porta 7860
EXPOSE 7860

# Comando per avviare il server Flask
CMD ["python", "app.py"]
