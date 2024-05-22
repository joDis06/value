;//////////////////////////////////////////////////////
; Major Info & Commands
;//////////////////////////////////////////////////////

breed [fruits fruit]
breed [halffruits halffruit]
breed [points point]
breed [strikes strike]
breed [effectsA effectA]
breed [bombs bomb]
breed [explosions explosion]
turtles-own [ falling cut moving ]

;;Observer
; Directs you to the menu of Fruit Ninja, Faiza Mia
to menu
  ca
  ask patches [ set pcolor .01 ]
  import-pcolors-rgb "fruitninjamenu.jpg"
  resize-world -100 100 -100 100
  set-patch-size 2
end

;;Observer
; To set up the background for playing, Faiza Mia
to play
  ca
  ask patches [ set pcolor .1 ]
  import-pcolors-rgb "wood3.jpg"
  resize-world -100 100 -100 100
  set-patch-size 2
end

;;Observer
; Shows profile page of Fruit Ninja, Faiza Mia
to profile
  ca
  ask patches [ set pcolor .1 ]
  import-pcolors-rgb "profilepage.jpg"
  resize-world -100 100 -100 100
  set-patch-size 2
end

;;Observer
; To start playing the game, Joseph Disomma
to go
  ; check: if there are no patches with pcolor = .01
  if (not (any? patches with [ pcolor = .01 ]))
  ; if so, run procedures in the block below
[
    every .011
  [ gravity ]

  fMark
  deathline

  every 2
  [ makefruit ]

  every 4
    [ BombSpawn ]

  every .006
    [ BombMove ]

  every .001
    [ BombDespawn ]

  every .5
    [ ExplodeStrike ]

  every .0005
  [ slice ]

  death

  every .0095
  [falldown]

  despawn

  every .0095
  [scoreboard]

  every .0095
  ; check: if there are any strikes with xcor equal to -90 and if there are any strikes with xcor equal to -71
  [ if ( any? strikes with [ xcor = -90 ] ) and ( any? strikes with [ xcor = -71 ] )
  ; if so, run procedure "spawnx3"
    [ spawnx3 ] ]

  every .0095
  ; check: if there are any strikes with xcor equal to -90
  [ if any? strikes with [ xcor = -90 ]
  ; if so, run procedure "spawnx2"
    [ spawnx2 ] ]

  every .0075
  [ spawnx ]

  every .75
  [ restart ]

  ]

  every .0015
  [ effect1 ]

  every .0025
  [ disappear ]

  win
end

;;Observer
; To restart the game, Jade Doan
to restart
  ; check: if 3 strikes have xcors of -90, -71, and -52 respectively
  if ( any? strikes with [ xcor = -90 ] ) and ( any? strikes with [ xcor = -71 ] ) and ( any? strikes with [ xcor = -52 ] )
  ; if so, run the "play" procedure and restart the game
  [ play ]
end


;//////////////////////////////////////////////////////
; Components of Go
;//////////////////////////////////////////////////////

;;Observer
; For fruits to float, Jade Doan
to upward
   every 1
  [ fd 1
  ]
end

;;Observer
; For fruits to go sink,  Jade Doan
to downward
   every 1
  [ bk 1

  ]
end

;;Observer
; 'Falling mark,' marks the threshold fruits need to reach before falling down, Faiza Mia
to fMark
  ask fruits with [ ycor > 40 ]
    [set falling (falling + 1)]
end

;;Observer
; Directs fruit to move upward / downward depending if it has reached the threshold, Joseph Disomma
to gravity
  ask fruits with [ falling >= 1 ]
  [ downward ]
  ask fruits with [ falling < 1 ]
  [ upward ]
end

;;Observer
; Threshold fruits need to cross to be deemed dead, Jade Doan
to deathline
  ask fruits with [ ycor < -97 ]
  [ die ]
end

