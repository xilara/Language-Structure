# Xiana Lara
# 11/2/2020
# The given data has been through a "backup" program which added extraneous data.
# Corrupt data ALWAYS starts with a CONTROL-C and always ends in a CONTROL-B
# This PYTHON program removes these values
# Input: Corrupt Data - control-char.txt
# Output: Clean Data - python-control-char.txt


def main():
    
    flag = False

    fixedFile = open("python-control-char.txt", "a")
    ogFile = open("control-char.txt", "r+")

    oneChar = ogFile.read(1)
    while (oneChar):

        if (ord(oneChar) == 3):
            flag = True

        if (flag == False):
            fixedFile.write(oneChar)

        if (ord(oneChar) == 2):
            flag = False

        oneChar = ogFile.read(1)

    fixedFile.close()

main()