#Num input
def isEven(N):
    if N%2 == 0:
        return True
    else:
        return False

#List input (order not considered)
def sumList(L):
    N = 0.0
    for i in range(len(L)):
        N += (float(L[i]))
        
    return N

print('''SUMLIST [0,1.5,6];''',sumList([0,1.5,6]))

#String input (str --> list, ordered)
def strNumstoList(S):
    N = []
    S = S.split(",")
    for i in range(len(S)):
        N += [(S[i])]
        
  
    N = [float(x) for x in N]   
    N.sort()
    
    return N

print('''strNumstoList("6,0,1.5"));''',strNumstoList("6,0,1.5"))
print('''strNumstoList("6,0,1.5,10,20,3"));''',strNumstoList("6,0,1.5,10,20,3"))

#List input (order not considered)
def mean(L):
    return sumList(L)/(len(L))
        
print('''mean(['0','6','1.5']));''',mean(['0','6','1.5']))
print('''mean(['6','0','1.5','10','200','3']);''',mean(['6','0','1.5','10','200','3']))

#List input (sorted in function)
def rangeList(L):
    L.sort()
    First = L[0]
    Last = L[-1]
    return str(First) + " to " + str(Last)

print('''rangeList([0,1.5,6]));''',rangeList([0,1.5,6]));
print('''rangeList([10,4,1,81,9,12,80]));''',rangeList([10,4,1,81,9,12,80]))

#List input (sorted in function)
def median(L):
    M = 0
    X = (len(L) - 1)
    if isEven(len(L)) == False:
        L.sort()
        M = L[int(X/2)]
        return M
    else:
        L.sort()
        M = L[int(X/2)] + L[int(X/2) + 1]
        return M/2
    
print('''median([0,1.5,6]));''',median([0,1.5,6]))
print('''median([9,8,7,5,4,6,3,2,1,0]));''',median([9,8,7,5,4,6,3,2,1,0]))
print('''median([10,4,1,81,9,12,80,13]));''',median([10,4,1,81,9,12,80,13]))

#---

#String input --> Str output including range, median & mean of str
def summarizeList(S):
    X = strNumstoList(S)
    First = '''The numbers range from ''' + rangeList(X) + '''; '''
    Middle = '''The median is ''' + str(median(X)) + '''. '''
    Last = '''The average is ''' + str(mean(X)) + '''.'''
    
    return First + Middle + Last

print(summarizeList("6,0,1.5"))
print(summarizeList("6,0,1.5,10,200,3"))
print(summarizeList("10,4,1,81,9,12,80,13"))


   

        