;;Observer
; Makes fruit, Faiza Mia
to makefruit
  ; check: number of fruits on screen <= three and if the value of (random 50) < 55
  if (( (count fruits) <= 4) and ( (random 50) < 55))
  ; if so, create three random fruit from the possible fruits being bananas, apples, strawberries, or watermelons
  [
    crt (random 4) [
      set breed fruits
    set shape (one-of ["banana" "apple" "strawberry" "watermelon"])

      ; check: is the fruit a banana?
      if (shape = "banana")
    ; if so, set the size to 15 and make the color yellow
    [ set size 15
      set color yellow ]

    ; check: is the fruit an apple?
    if
    (shape = "apple")
    ; if so, set the size to 20 and make the color green
    [ set size 20
      set color green ]

    ; check: is the fruit a strawberry?
    if
    (shape = "strawberry")
    ; if so, set the size to 18 and make the color red
    [ set size 18
      set color red ]

    ; check: is the fruit a watermelon?
    if (shape = "watermelon")
    ; if so, set the size to fifty
    [ set size 50 ]

   ; set heading of new fruit to 0, xcor to anything between -97.5 and 97.5, and ycor to -90
   set heading 0
   setxy
      (one-of (range -97.5 97.5))
    -90
  ]
]

end

;;Observer
; Spawns bombs, Joseph Disomma
to BombSpawn
  ; check: is the amt of pounts >= 20 and (random 20) < 25
  if (count points >= bThreshold) and ( (random 20) < 25) [
  ; if so, create 1 turtle with following characteristics
    crt 1 [
      set breed bombs
      set shape "bomb"
      set size 25
      set color 101.1
      setxy
      one-of [-91.1 91]
      (one-of (range -94 70))

    ]
  ]

  ask bombs with [ xcor > -90  and moving = 0 ]
  [ set moving (moving + 1 )]
   ask bombs with [ xcor < 90 and moving = 0 ]
  [ set moving (moving + 2)]

end

;;Observer
; Moves bombs, Joseph Disomma
to BombMove
  every .007 [
  ask bombs with [ moving = 2 ] [
      set heading 90
    fd 1 ]
  ]
;////////
  every .007 [
  ask bombs with [ moving <= 1] [
      set heading 270
    fd 1 ]
]
;////////
  every .02
  [ BombDespawn ]

end

;;Observer
; Despawns bombs if alive for too long without being cut, Joseph Disomma
to BombDespawn
  every .0059 [
    ask bombs with [ xcor < -90  and moving = 1 ] [
      set moving (moving + 3) ]
  ]
;////////
  every .0059 [
    ask bombs with [ xcor > 90  and moving = 2 ] [
      set moving (moving + 3) ]
  ]
;////////
  every .0059 [
    ask bombs with [ moving >= 3 ]
    [ die ]
  ]
end

;;Observer
; Causes bombs to explode when cut, Joseph Disomma
to BombExplode
  ask bombs with [ cut >= 1 ]
  [ hatch 1 [
      set breed explosions
      set shape "explosion"
      set size 30
  ]
    die
  ]
end

;;Observer
; Restarts the game if any explosions are present, Joseph Disomma
to ExplodeStrike
  ; check: any explosions?
  if any? explosions
  ; if so, run play procedure & restart
  [ play ]
end

;;Observer
; To slice the fruits, Joseph Disomma
to slice
  ; check: mouse-down?
  if mouse-down?
  ; if so, ask fruits with a distance of their x & ycor's of <= 5 to set "cut" to "cut + 1"
  ; and run the "split" procedure
  [ ask fruits with [ distancexy mouse-xcor mouse-ycor <= 5 ]
    [
      set cut (cut + 1)
      split
      ]
  ]

   ; check: mouse-down?
  if mouse-down?


  [ ask bombs with [ distancexy mouse-xcor mouse-ycor <= 3 ]
    [
      set cut (cut + 1)
      BombExplode
      ]
  ]
end

;;Observer
; Determines which fruits are dead after sliced, Faiza Mia
; Fruits with cut >=1 are asked to die
to death
  ask fruits with [ cut >= 1 ]
  [ die ]
end

;;Observer
; Asks fruits <= 5 units away from the mouse to split into one of two halves, Jade Doan
to split
 ask fruits with [ distancexy mouse-xcor mouse-ycor <= 5 ]

