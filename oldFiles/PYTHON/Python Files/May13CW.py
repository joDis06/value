def mySum(L):
    N = 0
    for i in range(len(L)):
        N += L[i]
    
    return N

print(mySum([1,2,3]))

def myRange(n):
    N = []
    i = 0
    for i in range(i,n):
        N += [i]
        
    
    return N

print(myRange(3))
print(myRange(-1))