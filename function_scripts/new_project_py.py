import os
import sys


pathPy = "/Users/Remco/Sites/dev/Python_projects/"

projectDir = sys.argv[1]
# projectSelect = sys.argv[2]


def create():
    os.makedirs(pathPy + projectDir)


if __name__ == "__main__":
    create()
