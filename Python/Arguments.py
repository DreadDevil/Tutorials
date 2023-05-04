import sys
import os

x = len(sys.argv)

if x > 1:
    if sys.argv[1] == "/?":
        print("Help requested")
    print ("arguments entered" + str(sys.argv[1:]))
else
    print("Arguments not provided")
os.system("ps aux")
os.mkdir("dir")
sys.exit(2)