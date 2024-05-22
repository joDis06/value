#sumAtoB
def sumAtoB(a,b):
    i = 0
for a in range(a,b+1):
    i=a+i

return i

#Test Cases
print("sumAtoB(1,4) should be 10,is:",sumAtoB(1,4))
print("sumAtoB(3,7) should be 25,is:",sumAtoB(3,7))
print("sumAtoB(-1,5) should be 14,is:",sumAtoB(-1,5))

#sumAuptoB
def sumAuptoB(a,b):
    i = 0
for a in range(a,b):
    i=i+a

return i

#Test Cases
print("sumAuptoB(1,4) should be 6,is:",sumAuptoB(1,4))
print("sumAuptoB(3,10) should be 42,is:",sumAuptoB(3,10))
print("sumAuptoB(-5,1) should be -15,is:",sumAuptoB(-5,1))

#sumFiveFromAuptoB
def sumFiveFromAuptoB(a,b):
    i = 0
for a in range(a,b,5):
    i = i+a

return i

#Test Cases
print("sumFiveFromAuptoB(10,20) should be
25,is:",sumFiveFromAuptoB(10,20))
print("sumFiveFromAuptoB(-5,15) should be
10,is:",sumFiveFromAuptoB(-5,15))
print("sumFiveFromAuptoB(0,100) should be
950,is:",sumFiveFromAuptoB(0,100))

#evaluateCubic(x)
def evaluateCubic(x):
i = x*(x-2)*(x+2)

return i

#Test Cases
print("evaluateCubic(3) should be 15, is:",evaluateCubic(3))
print("evaluateCubic(7) should be 315,
is:",evaluateCubic(7))
print("evaluateCubic(-4) should be -48,
is:",evaluateCubic(-4))

#findMaxCubicAuptoB
def findMaxCubicAuptoB(a,b):
f=0
for a in range(a,b,1):
f = f+1

return evaluateCubic(f)

#Test Cases
print("findMaxCubicAuptoB(1,5)) should be 48,
is:",findMaxCubicAuptoB(1,5))
print("findMaxCubicAuptoB(-1,7)) should be 480,
is:",findMaxCubicAuptoB(-1,7))
print("findMaxCubicAuptoB(-11,10)) should be 9177,
is:",findMaxCubicAuptoB(-11,10))

#fizzbuzz
def fizzbuzz(n):
for i in range(1,n,1):
if (i% 3 == 0) and (i%5 == 0):
print("fizzbuzz")
else:
if (i% 3 == 0):
print("fizz")
else:
if (i% 5 == 0):
print("buzz")
else:
print(i)

#Test Cases
print("fizzbuzz(16)) should be
1-2-fizz-4-buzz-fizz-7-8-fizz-buzz-11-fizz-13-14-fizzbuzz,
is:")
print(fizzbuzz(16))
print("fizzbuzz(31)) should be
1-2-fizz-4-buzz-fizz-7-8-fizz-buzz-11-fizz-13-14-fizzbuzz-16
-17-fizz-19-buzz-fizz-22-23-fizz-buzz-26-fizz-28-29-fizzbuzz
, is:")
print(fizzbuzz(31))