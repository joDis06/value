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
    gradientsetup = ''' style="background-image: linear-gradient'''
    
    
    css = '''<!DOCTYPE html> <html lang="en">
  <head>
    <meta charset="UTF-8">
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
    
    a {
    color:blue
    }
    
    img.pokemon {
    height:96px;
    width:96px;
    }
    
    .mainTable {
    width:800px;
    margin-left:350px;
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
        
    table = ''' <div class="mainTable"><table style="background-color:white; font-size:18px;" border=1px>\n  <tbody>\n'''
    
    heading = '''<h1 align="center" font-family="Verdana"> <u> Gen. 1 Pok&eacutedex </u> </h1>\n\n'''
    
    heading2 = '''\n\n<h3 align="center" font-family="Verdana">Made by Joseph Disomma ; Period 9</h3>\n\n'''
    
    linkfav = '<a href="favorites.html"> Special Mentions </a>'
    
    paragraph = '''<center><p> Over the past year I've delved further into Pok&eacutemon; I watched
a little bit of the cartoon, I played a few games (ex: Pok&eacutemon Legends Arceus, Pok&eacutemon Emerald, ...)
and I've enjoyed it very much. The games I've played have been fun to experience, and I
never really felt like it was boring or repetitive. I love the Pok&eacutemon, moreso a few in
particular, and seeing them look more polished throughout the games is always amazing.<br>''' + linkfav + '''</p></center>\n\n'''
    
    #Loop
    for aline in lines[1:]:
        part = aline.split(",")
        # num of test takers
        #testtakers += [[int(part[2])] + part]
        
        # highest score
        #highestscore += [ [ int(part[3])  +  int(part[4])  + int(part[5])]  + part]
        #print(highestscore)
        
        #types:
        if part[2].capitalize() =='Normal':
            typecolor = '''#ADAC7C, #ADAC7C'''
        elif part[2].capitalize() =='Fire':
            typecolor = '''#F6822F, #F6822F'''
        elif part[2].capitalize() =='Water':
            typecolor = '''#6095FD, #6095FD'''
        elif part[2].capitalize() =='Grass':
            typecolor = '''#74CD4B, #74CD4B'''
        elif part[2].capitalize() =='Electric':
            typecolor = '''#F7D325, #F7D325'''
        elif part[2].capitalize() =='Ice':
            typecolor = '''#95DFE0, #95DFE0'''
        elif part[2].capitalize() =='Fighting':
            typecolor = '''#CC272E, #CC272E'''
        elif part[2].capitalize() =='Poison':
            typecolor = '''#A63AA0, #A63AA0'''
        elif part[2].capitalize() =='Ground':
            typecolor = '''#DFC459, #DFC459'''
        elif part[2].capitalize() =='Flying':
            typecolor = '''#A38EE9, #A38EE9'''
        elif part[2].capitalize() =='Psychic':
            typecolor = '''#FE5282, #FE5282'''
        elif part[2].capitalize() =='Bug':
            typecolor = '''#A9BF05, #A9BF05'''
        elif part[2].capitalize() =='Rock':
            typecolor = '''#BCA12C, #BCA12C'''
        elif part[2].capitalize() =='Ghost':
            typecolor = '''#634F94, #634F94'''
        elif part[2].capitalize() =='Dragon':
            typecolor = '''#6725FF, #6725FF'''
        elif part[2].capitalize() =='Steel':
            typecolor = '''#B9B7CC, #B9B7CC'''
        elif part[2].capitalize() =='Fairy':
            typecolor = '''#FFB2C5, #FFB2C5'''
        else:
            typecolor = '''white, white'''
            
        #secondary types:
        if part[3].capitalize() =='Normal':
            typecolor2 = '''#ADAC7C, #ADAC7C'''
        elif part[3].capitalize() =='Fire':
            typecolor2 = '''#F6822F, #F6822F'''
        elif part[3].capitalize() =='Water':
            typecolor2 = '''#6095FD, #6095FD'''
        elif part[3].capitalize() =='Grass':
            typecolor2 = '''#74CD4B, #74CD4B'''
        elif part[3].capitalize() =='Electric':
            typecolor2 = '''#F7D325, #F7D325'''
        elif part[3].capitalize() =='Ice':
            typecolor2 = '''#95DFE0, #95DFE0'''
        elif part[3].capitalize() =='Fighting':
            typecolor2 = '''#CC272E, #CC272E'''
        elif part[3].capitalize() =='Poison':
            typecolor2 = '''#A63AA0, #A63AA0'''
        elif part[3].capitalize() =='Ground':
            typecolor2 = '''#DFC459, #DFC459'''
        elif part[3].capitalize() =='Flying':
            typecolor2 = '''#A38EE9, #A38EE9'''
        elif part[3].capitalize() =='Psychic':
            typecolor2 = '''#FE5282, #FE5282'''
        elif part[3].capitalize() =='Bug':
            typecolor2 = '''#A9BF05, #A9BF05'''
        elif part[3].capitalize() =='Rock':
            typecolor2 = '''#BCA12C, #BCA12C'''
        elif part[3].capitalize() =='Ghost':
            typecolor2 = '''#634F94, #634F94'''
        elif part[3].capitalize() =='Dragon':
            typecolor2 = '''#6725FF, #6725FF'''
        elif part[3].capitalize() =='Steel':
            typecolor2 = '''#B9B7CC, #B9B7CC'''
        elif part[3].capitalize() =='Fairy':
            typecolor2 = '''#FFB2C5, #FFB2C5'''
        else:
            typecolor2 = '''white, white'''
        
         
        if part[3].capitalize() == '':
            type2place = '''N/A'''
        else:
            type2place = part[3].capitalize()
            
        if part[11].capitalize() == '':
            evolvefromplace = '''N/A'''
        else:
            evolvefromplace = part[11].capitalize()
            
        picHoverfront = '''onmouseover="this.src='img/back/''' + str(img) + '''.png'"'''
        picHoverback = '''onmouseout="this.src='img/front/''' + str(img) + '''.png'"'''
        picture = 'src="img/front/' + str(img) + '.png"'
        #Names
        row += ('  <tr>\n      <td style="width:70px;"><center><img class="pokemon"' + picture + picHoverfront + picHoverback + '></center>' +
                '</td>\n      <td><center>' + part[0].title() +
                '</center></td>\n      <td><a href="pokemonwebs/' + str(int(part[0].title())) + 'sumpage.html">' + part[1].title() + '</a>' +
                '</td>\n      <td' + gradientsetup + '(to bottom right,' + typecolor + '")>' + part[2].capitalize() +
                '</td>\n      <td' + gradientsetup + '(to bottom right,' + typecolor2 + '")>' + type2place +
                '</td>\n      <td ' + gradientsetup + '(to bottom right,#F5EECE,white)">' + part[4].capitalize() +
                '</td>\n      <td' + gradientsetup + '(to bottom right,#FFEFEF,white)">' + part[5].capitalize() +
                '</td>\n      <td' + gradientsetup + '(to bottom right,#FFF9EF,white)">' + part[6].capitalize() +
                '</td>\n      <td' + gradientsetup + '(to bottom right,#FFFEEF,white)">' + part[7].title() +
                '</td>\n      <td' + gradientsetup + '(to bottom right,#EEF4FF,white)">' + part[8].title() +
                '</td>\n      <td' + gradientsetup + '(to bottom right,#F4FFEF,white)">' + part[9].title() +
                '</td>\n      <td' + gradientsetup + '(to bottom right,#FFEEF6,white)">' + part[10].title() +
                '</td>\n      <td>' + evolvefromplace +
                '</td>\n      <td>' + part[12].capitalize() +
                '</td>\n      <td' + gradientsetup + '(to bottom right,#F8EDFF,white)">' + part[13].capitalize() +
                '</td>\n    </tr>\n')
        
        img += 1
    
    #Loop (headers)
    for aline2 in [lines[0]]:
        part2 = aline2.split(",")
        #print(part2)
        headers += ('\n <td' + gradientsetup + '(to bottom right,#DFDFDF , white)"> </td>' +
                   '<td' + gradientsetup + '(to bottom right,#DFDFDF , white)"><b><u>' + part2[0].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#DFDFDF , white)"><b><u>' + part2[1].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#DFDFDF , white)"><b><u>' + part2[2].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#DFDFDF , white)"><b><u>' + part2[3].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#FDE799,#EFE1AC")><b><u>' + part2[4].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#F78585 ,#FFBDBD)"><b><u>' + part2[5].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#F7A75B ,#F3BC89)"><b><u>' + part2[6].title() +
                   '</u></b></td>\n     <td' + gradientsetup + '(to bottom right,#F6DA74  ,#FFECAF)"><b><u>' + part2[7].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#79A1FD ,#A1BDFE)"><b><u>' + part2[8].title() +
                   '</u></b></td>\n     <td' + gradientsetup + '(to bottom right,#7ADE77 ,#8CE489)"><b><u>' + part2[9].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#F568A8 ,#F692BF)"><b><u>' + part2[10].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#DFDFDF , white)"><b><u>' + part2[11].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#DFDFDF , white)"><b><u>' + part2[12].title() +
                   '</u></b></td>\n      <td' + gradientsetup + '(to bottom right,#DAB8F1 ,#E0C9EF)"><b><u>' + part2[13].title() +
                   '</u></b></td>\n')
    
    #combining 
    html = css + heading + heading2 + paragraph + table + headers + '    </tr>\n' + row + '  </tbody>\n</table></div>\n></body></html>'
    
    #Data(Writing)
    dataWrite = open("proj_CONT.html","w")
    dataWrite.write(html)
    dataWrite.close()
    
    return("Done")
        