;; Turtles
;/ APPLE SPLIT
; To split apples into their halves, Tommy Wang
  ; check: is the fruit an apple?
  [ if shape = "apple"
  ; if so, hatch one apple and set the breed to halfffruits,
  ;set the shape to either 'leftapple' or 'rightapple,'
  ;set the size to 20 and the color green
   [ hatch 1
       [
              set breed halffruits
          set shape (one-of ["leftapple" "rightapple"])
          set size 20
          set color green
  ]
  ]

; Turtles
;/ STRAWBERRY SPLIT
; To split strawberries into their halves, Tommy Wang
  ; check: is the fruit a strawberry?
  if shape = "strawberry"
    ; if so, hatch one strawberry and set the breed to halfffruits,
    ;set the shape to either 'leftstrawberry' or 'rightstrawberry,'
    ;set the size to 18
    [ hatch 1
       [
              set breed halffruits
        set shape (one-of ["leftstrawberry" "rightstrawberry"])
          set size 18

  ]
  ]

; Turtles
;/ WATERMELON SPLIT
; To split watermelons into their halves, Tommy Wang
   ; check: is the fruit a watermelon?
   if shape = "watermelon"
    ; if so, hatch one watermelon and set the breed to halfffruits,
    ;set the shape to either 'leftmelon' or 'rightmelon'
    ;set size to 50
    [ hatch 1
       [
              set breed halffruits
        set shape (one-of ["leftmelon" "rightmelon"])
          set size 50

  ]
  ]

;// BANANA SPLIT
; To split bananas into their halves, Tommy Wang
   ; check: is the fruit a banana?
   if shape = "banana"
    ;if so, hatch one banana and set the breed to halfffruits,
    ;set the shape to either 'leftbanana or 'rightbanana,'
    ;set the size to 15
    [ hatch 1
       [
              set breed halffruits
        set shape (one-of ["leftbanana" "rightbanana"])
          set size 15


      ]
    ]
  ]
end

;;;// HALF-FRUIT RELATED
;;Observer
; For half fruits to fall, Joseph Disomma
to falldown
  ask halffruits [
    bk 1
  ]
end

;;Observer
; For half fruits to 'despawn,' or die, Joseph Disomma
to despawn
  ; check: if halffruits below -97
  ask halffruits with [ ycor < -97 ]
  ; if so, ask those halffruits to die
  [die]

end

;;Observer
; To count score, Faiza Mia
to scoreboard
 ; check: if any halffruits with a y level of -96
 if any? halffruits with [ ycor = -96 ]
 ; if so, crt 1 turtle with given characteristics
 [ crt 1
    [
    set breed points
    set size 3
   set shape "circle"
   set hidden? true
      setxy
      90
      90

]]
end

;;;// X SPAWNS
;;Observer
; To spawn the first strike ("x") , Joseph Disomma
; In original game if a fruit falls too far without being cut,
; it will give you one strike. 3 strikes and the game is over.
to spawnx
 if ( any? fruits with [ ycor < -96 ] )
  ; check: any fruits with ycor less than -96
  [ crt 1
  ; if so, crt 1 turtle with given characteristics
    [
      set breed strikes
      set shape "x"
      set size 22.8
      set heading 0
      set color red
      setxy
      -90
      90
    ]
  ]
end

;;Observer
; To spawn the second strike "x" , Joseph Disomma
to spawnx2
  if ( any? fruits with [ ycor < -96 ] ) and ( any? strikes with [ xcor = -90 ] )
  ; check: if any fruits with ycor less than -96 and if there are any strikes with xcor equal to -90
  [ crt 1
  ; if so, crt 1 turtle with given characteristics
    [
      set breed strikes
      set shape "x"
      set size 22.8
      set heading 0
      set color red
      setxy
      -71
      90
    ]
  ]
end

;;Observer
; To spawn the third strike "x", Joseph Disomma
to spawnx3
  if ( any? fruits with [ ycor < -96 ] ) and ( any? strikes with [ xcor = -90 ] ) and ( any? strikes with [ xcor = -71 ] )
  ; check: any fruits with ycor less than -96, if any strikes with xcor = -90, and if any strikes with xcor = -71
  [ crt 1
  ; if so, crt 1 turtle with given characteristics
    [
      set breed strikes
      set shape "x"
      set size 22.8
      set heading 0
      set color red
      setxy
      -52
      90
    ]
  ]
end

;//////////////////////////////////////////////////////
; Cosmetic
;//////////////////////////////////////////////////////

