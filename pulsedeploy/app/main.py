# app/main.py
from fastapi import FastAPI
from datetime import datetime

app = FastAPI()  # <- This is mandatory, uvicorn looks for "app"

@app.get("/")
def read_root():
    return {
        "message": "Automate all the things!",
        "timestamp": int(datetime.utcnow().timestamp())
    }

@app.get("/health")
def health():
    return {"status": "healthy"}