print(makeHTMLTable('pokemon.csv'))

def pokeWebStats(part):
    #Var
    
    table = '''<table class="stats" style="font-family:'Pokemon';border-top:1px DarkRed groove;">\n  <tbody>\n<tr><td style="color:black ;width:40px; border-right:1px black solid">'''
    tableTOPBORDER = '''<table class="stats" style="font-family:'Pokemon';border-top:2px DarkRed groove; ">\n  <tbody>\n<tr><td style="color:black ;width:40px; border-right:1px black solid"">'''
    tableBOTBORDER = '''<table class="stats" style="font-family:'Pokemon';border-top:1px DarkRed groove;border-bottom:2px DarkRed groove ;">\n  <tbody>\n<tr><td style="color:black ;width:40px;border-right:1px black solid" ">'''
    tblEnd = '''</tr></tbody></table>\n\n'''
        
    hpWidth = part[5].capitalize()
    atWidth = part[6].capitalize()
    deWidth = part[7].capitalize()
    saWidth = part[8].capitalize()
    sdWidth = part[9].capitalize()
    spWidth = part[10].capitalize()
        
    hpRow = tableTOPBORDER + '''&nbsp&nbsp&nbspHP&nbsp&nbsp&nbsp&nbsp</td> <td style="background-image: linear-gradient(to right, red, red);width:''' + str(int(hpWidth) + 400) + '''px;""> ''' + hpWidth + '''</td> <td style="border-left:1px black solid;width:''' + str(300-(int(hpWidth))) + '''px"> </td> ''' + tblEnd
    atRow = table + '''&nbspAttack&nbsp</td> <td style="background-image: linear-gradient(to right, orange, orange); width:''' + str(int(atWidth) + 400)+ '''px;"> ''' + atWidth +'''</td> <td style="border-left:1px black solid;width:''' + str(300-(int(atWidth))) + '''px"> </td> ''' + tblEnd
    deRow = table + '''Defense </td> <td style="background-image: linear-gradient(to right, yellow, yellow); width:''' + str(int(deWidth) + 400) + '''px;">  ''' + deWidth +'''</td><td style="border-left:1px black solid;width:''' + str(300-(int(deWidth))) + '''px"> </td> ''' + tblEnd
    saRow = table + '''&nbspSp.Atk&nbsp</td> <td style="background-image: linear-gradient(to right, blue, blue); width:''' + str(int(saWidth) + 400)+ '''px;"> ''' + saWidth + ''' </td><td style="border-left:1px black solid;width:''' + str(300-(int(saWidth))) + '''px;"> </td> ''' + tblEnd 
    sdRow = table + '''&nbspSp.Def&nbsp </td> <td style="background-image: linear-gradient(to right, green, green); width:''' + str(int(sdWidth) + 400)+ '''px;">  ''' + sdWidth +'''</td><td style="border-left:1px black solid;width:''' + str(300-(int(sdWidth))) + '''px;"> </td> ''' + tblEnd
    spRow = tableBOTBORDER + '''&nbspSpeed&nbsp&nbsp </td> <td style="background-image: linear-gradient(to right, pink, pink); width:''' + str(int(spWidth) + 400) +'''px;"> ''' +  spWidth + ''' </td><td style="border-left:1px black solid;width:''' + str(300-(int(spWidth))) + '''px;"> </td> ''' + tblEnd
        
    stats = hpRow + atRow + deRow + saRow + sdRow + spRow 
    
    return(stats)


