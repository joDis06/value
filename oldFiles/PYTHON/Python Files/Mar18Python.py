def addOne(x):
    return x+1

# print(addOne(5))

def determinate(a, b, c):
    return (b**2 - 4*a*c)**1/2

def quadFormPR(a, b, c):
    return (-b + determinate(a,b,c)) / 2*a

def quadFormNR(a, b, c):
    return (-b - determinate(a,b,c)) / 2*a
        
print(quadFormPR(1, -4, 3))
print(quadFormNR(1, -4, 3))

print(quadFormPR(1, 0, -1))
print(quadFormNR(1, 0, -1))

def lastDigit(x):
    return (x) %10

print(lastDigit(13))