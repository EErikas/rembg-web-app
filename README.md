# Background Remover Web App

A simple flask app to remove the background of an image with [Rembg](https://github.com/danielgatis/rembg)

Based on the [tutorial](https://youtu.be/cw34KMPSt4k) on YouTube

## Running the app
There are several ways to run this application. No matter which of the options chosen from below. No matter which running option you have selected. The application will be accessibile via the browser on http://loclhost:5100

### Using Image from Container Repository
You can also pull the prebuilt images from GitHub container repository. This is the recommended method, as you can easily integrate this container in your workflows (i.e., if you want to use it with other container in a `docker compose` script).
1. Pull the latest version of the container:
    ```bash
    docker pull ghcr.io/eerikas/rembg-web-app:latest
    ```
2. Run the Docker container:
    ```bash
    docker run -p 5100:5100 ghcr.io/eerikas/rembg-web-app:latest
    ```

### From Source Code using Docker
Alternatively you can use Docker to run the application from source code. For this method to work you need to have `Docker` installed.
In the examples below the container is going to be named `rembg-web`. Feel free to to chose the different name in your deployment.
1. Clone the repository
2. Build the Docker image:
    ```bash
    docker build -t rembg-web .
    ```
3. Run the created Docker container:
    ```bash
    docker run -p 5100:5100 rembg-web
    ```
### From Source Code using Python
You can run the application using your local `python` installation. To run the app perform the following steps:
1. Clone the repository
2. (Optional) Set up virtual environment.
    ```bash
    python -m venv env
    source env/bin/activate
    ```
3. Install requirements
    ```bash
    pip install -r requirements.txt
    ```
4. Run the application
    ```bash 
    python app/app.py
    ```
    You will need to wait until you see the following message in the console:
    ```
     * Serving Flask app 'app'
     * Debug mode: off
    WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
     * Running on all addresses (0.0.0.0)
     * Running on http://127.0.0.1:5100
    ```
**NOTE:** If you are using this method, you will also need to download the `u2net.onnx` model for background removal to work. This will be done automatically when uploading image for the first time. The model will be saved in `<your-user-directory>/.u2net/u2net.onnx`
