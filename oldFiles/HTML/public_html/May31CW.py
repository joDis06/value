#put hw 18 --> public_html folder

#--------------------------------
def generateNPages(n):
    #html
    index = '</br>'
    htmlpart1 = '''
<html>
    <head>
        <style>
        body {
    font-family:Verdana;
    color:black;
    background-color:#DCEAE2;
    font-size:30px;
    }
    
        h1 {
    font-family:Verdana;
    color:purple;
    font-size:40px;
    text-align:center;
    }
        
        a {
    color:blue
    }    
        
        a:hover {
    color:green;
    }
        </style>
    </head>
'''
    endhtml = '''
</body>
</html>
'''
    # end var
    loopval = 0
    pic = 0
    
    #loop
    while loopval <= n-1:
        #pages
        pagesetup = '''\n<body>\n\n<h1><u> This is page ''' + str(loopval) + '''</u></h1>'''   
        
        if loopval == n-1:
            nextpage = '''\n\nTo go to back to the first page, click here: <a href="page0.html"> Link back to page 0 </a>'''
        else:
            nextpage = '''\n\nTo go to next page, click here: <a href="page''' + str(loopval+1) + '''.html"> Link to page ''' + str(loopval+1) + '''</a>'''

        #image
        image = '''\n</br></br><img src="numbers/num''' + str(pic) + '''.jpg"></br>'''
        
        #index
        index += '''\n <a href="page''' + str(loopval) + '''.html"> Link to page ''' + str(loopval) + ''' </a></br>'''
        
        #openfile
        dataWrite = open(("hw18/page" + str(loopval) + ".html"),"w")
        dataWrite.write(htmlpart1 + pagesetup + nextpage + image)
        dataWrite.close()
        loopval += 1
        pic += 1
    
   #index insert
    dataWriteIndex = open(("hw18/index.html"),"w")
    dataWriteIndex.write(htmlpart1 + "\n<body>\n <h1><u>Index:</h1></u>\n<u>Links:</u>" + index + endhtml)
    dataWriteIndex.close()
    
    for i in range(n):
        dataReadPages = open("hw18/page" + str(i) + ".html", "r")
        pagedata = dataReadPages.read()
        dataReadPages.close()
        
        dataWriteIndexLink = open("hw18/page" + str(i) + ".html", "w")
        dataWriteIndexLink.write(pagedata + '</br><a href="index.html">Index Link</a>' +endhtml)
        dataWriteIndexLink.close()
        
print(generateNPages(4))