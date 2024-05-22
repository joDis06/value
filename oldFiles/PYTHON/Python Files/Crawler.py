testhtml="""
<!doctype html>
<head>
    <meta charset="utf-8">
    <title>HTML Parsing: A Primer</title>
    <style> body {background-color: beige; } </style>
</head>
<body>
<h1>Some Content!</h1>
<ul>
<li>You can use python to automatically process webpages.</li>
<li>This is <a id="link" href="http://wikipedia.org">Wikipedia</a></li>
<li><a id="link" href="http://wikipedia.org/wiki/Opossum">All about possums</a></li>
<li><p>Here's a possum:</p>
<img width=200 src="http://homer.stuy.edu/~jvorob/images/possum.jpg">
</li>
</ul>
</body>
</html>
"""

def extractHTMLTags(html):
    N = ""
    S = 0
    E = 0
    for i in range(len(html)):
        S = html.find("<",i)
        E = html.find(">",i)
        
      #  print(S,E)
        if S == -1:
            break
        
        if N != html[S:E+1]:
            N = html[S:E+1]
            print (N)
        
    return '!Done ExTags!'
    
print(extractHTMLTags(testhtml))

def extractText(html):
    N = ""
    S = 0
    E = 0
    for i in range(len(html)):
        S = html.find(">",i)
        E = html.find("<",i)
        
        if S == -1:
            break
        
        if N != html[S+1:E]:
            N = html[S+1:E]
            if N.isspace() == False:
                print (N.strip())
 
    
    return '!Done ExText!'

print(extractText(testhtml))

def getAllLinks(html):
    N = ""
    S = 0
    E = 0
    for i in range(len(html)):
        S = html.find("href=",i)
        E = html.find(">",i)

        
        if S == -1:
            break
        
        if N != html[S+6:E-1]:
            N = html[S+6:E-1]
            if N.isspace() == False:
                print (N)
    
    return '!Done getAllLinks!'

print(getAllLinks(testhtml))

def Helper(html):
    N = html[(html.find("href")):(html.find("</a>"))]
    print (N[(N.find(">"))+1:(len(N))])
    
    return '!Done Helper!'
    
print(Helper(testhtml))

def getNames(html):
    N = ""
    X = ""
    D = ""
    S = 0
    E = 0
    for i in range(len(html)):
        S = html.find("<a",i)
        E = html.find("</a>",i)
        
        if S == -1:
            break
        
        if N != html[S:E+4]:
            N = html[S:E+4]
           # if N.isspace() == False:
             #   print (N)
            
        if X != N[(N.find(">"))+1:(N.find("</a>"))]:
            X = N[(N.find(">"))+1:(N.find("</a>"))]
          #  if X.isspace() == False:
             #   print (X)
        
        if D != X + " " + N:
            D = X + " " + N
            print(D)
            
    
    return '!Done Getnames!'

print(getNames(testhtml))
            

                   

        