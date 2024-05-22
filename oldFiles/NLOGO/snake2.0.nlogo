;; BY LEYAO HE & BRITNEY HUANG
;breeds deleted, found another way to write it


globals
[
  lives    ;Current amount of lives you have
  level    ;Current level you are on
  apple-count    ;Counts how many apples
  border-color    ;Color of the border
  apple-color    ;Color of the apples
  snake-color    ;Color of the snake
  snake-length    ;Length of the snake
  monster-color    ;Color of the monster
  wall-color   ;Color of the wall in level 2
  time-left    ;Time the player has left
]

turtles-own
[
  time    ;Current time
]

patches-own [ttl]    ;helps the snake's tail move along without leaving purple trails behind it

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Setup Code

;;Leyao & Britney

;;observer
to setup    ;some aspects are borrowed from both Frogger and existing snake game
  ca
  resize-world -20 20 -20 20
  ask patches [set pcolor green]
  border                          ;Sets the border
  set time-left game-length       ;Players can choose how much time they want to take
  set level (level + 1)            ;Sets the currentl level #
  set lives (lives + 1)           ;Default # of lives is 1
  set snake-color violet
  set border-color black
  set apple-color red
  set snake-length 4              ;Default length of snake is 4 units
  set monster-color blue
  set wall-color brown
  ask one-of patches with [(pcolor = green) and (not (pcolor = wall-color))]
  [
    set pcolor apple-color
  ]  ;Randomizes the places in which apples spawn
  cro 1 [
    set color violet
    set shape "face happy"
  ]        ;Sets the snake's head color
  ask patch 0 0
  [ ;;these were borrowed from Mr. Brook's code
    set pcolor snake-color  set ttl 3
  ]                 ;Setup of the existing turtle and its tails
  ask patch 0 -1
  [
    set pcolor snake-color  set ttl 2
  ]
  ask patch 0 -2
  [
    set pcolor snake-color  set ttl 1
  ]
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Running Code

;;Leyao & Britney
;;observer
to start    ;some aspects are borrowed from existing snake game & added on new features
  ;; let going was borrowed from Mr. Brook's
  let going true    ;if the turtle is going
  ask turtle 0
  [
    fd 1            ;keeps moving forward 1
    decrement-time  ;keeps track of the time
    if (time-left = 0.0)    ;turtle stops going when there is no time left
    [
      set going false
    ]
    if pcolor = snake-color or pcolor = border-color or pcolor = monster-color or pcolor = wall-color
    [
      set going false
    ]     ;when turtle touches its own tail, the border, or the monsters, it stops going
    if pcolor = apple-color
    [
        set apple-count (apple-count + 1)      ;after the snake eats an apple, the # of apples it eats increases by 1
        set snake-length snake-length + 1      ;after the snake eats an apple, one tail is added
        apple-appear
        poisonapple-appear
    ]
    ask patches with [ttl > 0]
    [
        set ttl ttl - 1    ;makes it so that the tails keep moving forward behind the head and doesn't get left behind
        if ttl = 0 [set pcolor green]    ;the patch where the tail once was turns back green
    ]
      set pcolor snake-color    ;sets the new tails the color of the snake
      set ttl snake-length      ;and repeats the process every time the snake moves
    ]
  ; what happens when you lose
  if going = false
  [     ;if the snake stops going, it dies, and a user message appears saying it died
    ask patch 0 0   ;coordinate of patch
    [
      set lives (lives - 1)    ;the number of lives count also goes down
      user-message (word "Oops! You died! Your score was " apple-count ". Try again?")
    ]
    setup
    stop   ;stops the game after snake dies
  ]
  ; what happens when you win
  if ((apple-count = 20) and (level = 2))   ;if the player gets the snake to eat 20 apples, they win the game and a user message appears
  [
    user-message "Wow, you actually the beat the game... Play again?"
    stop
  ]
  if ((apple-count = 20) and (level = 1))   ;if the player gets the snake to eat 20 apples, a user message appears and they proceed to the next-level
  [
     user-message "Congratualtions! You have passed level 1 :D Go to level 2?"
     set level (level + 1)
     next-level
     stop
  ]
  wait 0.1
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Blocks

;;Leyao & Britney

;Britney
;;observer
to decrement-time   ;borrowed from Frogger
    set time-left precision (time-left - 0.1) 1    ;sets the rate in which the time will decrease
    set time precision (time - 0.1) 1
end

;;Leyao
;;observer
to border        ;Creates the borders of the world (restriction)
  ask patches with [pycor = -20 or pycor = 20]
  [set pcolor border-color]
  ask patches with [pxcor = -20 or pxcor = 20]
  [set pcolor border-color]
end

;Britney
;;observer
to wall          ;Creates the wall in level 2 (restriction)
  ask patches with [pycor = -19 or pycor = 19]
  [set pcolor wall-color]
  ask patches with [pycor = -18 or pycor = 18]
  [set pcolor wall-color]
  ask patches with [pycor = -17 or pycor = 17]
  [set pcolor wall-color]
  ask patches with [pycor = -16 or pycor = 16]
  [set pcolor wall-color]
  ask patches with [pxcor = -19 or pxcor = 19]
  [set pcolor wall-color]
  ask patches with [pxcor = -18 or pxcor = 18]
  [set pcolor wall-color]
  ask patches with [pxcor = -17 or pxcor = 17]
  [set pcolor wall-color]
  ask patches with [pxcor = -16 or pxcor = 16]
  [set pcolor wall-color]
  border