;;Observer
; Spawns turtles to act as a light blue trail following the mouse, Tommy Wang
to effect1
  ; check: is the mouse down?
  if mouse-down? [
  ; if so, crt 1 turtle with given characteristics
    crt 1 [
      set breed effectsA
      set color 88.8
      set size 2
      setxy
      mouse-xcor
      mouse-ycor
    ]
  ]
end

;;Observer
; Kills the turtles that make up the light blue trail following the mouse, Tommy Wang
; check: if count of effectsA is >= 1
to disappear
  every .00015 [
    ; check: is the count of effectsA >=1
    if (count effectsA) >= 1
    [
    ; if so, ask the "effectsA" turtle with the lowest "who" value to die
  ask (min-one-of effectsA [ who ] )
      [ die ]
    ]
  ]
end

;;Observer
; Allows for the menu ( "play original" section ) to be used, sends to game screen, Tommy Wang
to touchscreen
  ; check: is the mouse down?
  if mouse-down?
  and
  ; if so, check: if mouse-xcor > 24 and mouse-xcor < 72
  ( (mouse-xcor > 24) and (mouse-xcor < 72) )
  and
  ; if so, check: if mouse-ycor > -25 and mouse-ycor < 25
  ( (mouse-ycor > -25) and (mouse-ycor < 25) )
  and
  ; if so, check: if any patches with pcolor = .01
  (any? patches with [ pcolor = .01 ])
  ; if so, run play procedure
  [ play ]
;///////////////////
  ; check: is the mouse down?
  if mouse-down?
  and
  ; if so, check: if mouse-xcor > 7 and mouse-xcor < 87
  ( (mouse-xcor > 7) and (mouse-xcor < 87) )
  and
  ; if so, check: if mouse-ycor > -59 and mouse-ycor < -43
  ( (mouse-ycor > -59) and (mouse-ycor < -43) )
  and
  ; if so, check: if any patches with pcolor = .01
  (any? patches with [ pcolor = .01 ])
  ; if so, run profile procedure
  [ profile ]
;///////////////////
  ; check: is the mouse down?
  if mouse-down?
  ; if so, run effect procedure every .0015s and run disappear procedure every .0025s
  [ every .0015
    [ effect1 ]
  ]

  every .00195
  [ disappear ]
end

;;Observer
; Sets a limit score for the player, Faiza Mia
to win
  if count points = limit
  [ user-message "You won!"
    stop
  ]
end



;//////////////////////////////////////////////////////
; Test Commands
;//////////////////////////////////////////////////////

;;Observer
; Allows for quick testing of fruits if button "fbutton" is made. Places a fruit at mouse coordinates, Jade Doan
; check: if shape banana -> set properties for banana
; if shape apple -> set properties for apple
; if shape strawberry -> set properties for strawberry
; if shape watermelon -> set properties for watermelon
to fbutton
  every 1
  [
  crt 1 [
      set breed fruits
    set shape (one-of ["banana" "apple" "strawberry" "watermelon"])
     if (shape = "banana")
    [ set size 15
      set color yellow ]
    if
    (shape = "apple")
    [ set size 20
      set color green ]
    if
    (shape = "strawberry")
    [ set size 18
      set color red ]
    if (shape = "watermelon")
    [ set size 50 ]
    set heading 0
   setxy
      mouse-xcor
        mouse-ycor
  ]
  ]

end

;//////////////////////////////////////////////////////
; END
;//////////////////////////////////////////////////////
@#$#@#$#@
GRAPHICS-WINDOW
205
14
615
425
-1
-1
2.0
1
10
1
1
1
0
1
0
1
-100
100
-100
100
0
0
1
ticks
30.0

BUTTON
214
437
626
482
NIL
go
T
1
T
OBSERVER
NIL
G
NIL
NIL
1

MONITOR
631
29
691
90
Points
count points
17
1
15

BUTTON
75
124
197
157
Play Original
play
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
76
83
197
116
Main Menu
menu
NIL
1
T
OBSERVER
NIL
M
NIL
NIL
1

BUTTON
74
166
199
199
Profile
profile
NIL
1
T
OBSERVER
NIL
P
NIL
NIL
1

BUTTON
69
206
204
251
Touchscreen Mode
touchscreen
T
1
T
OBSERVER
NIL
T
NIL
NIL
1

