import os
import requests

if __name__ == "__main__":
    print('getcwd:      ', os.getcwd())
    print('__file__:    ', __file__)
    tmp = os.path.dirname(__file__ + '/tmp')
