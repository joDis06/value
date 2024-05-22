#1 Table
def makeHTMLTable(file):
    #Data(Reading)
    try:
        dataRead = open(file,'r')
    except:
        print("Unable")
    
    lines = dataRead.read().strip().split('\n')
    dataRead.close()
    
    
    
    #Var
    part = []
    img = 1
    row = ''
    headers = '    <tr>'
    
    
    css = '''<html>
  <head>
    <style>     
    body {
    font-family:Verdana;
    color:black;
    background-color:#DCEAE2;
    }
    
    img {
    height:48px;
    width: 48px;
    }
    
    p {
    font-family:Verdana;
    color:Blue;
    border:1px black solid;
    background-color:White;
    width:700px;
    }
    
    </style>
   </head>
'''
        
    table = '''<center><table style="background-color:white; font-size:12px; width:600px" border=1px>\n  <tbody>\n'''
    heading = '''<h1 align="center" size=7 font-family="Verdana"> <u> Pokemon </u> </h1>\n\n'''
    
    #Loop
    for aline in lines[1:]:
        part = aline.split(",")
        # num of test takers
        #testtakers += [[int(part[2])] + part]
        
        # highest score
        #highestscore += [ [ int(part[3])  +  int(part[4])  + int(part[5])]  + part]
        #print(highestscore)
         
        #Names
        row += ('  <tr>\n      <td> <img src="img/front/' + str(img) + '.png">' +
                '</td>\n      <td>' + part[0].title() +
                '</td>\n      <td>' + part[1].title() +
                '</td>\n      <td>' + part[2].capitalize() +
                '</td>\n      <td>' + part[3].capitalize() +
                #'</td>\n      <td>' + part[4].capitalize() +
                #'</td>\n      <td>' + part[5].capitalize() +
                '</td>\n    </tr>\n')
        
        img += 1
    
    #Loop (headers)
    for aline2 in [lines[0]]:
        part2 = aline2.split(",")
        #print(part2)
        headers += ('\n      <td><b><u>' + part2[0].title() +
                   '</u></b></td>\n      <td><b><u>' + part2[1].title() +
                   '</u></b></td>\n      <td><b><u>' + part2[2].title() +
                   '</u></b></td>\n      <td><b><u>' + part2[3].title() +
                   #'</u></b></td>\n      <td><b><u>' + part2[4].title() +
                   #'</u></b></td>\n      <td><b><u>' + part2[5].title() +
                   '</u></b></td>\n')
    
    #test takers
    #testtakers.sort(reverse=True)
    #mostTT += ' '.join([testtakers[0][2].title(), 'has the most test takers of', str(testtakers[0][0])])
    #print(testtakers)
    
    #highest score
    #highestscore.sort(reverse=True)
    #print(highestscore)
    #HS += ' '.join([highestscore[0][2].title(), 'has the highest score of', str(highestscore[0][0])])
    
    #averages
    #averages += ' '.join(['''The averages for Stuyvesant were''', str(highestscore[0][4]), 'for critical reading,', str(highestscore[0][5]), 'for math, and', str(highestscore[0][6]), 'for writing']) 
    
    #ordered list
    #oList += ("<li>" + mostTT + ".</li>") + "\n" + ("<li>" + HS + ".</li>") + ("<li>" + averages + ".</li>") + "\n</ol>"
    
    #combining 
    html = css + heading + table + headers + '    </tr>\n' + row + '  </tbody>\n</table>\n</center>'
    
    #Data(Writing)
    dataWrite = open("pokemonattempt1.html","w")
    dataWrite.write(html)
    dataWrite.close()
    
    return("Done")
        
print(makeHTMLTable('pokemon.csv'))