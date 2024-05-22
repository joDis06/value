#Determines if n is even
def isEven(n):
    if n% 2 > 0:
        return False
    else:
        return True

#Determines if year, y, is a leap year
def isLeap(y):
    if (not (isEven(y))):
        return False
    else:
        if (y% 100 == 0):
            if (y% 400 == 0):
                return True
            else:
                return False
        else:
            if (y% 4 == 0):
                return True
            else:
                return False
            
            
 #Test Cases           
print("isLeap(2001)should be False,is:",isLeap(2001))
print("isLeap(2000)should be True,is:",isLeap(2000))
print("isLeap(2020)should be True,is:",isLeap(2020))
print("isLeap(1900)should be False,is:",isLeap(1900))

#Adds values raised to power of 2 b/w & including low & high
def sum_squares(low,high):
    s = 0
    i = low
    while i <= high:
        s = s + i**2
        
        i = i + 1
    return s

 #Test Cases 
print("sum_squares(2,3)should be 13,is:",sum_squares(2,3))
print("sum_squares(2,3)should be 60,is:",sum_squares(-4, 4))
print("sum_squares(2,3)should be 140,is:",sum_squares(1, 7))
print("sum_squares(2,3)should be 380,is:",sum_squares(3,10))

#Adds values raised to 'power' b/w and including low & high
def sum_powers(low,high,power):
    s = 0
    i = low
    while i <= high:
        s = s + i**(power)
        
        i = i + 1
    return s
        
 #Test Cases 
print("sum_powers(2,3,2)should be 13,is:",sum_powers(2,3,2))
print("sum_powers(2,4,2)should be 19,is:",sum_powers(2,4,2))
print("sum_powers(1,7,3)should be 784,is:",sum_powers(1,7,3))
print("sum_powers(3,9,4)should be 15316,is:",sum_powers(3,9,4))

#Finds least common multiple of a & b
def lcm(a,b):
    if a > b:
        c = a
    else:
        c = b
    
    while(True):
        if ((c% a == 0) and (c% b == 0)):
            d = c
            break
        c = c + 1
    
    return d

 #Test Cases 
print("lcm(12,8)should be 24,is:",lcm(12,8))
print("lcm(5,2))should be 10,is:",lcm(5,2))
print("lcm(12,14)should be 84,is:",lcm(12,14))
print("lcm(30,25)should be 150, is:",lcm(30,25))