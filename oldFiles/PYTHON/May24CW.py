def fileread(F):
    x = ""
    f = open(F,"r")
    contents = f.read()
    contents = contents.split("\n")

    for i in range(len(contents)):
        
        x += contents[-i-1] + "\n"
        
    n = open("new.txt", "w")
    n.write(x)
    n.close()
    return x
    
    

print(fileread("reverse_me.txt"))