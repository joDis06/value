def MinMaxList(filename):
    f = open(filename,'r')
    s = f.readline()
    
    
    
    while s != '':
        word = s.strip()   # remove the trailing "\n" character
        if word.isdigit():  # make sure it's an integer
            print(0)
        s = f.readline()











print(MinMaxList('randomNums.txt'))