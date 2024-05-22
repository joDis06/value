myNums = [1,2,4,7]

print(myNums[::-1])

print("a,b,c,d".split(","))

print(float(["1","2","3.5"][0]))

N = [5, 3, 14, 1]
N1 = N.sort()

print(N)

bigger = 42

print("The bigger number is " + str(bigger))

#-----------------

def summarizeList(numberString):
    mean = 0
    median = 0
    R = 0
    N = []
    for x in ((numberString.split(","))):
        N += x
        
    return N
        


print(summarizeList("6,0,1.5"))
