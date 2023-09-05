__author__ = "Janssen Lima"
__email__ = "janssenreislima@gmail.com"
__status__ = "dev"

import logging
from flask import Flask


app = Flask(__name__)

log = logging.getLogger('werkzeug')
log.setLevel(logging.ERROR)


@app.route("/")
def index():
    app.logger.info('Olá, mundo')
    return "Olá, mundo!"

if __name__ == "__main__":
    app.run(debug=True, port=5000,host="0.0.0.0")