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
        S = html.index("<") + 1
        E = html.index(">") 
        
        N += html[S:E]
        
    print (N)
    
    

print(extractHTMLTags(testhtml))
        
