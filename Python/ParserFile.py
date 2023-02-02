inputfile = "/home/file"
outputfile = "/home/out"

lookfor = "test"

myfile1 = open(inputfile, mode='r', encoding='utf-8')
myfile2 = open(outputfile, mode='w', encoding='utf-8')

for num, line in enumrate(myfile1, 1):
    if lookfor in line;
    print("Line N" + str(num) + line.strip())
    myfile2.write("Found password" + line)

myfile1.close()
myfile2.close()
