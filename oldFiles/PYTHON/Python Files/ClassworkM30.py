def max2(a,b):
    if a >= b:
        return a
    else:
        return b
        
def max3(a,b,c):      
    if a >= b and a >= c:
        return a
    else:
        if b >= a and b >= c:
            return b
        else:
            return c
        
print ("(max2(5,10)) should be 10, is",(max2(5,10)))
print ("(max2(-232,300)) should be -232, is",(max2(-232,-300)))
print ("(max2(-3,11)) should be -3, is",(max2(-3,11)))
print ("(max2(1,0)) should be 1, is",(max2(1,0)))


print ("(max3(123,134,9) should be 134, is",(max3(123,134,9)))
print ("(max3(13,13,13) should be 13, is",(max3(13,13,13)))
print ("(max3(1,0,-1)) should be 1, is",(max3(1,0,-1)))
print ("(max3(39943,-2893,100000)) should be 100000, is",(max3(39943,-2893,100000)))

def noIfmax3(a,b,c):
    while (a >= b) and (a >= c):
        return a
    while (b >= c) and (b >= a):
        return a
    while (c >= b) and (c >= a):
        return a

print (noIfmax3(100,2,3))

def newMax3(a,b,c):
    return (max2((max2(a,b)),c))

print (newMax3(10,11,12))