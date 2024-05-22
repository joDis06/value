#HW 8

#1.
a = '''I "ate" the "so-called" "snacks"'''
b = '''"can't won't didn't'''
c = '''all's well that
          ends on a new line"'''

print("========")
print(a)
print("========")
print(b)
print("========")
print(c)
print("========")

#2
def extractSlice(someStr,start,stop):
    N = ""
    for i in range(start,stop):
        N += someStr[i]
    
    return N

def rotate(text,n):
    if n > (len(text)):
        n -= (len(text))
        return extractSlice(text,n,(len(text))) + extractSlice(text,0,n)
    else:
        return extractSlice(text,n,(len(text))) + extractSlice(text,0,n)

print(rotate("ABCD",  1))
print(rotate("oreos", 3))
print(rotate("ABCD",  6))

#3