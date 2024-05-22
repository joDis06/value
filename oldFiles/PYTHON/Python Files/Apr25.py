def rCRC(text):
    N = ""
    for i in range(len(text)):
        if not(i+1 >= len(text)):
            print ("Passed 1st if, i =",i)
            if text[i] == text[i+1]:
                print ("Passed 2nd if, i =",i)
                N += text[i]
            if not(i+2 > len(text)):
                i += 2
            
    
    return N

print (rCRC("heello"))
        