SLIDER
326
490
515
523
limit
limit
10
50
50.0
1
1
pts
HORIZONTAL

SLIDER
326
528
516
561
bThreshold
bThreshold
0
15
2.0
1
1
pts
HORIZONTAL

@#$#@#$#@
## WHAT IS IT?

This is Fruit Ninja. In this game fruits such as apples, straberries, watermelons, and bananas fly across the screen for the player to slice. Sliced fruits are recorded and missed fruits are added up until the player reaches a certain limit. The game ends once the limit is reached.

## HOW IT WORKS

The model starts off (after pressing M) with a menu screen. The "Main Menu" then lets you access two different parts of the model, the game and the "profile". Pressing the 'S' key or the "Play" button brings you to the game, and pressing the 'G' key, or "go" will start it. The game works by randomly creating turtles ( designed as 4 different fruits ) and moving them along the screen. The fruits move upwards at a set rate until they reach a certain y level (in this case, 40). When a fruit reaches the threshold, the characteristic of "falling" (added into by the model), will go from 0 to 1. A fruit with " falling = 1 " will then descend. Any fruit that descends past y = -96 will do two things:

1 ) The fruit will die.

2 ) The fruit will cause a "strike", or "x",  to be created in the upper left-hand corner.

When 3 "strikes" are in the world the game will restart. To prevent this, however, pressing down on the screen will allow you to "cut" the fruit. When the mouse is down and goes over a fruit, its characteristic "cut" is changed to "cut + 1", labeling the fruit as being cut. A cut fruit then causes another two things to happen:

1 ) The fruit will die.

2 ) The fruit hatches 1 "half-fruit" which resembles either the left half or right half of the fruit that has been cut. This half-fruit will then fall and die, but will not spawn a strike.

In addition to fruits, obstacles such as "bombs" are in play. Bombs will randomly spawn when your score is over 20 points. A bomb will move across the screen at a set speed and if hit will do two things:

1 ) The bomb will die.

2 ) An explosion will spawn, restarting the game.

## HOW TO USE IT

Our "Main Menu" button brings the players to the main menu of the game and can be accessed by clicking on the 'M' key on one's keyboard. The "Play Original" button, accessed by the 'S' key, brings you to the background of the game to start playing. The "Profile" button brings you to your game profile, and is accessed by the 'P' key. The "Touchscreen" button allows you to play on a touchscreen device. To start playing, press the 'G' key, which clicks on the "Go" button. 


## THINGS TO NOTICE

The top left corner shows the number of 'strikes' the player has. Once the player reaches three strikes, the game restarts. 


## THINGS TO TRY

Try enabling "Touchscreen Mode" and dragging the mouse along the world instead of using the set buttons. Also try messing with the bomb threshold & score limit.

## EXTENDING THE MODEL

Adding difficulties, like the speed at which the fruits fall or weird directions for the fruits to move in. Random changes in speed of the fruits can also make the game more difficult. 

## NETLOGO FEATURES

In this model, strike 1, or the "x" most left, is supposed to be created first. Then comes the middle "x", or strike 2, and the most right "x", or strike 3. We first thought to use the "wait" command, combining all three strike procedures into one procedure, in which after a strike is created, there is a grace period for the player. However, the "wait" command does not function this way and instead pauses the entire program with no real grace period for the player. This forced us to split the strike procedures into 3 separate procedures, in which it checks if a strike # before it exists before spawning in.

## RELATED MODELS

N/a. 

## CREDITS AND REFERENCES



Faiza Mia, Joseph Disomma, Jade Doan, and Yitao (Tommy) Wang
Period 9
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

apple
false
0
Polygon -7500403 true true 33 58 0 150 30 240 105 285 135 285 150 270 165 285 195 285 255 255 300 150 268 62 226 43 194 36 148 32 105 35
Line -16777216 false 106 55 151 62
Line -16777216 false 157 62 209 57
Polygon -6459832 true false 152 62 158 62 160 46 156 30 147 18 132 26 142 35 148 46
Polygon -16777216 false false 132 25 144 38 147 48 151 62 158 63 159 47 155 30 147 18

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

