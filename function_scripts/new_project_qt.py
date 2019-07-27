import os
import sys

pathQt = "/Users/Remco/Sites/dev/PyQT_projects/"

projectDir = sys.argv[1]
# projectSelect = sys.argv[2]


def create():
    os.makedirs(pathQt + projectDir)


if __name__ == "__main__":
    create()