def pokeWebs(file):
    try:
        dataRead = open(file,'r')
    except:
        print("Unable")
    
    lines = dataRead.read().strip().split('\n')
    dataRead.close()
    
    #Var
    part = []
    img = 1
    PNTable = ''
    
    for aline in lines[1:]:
        #html
        htmlhead = '''<!DOCTYPE html> <html>
<meta charset="utf-8">
<head>
 <style>
 
  @font-face {
    font-family: 'Pokemon';
    src: url(Pokemon.ttf);
    }
 
 
  body {
    font-family:Pokemon;
    color:black;
    background-color:#FAFCFA;
    background-image: url('../img/pokewebBG.png');
    background-repeat: no-repeat;
    background-attachment: fixed;
    position: fixed;
    }
    
    table,td {
    width:5%;
    padding: 5px 3px 5px 3px;
    text-align:center;
    }
    
    table.stats {
    padding: 1px 3px 1px 3px;
    text-align:center;
    margin-top:0px;    
    font-family:'Pokemon';
    border-right:2px DarkRed groove;
    border-left:2px DarkRed groove; width:700px;
    height:10px; 
    margin-left:50px;
    font-size:26px;
    font-family:Verdana;
    background-image: linear-gradient(to bottom right, #F6F1E7  , #F6F1E7);
    background-color:white;
    
    
    }
    
    a {
    color:blue
    }
    
    h1 {
    font-size:60px;
    text-decoration:underline;
    margin-top: -20px;
    margin-left:80px;
    }
    
    h2 {
    font-size:45px;
    text-align:right;
    margin-right:195px;
    margin-top:-517px;
    color:white;
    font-family:'Pokemon';
    text-shadow: 5px 0 black; 5px 0 black;
    }
    
    img.pokemon {
    height:384px;
    width:384px;
    margin-right:10px;
    margin-top:-10px;
    }
    
    p.desc {
    font-family:'Pokemon';
    font-size:30px;
    color:White;
    width:400px;
    margin-left:1415px;
    margin-top:20px;
    }
    
    .PNTable {
    padding: 0px 1px 1px 1px;
    width:291px;
    max-width:300px;
    height:136px;
    border:1px black solid;
    font-size: 12px;
    
    background-color:white;

    margin-left:790px;
    
    }
    
    .tinyPrev {
    height:96px;
    width:96x;
    image-rendering:pixelated;
    margin-top:-96px;
    
    }
    
    div.types {
    width:600px;
    height:100px;
    margin-left:100px;
    margin-top:20px;
    }
    
    table.types {
    background-image: linear-gradient(to bottom right, #FCFBF1  , #FCFBF1);
    border: 1px black solid;
    padding: 1px 1px 1px 1px;
    width:600px;
    font-size:24px;
    text-alignment:center;
    }
    
    img.typeimg {
    height:80px;
    width:150px;
    }
    
    
            </style>
          </head>
          <body>
          '''
        
        part = aline.split(",")
        
        type1 = part[2].capitalize()
        type2 = part[3].capitalize()
        
        if type2 == '':
            type2 = 'N/A'
        
        #types:
        if type1 =='Normal':
            typecolor = '''#ADAC7C'''
        elif type1 =='Fire':
            typecolor = '''#F6822F'''
        elif type1 =='Water':
            typecolor = '''#6095FD'''
        elif type1 =='Grass':
            typecolor = '''#74CD4B'''
        elif type1 =='Electric':
            typecolor = '''#F7D325'''
        elif type1 =='Ice':
            typecolor = '''#95DFE0'''
        elif type1 =='Fighting':
            typecolor = '''#CC272E'''
        elif type1 =='Poison':
            typecolor = '''#A63AA0'''
        elif type1 =='Ground':
            typecolor = '''#DFC459'''
        elif type1 =='Flying':
            typecolor = '''#A38EE9'''
        elif type1 =='Psychic':
            typecolor = '''#FE5282'''
        elif type1 =='Bug':
            typecolor = '''#A9BF05'''
        elif type1 =='Rock':
            typecolor = '''#BCA12C'''
        elif type1 =='Ghost':
            typecolor = '''#634F94'''
        elif type1 =='Dragon':
            typecolor = '''#6725FF'''
        elif type1 =='Steel':
            typecolor = '''#B9B7CC'''
        elif type1 =='Fairy':
            typecolor = '''#FFB2C5'''
        else:
            typecolor = '''white'''
        
            
        #secondary types:
        if type2 =='Normal':
            typecolor2 = '''#ADAC7C'''
        elif type2 =='Fire':
            typecolor2 = '''#F6822F'''
        elif type2 =='Water':
            typecolor2 = '''#6095FD'''
        elif type2 =='Grass':
            typecolor2 = '''#74CD4B'''
        elif type2 =='Electric':
            typecolor2 = '''#F7D325'''
        elif type2 =='Ice':
            typecolor2 = '''#95DFE0'''
        elif type2 =='Fighting':
            typecolor2 = '''#CC272E'''
        elif type2 =='Poison':
            typecolor2 = '''#A63AA0'''
        elif type2 =='Ground':
            typecolor2 = '''#DFC459'''
        elif type2 =='Flying':
            typecolor2 = '''#A38EE9'''
        elif type2 =='Psychic':
            typecolor2 = '''#FE5282'''
        elif type2 =='Bug':
            typecolor2 = '''#A9BF05'''
        elif type2 =='Rock':
            typecolor2 = '''#BCA12C'''
        elif type2 =='Ghost':
            typecolor2 = '''#634F94'''
        elif type2 =='Dragon':
            typecolor2 = '''#6725FF'''
        elif type2 =='Steel':
            typecolor2 = '''#B9B7CC'''
        elif type2 =='Fairy':
            typecolor2 = '''#FFB2C5'''
        else:
            typecolor2 = '''Black'''
        
        
        typestable = '''
        <div class="types">
        <table class="types">
        <tbody>
        <tr>
        <td style="border: 1px black solid" colspan="2"> <h3> <u> Types </u> </h3> </td>
        </tr>
        
        <tr>
        <td style="border: 1px black solid;color:''' + typecolor + '''"> ''' + type1 + '''</td>
        <td style="border: 1px black solid;color:''' + typecolor2 + '''"> ''' + type2 + '''</td>
        </tr>
        </tbody>
        </table>
        </div>
        '''
        
        numpoke = part[0].capitalize()
        print(numpoke)
        
        pokename = part[1].capitalize()
        print(pokename)
        
        description = ('<p class="desc">' + part[14] + '</p>').replace(";",",").split(".")
        description = description[0] + '.' + description[1] + '.'
        
        if int(numpoke) < 10:
            zeros = '00'
        elif int(numpoke) >= 100:
            zeros = ''
        else:
            zeros = '0'
            
        if int(numpoke) == 151:
            PNTable = '''

<div class="PNTable">
<table>
 <tbody>
   <tr>
    <div class="tinyPrev"> <td style=" border:1px black solid"> </div>
     <a href="''' + str(int(numpoke)-1) + '''sumpage.html"> <img src="../img/front/''' + str(int(numpoke) - 1) + '''.png" > <br> <font color="blue">''' + str(int(numpoke)-1) + ''' - Prev </font></a> </td>
    
    <td style="border:1px black solid"> <a href="../proj_CONT.html"> Return Home </a> </td>

    <div class="tinyPrev"> <td style=" border:1px black solid"> </div>
     <a href="''' + str(int(numpoke)) + '''sumpage.html"> <img src="../img/front/''' + str(int(numpoke)) + '''.png">  <br> <font color="blue"> Last - ''' + str(int(numpoke)) + ''' </font></a> </td>
    
   </tr>
  </tbody>
</table>
</div>

'''
        elif int(numpoke) == 1:
            PNTable = '''

<div class="PNTable">
<table>
 <tbody>
   <tr>
    <div class="tinyPrev"> <td style=" border:1px black solid"> </div>
     <a href="''' + str(int(numpoke)) + '''sumpage.html"> <img src="../img/front/''' + str(int(numpoke)) + '''.png" > <br> <font color="blue">''' + str(int(numpoke)) + ''' - First </font></a> </td>
    
    <td style="border:1px black solid"> <a href="../proj_CONT.html"> Return Home </a> </td>

    <div class="tinyPrev"> <td style=" border:1px black solid"> </div>
     <a href="''' + str(int(numpoke)+1) + '''sumpage.html"> <img src="../img/front/''' + str(int(numpoke) + 1) + '''.png">  <br> <font color="blue"> Next - ''' + str(int(numpoke)+1) + ''' </font></a> </td>
    
   </tr>
  </tbody>
</table>
</div>

'''   
        else:
            PNTable = '''

<div class="PNTable">
<table>
 <tbody>
   <tr>
    <div class="tinyPrev"> <td style=" border:1px black solid"> </div>
     <a href="''' + str(int(numpoke)-1) + '''sumpage.html"> <img src="../img/front/''' + str(int(numpoke) - 1) + '''.png" > <br> <font color="blue">''' + str(int(numpoke)-1) + ''' - Prev </font></a> </td>
    
    <td style="border:1px black solid"> <a href="../proj_CONT.html"> Return Home </a> </td>

    <div class="tinyPrev"> <td style=" border:1px black solid"> </div>
     <a href="''' + str(int(numpoke)+1) + '''sumpage.html"> <img src="../img/front/''' + str(int(numpoke) + 1) + '''.png">  <br> <font color="blue"> Next - ''' + str(int(numpoke)+1) + ''' </font></a> </td>
    
   </tr>
  </tbody>
</table>
</div>

'''     
        header1 = '''<h1>''' + str(pokename) + '''</h1>'''
        num = '<h2>' + zeros + str(int(numpoke)) + '</h2>'
        
        picHoverShiny = ''' onmouseover="this.src='../img/shiny/''' + str(img) + '''.png'" '''
        picNormal = ''' onmouseout="this.src='../img/front/''' + str(img) + '''.png'" '''
        picture = '<img class="pokemon" style="image-rendering:pixelated" src="../img/front/' + str(img) + '.png"' + picHoverShiny + picNormal + ' align="right">'
         
         
        html = htmlhead + PNTable + header1 + pokeWebStats(part) + typestable + num + picture + description + "</body></html>"
        
        dataWrite = open("pokemonwebs/"+str(numpoke) + 'sumpage.html','w')
        dataWrite.write(html)
        dataWrite.close()
        img+=1

