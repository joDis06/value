#sumAtoB
def sumAtoB(a,b):
    i = 0
    for a in range(a,b+1):
        i=a+i
    
    return i
        
        

print(sumAtoB(1,4))

#sumAuptoB
def sumAuptoB(a,b):
    i = 0
    for a in range(a,b):
        i=i+a
    
    return i

print(sumAuptoB(1,4))

#sumFiveFromAuptoB
def sumFiveFromAuptoB(a,b):
    i = 0
    for a in range(a,b,5):
        i = i+a
    
    return i

print(sumFiveFromAuptoB(10,20))

#evaluateCubic(x)
def evaluateCubic(x):
    i = x*(x-2)*(x+2)
    
    if i == 0:
        return 0
    else:
        i/((x-2)*(x+2))

print(evaluateCubic(3))
    

def overlap(n,times):
    i = 0
    while times > 0:
        i = (i + n*(10**times))
        
        times = times - 1
        
    return (i/10)

print (overlap(3,4))
print (overlap(111,5))