banana
false
0
Polygon -7500403 false true 25 78 29 86 30 95 27 103 17 122 12 151 18 181 39 211 61 234 96 247 155 259 203 257 243 245 275 229 288 205 284 192 260 188 249 187 214 187 188 188 181 189 144 189 122 183 107 175 89 158 69 126 56 95 50 83 38 68
Polygon -7500403 true true 39 69 26 77 30 88 29 103 17 124 12 152 18 179 34 205 60 233 99 249 155 260 196 259 237 248 272 230 289 205 284 194 264 190 244 188 221 188 185 191 170 191 145 190 123 186 108 178 87 157 68 126 59 103 52 88
Polygon -16777216 true false 283 196 273 204 287 208
Polygon -16777216 true false 26 77 30 90 50 85 39 69

bomb
true
0
Polygon -1 true false 185 90 196 79 216 69 228 67 244 67 249 68 248 76 239 78 223 77 214 83 206 90 200 103
Circle -7500403 true true 29 74 212
Polygon -7500403 true true 143 81 156 102 182 121 209 131 225 131 228 126 225 114 213 100 201 90 186 77 170 69 150 71 139 77
Polygon -2674135 true false 249 76 249 65 242 65 240 74 237 79
Polygon -2674135 true false 206 130 184 131 164 142 133 149 160 173 175 209 183 243 165 225 148 199 122 162 109 170 84 199 57 227 74 181 83 170 112 150 91 131 80 123 74 105 85 109 106 116 119 137 125 139 139 128 164 118 186 118 197 121
Circle -2674135 false false 29 73 214
Polygon -2674135 false false 147 74 157 69 166 70 193 81 216 69 242 67 237 78 220 76 203 92 222 110 226 123

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

explosion
true
0
Polygon -2674135 true false 54 96 101 147 32 165 124 158 67 224 158 165 151 248 179 159 269 203 202 137 266 66 180 123 173 7 141 112 101 21 119 132
Polygon -955883 true false 90 84 121 161 79 201 152 165 145 221 178 172 200 215 213 169 253 152 200 144 210 67 166 115 135 71 132 130
Polygon -1184463 true false 95 138 73 126 116 124 112 84 133 105 170 76 193 107 242 123 208 135 228 194 187 163 178 199 154 165 124 198 117 159 115 147

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

heart
true
0
Polygon -7500403 true true 150 105 120 75 75 75 45 105 45 165 150 255 255 165 255 105 225 75 180 75 150 105

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

leftapple
false
0
Polygon -7500403 true true 48 58 15 150 45 240 120 285 150 285 150 270 150 285 150 285 150 270 150 150 150 45 150 30 150 30 150 30 120 35
Line -16777216 false 106 55 151 62
Polygon -6459832 true false 137 62 143 62 145 46 141 30 132 18 117 26 127 35 133 46
Polygon -16777216 false false 117 25 129 38 132 48 136 62 143 63 144 47 140 30 132 18

leftbanana
false
0
Polygon -1184463 false false 25 78 29 86 30 95 27 103 17 122 12 151 18 181 39 211 61 234 96 247 155 259 150 257 144 253 142 244 135 225 135 225 135 210 150 195 150 195 150 195 150 195 144 189 123 187 104 178 88 160 69 126 56 95 50 83 38 68
Polygon -1184463 true false 39 69 26 77 30 88 29 103 17 124 12 152 18 179 34 205 60 233 99 249 155 260 150 255 150 255 135 225 135 210 150 195 150 195 150 195 150 195 150 195 150 195 145 190 123 186 108 178 87 157 68 126 59 103 52 88
Polygon -16777216 true false 26 77 30 90 50 85 39 69

leftmelon
true
0
Polygon -13840069 true false 151 42 76 72 46 147 76 222 151 252 151 42 76 72
Polygon -1 true false 150 54 150 245 82 217 53 148 82 81 148 56
Polygon -2674135 true false 150 60 86 87 59 149 87 213 150 240
Circle -16777216 true false 79 125 8
Circle -16777216 true false 121 134 8
Circle -16777216 true false 101 99 8
Circle -16777216 true false 87 162 8
Circle -16777216 true false 127 170 8
Circle -16777216 true false 95 195 8
Circle -16777216 true false 132 217 8
Circle -16777216 true false 132 81 8

