#2001 X
#2020 L
#1900 X
#2000 L

def isEven(n):
    if n% 2 > 0:
        return False
    else:
        return True

def isLeap(y):
    if (not (isEven(y))):
        return False
    else:
        if (y% 10 == 0) and (y% 400 == 0):
            return True 
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
    