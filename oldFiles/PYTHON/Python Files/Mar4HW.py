#1 Shift One
def shiftOne(text):
    N = ""
    for i in range(len(text)):
        if ((ord(text[i])) >= ord('A') and (ord(text[i])) < ord('Z')) or ((ord(text[i])) >= ord('a') and (ord(text[i])) < ord('z')):
            N += chr((ord(text[i])) + 1)
        else:
            N += chr((ord(text[i])) - 25)
        
    return N

print(shiftOne("BZDRZQ"))

#2 Shift N
def shiftN(text,n):
    N = ""
    for i in range(len(text)):
        shiftOrd = ( (ord(text[i])) + n)
        if  (shiftOrd >= ord('A') and  shiftOrd < ord('Z')) or (shiftOrd >= ord('a') and shiftOrd < ord('z')):
            N += chr(shiftOrd)
        else:
            N += chr(shiftOrd - 26)
            
    return N

print(shiftN("BZDRZQ",2))


#Challenge Problem 
def parseIntegerString(text):
    X = 0
    for i in range(len(text)):
        X += ( ord(text[i]) - 48) * (10**(((len(text))-1)-i))
    
    return X
        
print(parseIntegerString("123"))
print(parseIntegerString("12345"))
print(parseIntegerString("12345678910111213"))