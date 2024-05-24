FROM python:3.12-slim

# download this https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
# copy model to avoid unnecessary download
ADD https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx /root/.u2net/u2net.onnx

# Install gunicorn WSGI server
RUN pip install --no-cache-dir gunicorn

EXPOSE 5100

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY ./app .

CMD [ "gunicorn", "-w" , "4", "-b", "0.0.0.0:5100", "app:app"]