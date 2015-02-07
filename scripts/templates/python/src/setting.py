import os

BASE_DIR   = os.path.split(os.path.dirname(os.path.abspath(__file__)))[0]
OUTPUT_DIR = os.path.join(BASE_DIR,"output")
DATA_DIR   = os.path.join(BASE_DIR,"data")
SRC_DIR    = os.path.join(BASE_DIR,"src")
TEST_DIR   = os.path.join(BASE_DIR,"test")
CONFIG_DIR = os.path.join(BASE_DIR,"config")

DEFAULT_CONFIG_FILE = os.path.join(CONFIG_DIR,"default.cfg")
