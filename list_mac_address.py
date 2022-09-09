def main():
    data_structure = []
    fd = open("test.txt")
    for i in range(74):
        data_structure.append(fd.readline().replace(":",""))
    while True:
        data = input("MAC: ")
        for i in range(74):
            if (data_structure[i].find(data) >= 0):
                print(i + 1)

main()
