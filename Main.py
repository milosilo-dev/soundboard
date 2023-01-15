import os

contense = os.listdir("assets/")
print(contense)

file = open("assets/all.txt", "w+")
for i in contense:
    if i != "all.txt":
        file.write("'" + i + "'," + "\n")
file.close()