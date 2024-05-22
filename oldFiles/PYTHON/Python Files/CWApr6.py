#Class Work
def overlap(n,times):
    i = 0
    while times > 0:
        i = (i + n*(10**times))
        
        times = times - 1
        
    return (i/10)

#print (overlap(3,4))
#print (overlap(111,5))

#Reviewed in class
def sumDigit(n):
    s=0
    while n>0:
        
        s = s + (n% 10)
        
        n = n//10
    
    return s

#print(sumDigit(12345))

#-----------------------------------------------

def perfNum(n):
    i = 0
    for i in range(i,n):
        return i

    