end

;;Britney
;;Observer
to apple-appear
  ask one-of patches with [pcolor = green and (not (pcolor = wall-color))]
  [
    set pcolor apple-color
  ]
  ;randomly spawns the apple
end

;;Leyao
;;observer
to poisonapple-appear
  ask one-of patches with
  [pcolor = green and not ((pcolor = apple-color) and (pcolor = snake-color) and (pcolor = wall-color))]
  [
    set pcolor monster-color
  ]
  ;randomly spawns the poisoned apples in patches that don't contain normal apples
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; DIRECTIONS
; these were borrowed from Frogger

;;Leyao
;;observer
to move-left
  ask turtle 0 [set heading 270 ]
end

;;observer
to move-right
  ask turtle 0 [set heading 90 ]
end

;;observer
to move-up
  ask turtle 0 [set heading 0 ]
end

;;observer
to move-down
  ask turtle 0 [set heading 180 ]
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Levels

;;Britney
;;observer
to next-level    ;to proceed to the next level
  if (level = 2)
  [
    setup
    wall
    start
    set level (level + 1)
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
260
10
801
552
-1
-1
13.0
1
10
1
1
1
0
0
0
1
-20
20
-20
20
0
0
1
ticks
30.0

BUTTON
814
337
904
370
New Game
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
872
388
935
421
Up
move-up
NIL
1
T
OBSERVER
NIL
W
NIL
NIL
1

BUTTON
872
421
935
454
Down
move-down
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
811
421
874
454
Left
move-left
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

BUTTON
934
421
997
454
Right
move-right
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

BUTTON
929
338
992
371
Start
start
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
814
114
986
159
Lives 
lives
17
1
11

MONITOR
814
159
986
204
# Apples
apple-count
17
1
11

SLIDER
814
248
986
281
Game-length
Game-length
0
100
100.0
1
1
NIL
HORIZONTAL

MONITOR
814
204
986
249
NIL
Time-left
17
1
11

TEXTBOX
6
10
115
36
DIRECTIONS:
16
14.0
0

MONITOR
814
70
986
115
Level
level
17
1
11

TEXTBOX
5
40
222
173
Press 'New Game' to generate a new game. Press 'Start' to start the game. Use the WASD keys to control the directions of the snake. You can see your stats on the right of the screen. Play with the slider to see how fast you can pass both levels.
12
0.0
1

TEXTBOX
0
169
150
189
GAME RULES:
16
14.0
1

TEXTBOX
1
192
263
417
LEVEL ONE\n- Eat 20 apples to progress to level two\n- Be careful of poisonous blue apples. They appear randomly on the map\n- Watch out for the black borders, one touch and you're dead\n\nLEVEL TWO\n- Eat 20 apples to win the game\n- Be careful of poisonous blue apples. They appear randomly on the map\n- Watch out for the black borders, one touch and you're dead\n- Watch out for the brown walls that have been added for extra difficulty
12
0.0
1

@#$#@#$#@
## WHAT IS IT?

Snake is a game used to show the growth of a snake by eating apples and without dying. 

## HOW IT WORKS

Using the control buttons ( move-up, move-down, move-left, move-right), you can manevur the snake to face a certain direction. As the snake eats an apple, the length of the snake will grow. he goal would be to eat as many apples as possible (red). The number of apple will also be your score. 

## HOW TO USE IT

Press new game to reset the game. Press Start or space key to play the game. Use the Game-length slider to choose how many seconds you want to set for the game. 

## THINGS TO NOTICE

It's important that the snake(violet) does not touch the border(black) or any of the monsters (blue). In addition, the snake will be headed towards one direction and move even without the control buttons, so be sure to change directions quickly.

## THINGS TO TRY

There's a game-length so the player can drag the slider to see how long the game would be. It would challenge the player to see if he/she can eat as many apples during the shorter amount of time. 

## EXTENDING THE MODEL

To challenge the coder, you can add try to make the monster move like the snake but randomly.

## NETLOGO FEATURES

The timer shows how many seconds you have left before you die. (different from the original snake game)
There are 2 levels that increase in difficulty to show your utlimate victory. (different from the original snake game)

## RELATED MODELS

Similarly in netlogo, pacman have some similar attributes. Pacman is eating the yellow food while there are a few monsters chasing after it while in our game, Snake we have monsters that kill the snake. In addition, they also have the control buttons. Some differences would be the snake-length and no reappearance of food. It is also similar to Froggers as there is a timer. We also borrowed and revised the directions key from froggers.

## CREDITS AND REFERENCES

Models examples we used:
- Frogger
- Snake game link: https://g.co/kgs/4a1hNx
- Reference from Mr. Brook's snake game code: http://bert.stuy.edu/pbrooks/fall2021/materials/intro-year-1/SnakeGameFinished.nlogo

Contributors:
Britney Huang
Leyao He
PERIOD 9
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

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
@#$#@#$#@
NetLogo 6.2.2
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
