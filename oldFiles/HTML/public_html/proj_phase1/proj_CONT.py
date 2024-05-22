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
    
    
    css = '''<!DOCTYPE html> <html>
  <head>
    <meta charset="utf-8">
    <style>     
    body {
    font-family:Verdana;
    color:black;
    background-color:#FAFCFA;
    background-image: url('img/pokebg.png');
    background-repeat: repeat;
    background-attachment: fixed;
    }
    
    table,td {
    width:5%;
    padding: 5px 3px 5px 3px;
    border: 1px black solid;
    text-align:center;
    }
    
    img {
    height:96px;
    width:96px;
    }
    
    p {
    font-family:Verdana;
    color:Black;
    border:1px black groove;
    background-color:white;
    width:800px;
    }
    
    </style>
   </head>
'''
        
    table = '''<center><table style="background-color:white; font-size:18px; width:800px" border=1px>\n  <tbody>\n'''
    
    heading = '''<h1 align="center" font-family="Verdana"> <u> Gen. 1 Pokédex </u> </h1>\n\n'''
    
    heading2 = '''\n\n<h3 align="center" font-family="Verdana">Made by Joseph Disomma ; Period 9</h3>\n\n'''
    
    paragraph = '''<center><p> Over the past year I've delved further into Pokémon; I watched
a little bit of the cartoon, I played a few games (ex: Pokémon Legends Arceus, Pokémon Emerald, ...)
and I've enjoyed it very much. The games I've played have been fun to experience, and I
never really felt like it was boring or repetitive. I love the Pokémon, moreso a few in
particular, and seeing them look more polished throughout the games is always amazing. </p></center>\n\n'''
    
    #Loop
    for aline in lines[1:]:
        part = aline.split(",")
        # num of test takers
        #testtakers += [[int(part[2])] + part]
        
        # highest score
        #highestscore += [ [ int(part[3])  +  int(part[4])  + int(part[5])]  + part]
        #print(highestscore)
         
        #Names
        row += ('  <tr>\n      <td style="width:70px;"><center><img src="img/front/' + str(img) + '.png"></center>' +
                '</td>\n      <td><center>' + part[0].title() +
                '</center></td>\n      <td>' + part[1].title() +
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
        headers += ('\n <td> </td>' +
                   '<td><b><u>' + part2[0].title() +
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
    html = css + heading + heading2 + paragraph + table + headers + '    </tr>\n' + row + '  </tbody>\n</table>\n</center>'
    
    #Data(Writing)
    dataWrite = open("proj_CONT.html","w")
    dataWrite.write(html)
    dataWrite.close()
    
    return("Done")
        
print(makeHTMLTable('pokemon.csv'))