print(pokeWebs('pokemon.csv'))
        
def makeFavoritesPage(filename):
    
    html = ''
    
    css = '''<!DOCTYPE html> <html lang="en">
  <head>
    <meta charset="UTF-8">
    <style>     
    body {
    font-family:Verdana;
    color:black;
    background-color:#FAFCFA;
    background-image: url('img/favoritesBG.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed;
    }
    
    table,td {
    width:5%;
    padding: 5px 3px 5px 3px;
    border: 1px black solid;
    text-align:center;
    }
    
    a {
    color:blue
    }
    
    img {
    height:96px;
    width:96px;
    image-rendering:pixelated;
    }
    
    .mainTable {
    width:800px;
    margin-left:350px;
    }
    
    p {
    font-family:Verdana;
    font-size:14px;
    color:Black;
    width:273px;
    }
    
    .top5 {
    width:497px;
    height:706px;
    background-color:#FCFBF1;
    margin-left:300px;
    }
    
    .top10 {
    width:500px;
    height:707px;
    background-color:#FCFBF1;
    margin-left:1100px;
    margin-top:-707px;
    }
    
    
    
    
    
    </style>
   </head>
   
   
   
   
   
'''
    header = '<center> <font size="36px"> <u> Special Pokemon </u> </font> <br> <h6> ( Including other Generations ) </h6> </center>'
    
    tblTop5 = '''<div class="top5">
    <table>
     <tbody>
      <tr>
      <td colspan="2">
      My Top 5
      </td>
      <td>
      Generation
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/chatot.gif"> <br> Chatot 
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      4
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/mudkip.png" alt="Mudkip"> <br> <a href="https://www.youtube.com/watch?v=1B2PyMoWF9M"> Mudkip </a>
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      3
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/swampert.png"> <br> Swampert
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      3
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/altaria.png"> <br> Altaria
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      3
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/drifloon.png"> <br> Drifloon 
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      4
      </td>
      </tr>
    </tbody>
    </table>
    </div>
    '''
    
    tblTop10 = '''<div class="top10">
    <table>
     <tbody>
      <tr>
      <td colspan="2">
      My Bottom 5
      </td>
      <td>
      Generation
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/4.png"> <br> Charmander 
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      1
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/4.png"> <br> Charmander 
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      1
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/4.png"> <br> Charmander 
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      1
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/4.png"> <br> Charmander 
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      1
      </td>
      </tr>
      <tr>
      <td>
      <img src="img/favorites/4.png"> <br> Charmander 
      </td>
      <td>
      <p> This is my number 1 favorite pokemon because. </p>
      </td>
      <td>
      1
      </td>
      </tr>
    </tbody>
    </table>
    </div>
    '''

    
    
    
    
    
    
    
    
    
    html += css + header + tblTop5 + tblTop10
    
    
    dataWrite = open(filename+'.html',"w")
    dataWrite.write(html)
    dataWrite.close()

print(makeFavoritesPage('favorites'))
    
    


