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

#----------------------------

L = [3,7,[[5]]]
print (L[0])

print (L[2][0])

L[0] += 1

print(L)

Q = L
Q[2][0] = "hello"

print(Q)
print(L)

def add1Mutate(L):
    for x in (len(L)):
         += 1
    
print(add1Mutate([10,11,12]))