leftstrawberry
false
0
Polygon -2674135 true false 57 47 23 88 19 139 70 245 107 289 135 281 135 285 135 285 135 225 135 120 135 45 120 45 135 45 134 48 89 38
Polygon -10899396 true false 106 62 61 62 106 77 106 92 121 122 136 107 136 77 135 75 135 75 135 60 120 60 120 60 135 60 136 57 106 32
Circle -1184463 true false 90 135 0

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

rightapple
false
0
Polygon -7500403 true true 252 58 285 150 255 240 180 285 150 285 150 270 150 285 150 285 150 270 150 150 150 45 150 30 150 30 150 30 180 35
Line -16777216 false 194 55 149 62
Polygon -6459832 true false 163 62 157 62 155 46 159 30 168 18 183 26 173 35 167 46
Polygon -16777216 false false 183 25 171 38 168 48 164 62 157 63 156 47 160 30 168 18

rightbanana
false
0
Polygon -1184463 true false 111 154 111 154 126 184 111 154 111 154 111 154 126 184 126 184 126 184 126 184 131 189 172 188 213 177 248 159 265 134 260 123 240 119 220 117 197 117 161 120 146 120 121 119 126 124 126 124 126 124 126 124 111 154 138 143
Polygon -16777216 true false 261 122 251 130 265 134
Polygon -1184463 false false 263 135 258 123 222 118 198 118 168 120 122 120 127 125 111 154 129 187 134 187 164 188 209 177 246 159

rightmelon
true
0
Polygon -13840069 true false 149 42 224 72 254 147 224 222 149 252 149 42 224 72
Polygon -1 true false 150 54 150 245 218 217 247 148 218 81 152 56
Polygon -2674135 true false 150 60 214 87 241 149 213 213 150 240
Circle -16777216 true false 213 125 8
Circle -16777216 true false 171 134 8
Circle -16777216 true false 191 99 8
Circle -16777216 true false 205 162 8
Circle -16777216 true false 165 170 8
Circle -16777216 true false 197 195 8
Circle -16777216 true false 160 217 8
Circle -16777216 true false 160 81 8

rightstrawberry
false
0
Polygon -2674135 true false 243 47 277 88 281 139 230 245 193 289 165 281 165 285 165 285 165 225 165 120 165 45 180 45 165 45 166 48 211 38
Polygon -10899396 true false 194 62 239 62 194 77 194 92 179 122 164 107 164 77 165 75 165 75 165 60 180 60 180 60 165 60 164 57 194 32
Circle -1184463 true false 210 135 0

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

strawberry
false
0
Polygon -7500403 false true 149 47 103 36 72 45 58 62 37 88 35 114 34 141 84 243 122 290 151 280 162 288 194 287 239 227 284 122 267 64 224 45 194 38
Polygon -2674135 true false 72 47 38 88 34 139 85 245 122 289 150 281 164 288 194 288 239 228 284 123 267 65 225 46 193 39 149 48 104 38
Polygon -10899396 true false 136 62 91 62 136 77 136 92 151 122 166 107 166 77 196 92 241 92 226 77 196 62 226 62 241 47 166 57 136 32
Polygon -10899396 false false 135 62 90 62 135 75 135 90 150 120 166 107 165 75 196 92 240 92 225 75 195 61 226 62 239 47 165 56 135 30
Circle -1184463 true false 90 135 0

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

watermelon
true
0
Polygon -10899396 true false 43 140 82 165
Circle -13840069 true false 63 63 175
Circle -1 true false 72 72 156
Circle -2674135 true false 78 77 146
Circle -16777216 true false 109 118 8
Circle -16777216 true false 141 141 8
Circle -16777216 true false 173 128 8
Circle -16777216 true false 108 161 8
Circle -16777216 true false 166 192 8
Circle -16777216 true false 172 99 8
Circle -16777216 true false 149 167 8
Circle -16777216 true false 143 92 8
Circle -16777216 true false 126 193 8
Circle -16777216 true false 187 156 8

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
Polygon -16777216 false false 30 75 105 150 30 225 75 270 150 195 225 270 270 225 195 150 270 75 225 30 150 105 75 30 30 75
@#$#@#$#@
NetLogo 6.2.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
