import os
import sys

pathPy = "/Users/Remco/Sites/dev/PythonProjects/"
pathQt = "/Users/Remco/Sites/dev/PyQTApps/"

projectDir = sys.argv[1]
# projectSelect = sys.argv[2]


def create():
    os.makedirs(pathQt + projectDir)


if __name__ == "__main__":
    create()
