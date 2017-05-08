import os, sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from colp import app
import settings

if __name__ == "__main__":
	app.run()
