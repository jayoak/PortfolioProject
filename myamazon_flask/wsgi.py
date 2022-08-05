
from src import create_app


app = create_app()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
    
"""

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World - Docker in VS Code!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
"""