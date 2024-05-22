def findLetter(A,B):
    for i in range(len(A)):
        if A[i] == B:
            return i
        
def lastfirst(fullname):
    N1 = ""
    N2 = ""
    for i in range((findLetter(fullname," "))):
        N1 += fullname[i]
    for i in range((findLetter(fullname," "))+1,(len(fullname))):
        N2 += fullname[i]

    return N2 + " " + N1

print(lastfirst("Grace Hopper"))

print(findLetter("Grace Hopper"," "))

def extractSlice(someStr,start,stop):
    N = ""
    for i in range(start,stop):
        N += someStr[i]
    
    return N

print(extractSlice("Hello",0,3))
print(extractSlice("Hello",3,5))

def echoFront(string,n):
    N = ""
    for i in range(n,0,-1):
        N += extractSlice(string,0,i)
        
    return N

print(echoFront("Chocolate",4))

def lastFirstBETTER(fullname):
    first = extractSlice(fullname,0,(findLetter(fullname, " ")))
    last = extractSlice(fullname,(findLetter(fullname, " "))+1, (len(fullname)))
    
    return last + " " + first

print (lastFirstBETTER("Grace Hopper"))

#HW
def echoBack(string,n):
    N = ""
    for i in range(n,(len(string)),1):
        N += extractSlice(string,0,i)
    
    return N

print (echoBack("BuhBoing",5))

