#Apr 13
def boxText(text):
    L = len(text)
    return "/" + "-" * L + "\\\n" + "|" + text + "|\n" + "\\" + "-" * L + "/"

print(boxText("Sale"))
print(boxText("Welcome to Stuyvesant"))

def boxText2(text):
    L=len(text)
    a = "/" + "-" * L + "\\\n"
    b = "|" + text + "|\n"
    c = "\\" + "-" * L + "/"
    return a + b + c

print(boxText2("Sale"))

# /------------------\
# | String Indexing! |
# \------------------/

# [ ] helps bring out characters from a string.
#
#Ex:
#      012345678911
#                01
# S = "Hello there!"
# S[0] = "H"

# Strings are numbered from 0!
# Index of last character of string --> len(S) - 1

def countSentences(text):
    L = len(text)
    N = 0
    S = 0
    while N < L:
        if text[N] == "." or text[N] == "?" or text[N] == "!":
            S = S + 1
            N = N + 1
        else:
            N = N + 1
    
    return S
        
            
print(countSentences("Hello. How are you? I am good!"))
            
#Apr 14:

#3
#def emphasize(text):
 #   S = ""
 #   for i in range(len(text))

#5.
def countVowels(A):
    V = 0
    for i in range(len(A)):
        if A[i] == "a" or A[i] == "e" or A[i] == "i" or A[i] == "o" or A[i] == "u":
            V += 1
        elif A[i] == "A" or A[i] == "E" or A[i] == "I" or A[i] == "O" or A[i] == "U":
            V += 1
        else:
            A[i]
    
    return V

print(countVowels("Hello"))


#6.
def justTheVowels(A):
    V = ""
    for i in range(len(A)):
        if A[i] == "a" or A[i] == "e" or A[i] == "i" or A[i] == "o" or A[i] == "u":
            V += A[i]
        elif A[i] == "A" or A[i] == "E" or A[i] == "I" or A[i] == "O" or A[i] == "U":
            V += A[i]
        else:
            A[i]
    
    return V

print(justTheVowels("Hello"))
        
    