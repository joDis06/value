breed [snakes snake]
breed [apples apple]
breed [poisons poison]
breed [goldens golden]
breed [tails tail]
globals [started score h v danger gold walls]
tails-own [tail-length]

;; Observer
;; sets up the world and presents a starting screen
;; Yuri & Rachel
to setup
  ca
  resize-world -10 10 -10 10
  set-patch-size 25
  let x (one-of [28 48 58 68 78 88 108 128])
  ask patches
  [set pcolor ((pxcor + pycor) * (pxcor + pycor)) + x]
  let y random 169
  crt 1
  [set shape "snake-title"
    set size 14
    set color y
    setxy 0 4]
  crt 1
  [set shape "snake-title"
    set size 14
    set color white
    setxy 0.5 4]
  crt 1
  [set shape "play-button"
    set size 7.38
    set color y
    setxy 0.2 -3.65]
  set started false
  ifelse hover = true and mouse-down?
  [start
    set started true
  stop]
    [wait 0.15]
end

;; Boolean Boolean -> Boolean
;; reports if mouse is touching play-button
;; Yuri
to-report hover
  ifelse ((-3 <= mouse-xcor and mouse-xcor <= 4) and (-6 <= mouse-ycor and mouse-ycor <= -3))
  [report true]
  [report false]
end

;; Observer
;; background for the game
;; Yuri & Rachel
to background
  ask patches with [is-even? (pxcor + pycor)]
  [
    if character = "snake"
    [set pcolor 67]
    if character = "snowman"
    [set pcolor 89]
    if character = "butterfly"
    [set pcolor 137]
    if character = "fish"
    [set pcolor 97]]
  ask patches with [is-odd? (pxcor + pycor)]
  [
    if character = "snake"
    [set pcolor 66]
    if character = "snowman"
    [set pcolor 98]
    if character = "butterfly"
    [set pcolor 67]
    if character = "fish"
    [set pcolor 87]]
end

;; Observer
; adds a wall if “No Wall” function is not triggered
;; Yuri & Rachel
to wall
  ifelse No-Walls
      [background]
  [ask patches with [(pxcor = min-pxcor or pxcor = max-pxcor) or (pycor = min-pycor or pycor = max-pycor)]
    [set pcolor black]]
end

;; Observer
; prepares to start game
;; Yuri & Rachel
to start
  ask turtles [die]
  background
  wall
  set danger false
  set gold false
  snake-setup
  apple-setup
  set score 0
  ask tails [set tail-length 0]
  set h false
  set v false
  ask patch 3 -1
  [set plabel "press go (p) to start!"
      set plabel-color black]
end

;; Observer
;; procedure to run the game
;; Yuri & Rachel
to go
  if started [
  ask patch 3 -1 [set plabel ""]
  wall
  move
  eat
  game-over
  if not any? snakes
  [dead
   set started false
      stop]]
end

;; Observer
;; sets up snake or other character
;; Yuri & Rachel
to snake-setup
  crt 1 [
    set breed snakes
    if character = "snake"
    [set shape "snake"]
    if character = "snowman"
    [set shape "snowman"]
    if character = "butterfly"
    [set shape "butterfly"]
    if character = "fish"
    [set shape "fish"]
    set size 1
    set heading one-of [0 90 180 270]]
end

;; Observer
;; creates apples or other food
;; Yuri & Rachel
to apple-setup
  crt 1 [
    set breed apples
    if character = "snake"
    [set shape "apple"
        set color red]
    if character = "snowman"
    [set shape "snowflake"
    set color sky
    set size 2]
    if character = "butterfly"
    [set shape "bug"
      set color 25]
    if character = "fish"
    [set shape "plant"
      set color 66]
    setxy one-of (range -9 9) one-of (range -9 9)
    set size 1]
  if any? apples-on tails
  [ask apples [die]
    apple-setup]
end

;; Observer
;; move command for snake
;; Yuri & Rachel
to move
  every (1 / (speed * 5))
  [tail-end
    ask snake 3 [wiggle]
  ]
end

;; Turtle
;; move procedure
;; Borrowed from slime-mould.nlogo
to wiggle
  fd 1
end

;; Observer
;; procedure for when snake eats an apple
;; Yuri & Rachel
to eat
  let burp false
  let belch false
  ask snakes with [any? snakes-on apples]
  [set burp true
    ask apples [die]
    ask poisons [die]
    ask goldens [die]]
  ask snakes with [any? snakes-on goldens]
  [set belch true
    ask apples [die]
    ask poisons [die]
    ask goldens [die]]
  if burp = true
  [set score (score + 1)
  apple-setup]
  if burp = true and Poison-Apple
  [poison-setup]
  if burp = true and Golden-Apple
    [apple-setup
      golden-setup]
  if belch = true
  [set score (score + 2)
    apple-setup
    golden-setup
  apple-setup
  if Poison-Apple = true
    [poison-setup]]
end


;; Observer
;; spawns in a tail when snake eats an apple
;; Yuri & Rachel
to tail-end
 ask snake 3
  [every (1 / (speed * 5))
  [hatch 1
  [set breed tails
        if character = "snake"
        [set shape "circle"]
        if character = "snowman"
        [set shape "snowball"]
        if character = "butterfly"
        [set shape "butterfly"]
        if character = "fish"
        [set shape "fish"]
      set tail-length score + 1
      move-to snake 3
      tail-follow]]]
  if v = true and h = true
  [stop]
end

;; Observer
;; procedure for tail to follow the head
;; Yuri
to tail-follow
  ask tails with [tail-length > 0]
    [set tail-length (tail-length - 1)]
  ask tails with [tail-length = 0]
    [die
      tail-end]
end

;; Observer
;; creates poison element that will kill the snake if touched
;; Yuri & Rachel
to poison-setup
  crt (1 + random 5) [
    set breed poisons
    set size 1
    if character = "snake"
    [set shape "apple"]
    if character = "snowman"
    [set shape "fire"]
    if character = "butterfly"
    [set shape "ant"]
    if character = "fish"
    [set shape "shark"
    set size 2]
    set color violet
    setxy one-of (range -9 9) one-of (range -9 9)]
  if (any? poisons-on tails)
  [ask poisons [die]
    poison-setup]
end

;; Observer
;; sets up golden items that will make the snake elongate by two tails instead of one
;; Yuri & Rachel
to golden-setup
  crt 1 [
    set breed goldens
    if character = "snake"
    [set shape "apple"]
    if character = "snowman"
    [set shape "snowflake"]
    if character = "butterfly"
    [set shape "bug"]
    if character = "fish"
    [set shape "plant"]
    set color yellow
    setxy one-of (range -9 9) one-of (range -9 9)
    set size 1]
  if any? goldens-on tails
  [ask goldens [die]
    golden-setup]
end

;; Observer
;; condition for snake to die
;; Rachel
to game-over
  ask turtles with [any? snakes-on patches with [pcolor = black] or any? snakes-on tails or any? snakes-on poisons]
  [die]
end

;; Observer
;; game over screen
;; Yuri & Rachel
to dead
  set v true
  set h true
  ask patches
  [set pcolor black]
  ask patch 2 0
  [set plabel "GAME OVER"]
end

;; Observer
;; action key for snake to turn right
;; Yuri & Rachel
to R
  if h = false
  [ask snake 3
    [set heading 90]
      if score > 0
      [set h true
      set v false]]
end

;; Observer
;; action key for snake to turn left
;; Yuri & Rachel
to L
  if h = false
  [ask snake 3
    [set heading 270]
      if score > 0
    [set h true
  set v false
        stop]]
end

;; Observer
;; action key for snake to turn upwards
;; Yuri & Rachel
to U
  if v = false
  [ask snake 3
    [set heading 0]
      if score > 0
    [set v true
  set h false
  ]]
end

;; Observer
;; action key for snake to turn downwards
;; Yuri & Rachel
to D
 if v = false
  [ask snake 3
    [set heading 180]
      if score > 0 [
    set v true
  set h false
  ]]
end

;; Integer -> Boolean
;; returns true if the given integer is even
;; Borrowed this code from Patterns.nlogo
to-report is-even? [n]
  report ((remainder n 2) = 0)
end

;; Integer -> Boolean
;; returns true if the given integer is false
;; Borrowed this code from Patterns.nlogo
to-report is-odd? [n]
  report (not (is-even? n))
end
@#$#@#$#@
GRAPHICS-WINDOW
448
70
981
604
-1
-1
25.0
1
20
1
1
1
0
1
1
1
-10
10
-10
10
0
0
1
ticks
30.0

BUTTON
226
110
401
204
NIL
setup
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
192
478
258
511
Left
L
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
343
477
410
510
Right
R
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
280
220
335
253
NIL
go
T
1
T
OBSERVER
NIL
P
NIL
NIL
1

BUTTON
267
477
333
510
Down
D
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
268
433
335
466
Up
U
NIL
1
T
OBSERVER
NIL
W
NIL
NIL
1

SLIDER
1005
355
1150
388
speed
speed
1
5
1.0
.5
1
NIL
HORIZONTAL

MONITOR
275
266
338
311
NIL
score
17
1
11

CHOOSER
1004
142
1146
187
Character
Character
"snake" "snowman" "butterfly" "fish"
1

TEXTBOX
1006
108
1180
150
Additional features !
17
0.0
1

TEXTBOX
192
394
296
419
Controls
20
0.0
1

SWITCH
1005
206
1146
239
Poison-Apple
Poison-Apple
0
1
-1000

SWITCH
1006
255
1149
288
Golden-Apple
Golden-Apple
0
1
-1000

SWITCH
1006
305
1149
338
No-Walls
No-Walls
1
1
-1000

TEXTBOX
1153
149
1264
196
*Choose Character before setup!
11
0.0
1

@#$#@#$#@
## WHAT IS IT?

A recreation of the game Snake. 

## HOW IT WORKS

Basically works like the original game Snake with a few additions. Collect the apples (red) and avoid the obstacles.

## HOW TO USE IT

Buttons: 
  setup sets up the game 
  go starts running the game. Pressing “P” will trigger go.
* Note: You can activate Poison Apple, Golden Apple, and No Walls in the middle of a game, but they can’t be turned off until the game is over.
  Controls: Press up, left, down, right or use W, A, S, D to change the direction that the snake is moving. 

Sliders: speed changes the speed that your snake is moving.

Monitors: score shows your current score. You get points by eating the apples.

Choosers: Character changes the breed of your snake.

Switches:   
  Poison Apple adds in dangerous items (death).
  Golden Apple adds in golden items (+ 2 points).
  No Walls removes the walls at the start of the game. 

## THINGS TO NOTICE

Snake: The starting turtle at the center of the world. You are controlling this snake. 

Apples: These are the things you are trying to collect in order to increase your score. 

Goldens: These are the same as apples except your score increases by two instead. 

Poisons: These are the apples that you avoid. Consuming one will cause your snake to die and the game will be over. 

Walls: If your snake touches the black border, you die. The No Walls feature can remove these walls and your snake will be able to go in from one side and come out the other.

## THINGS TO TRY

Beat your high score. 
Adjust your speed to challenge yourself. 

## EXTENDING THE MODEL

Make different maps instead of just the normal square to navigate. 
Add in enemies to make the game more challenging.

## NETLOGO FEATURES

We used the let command to make up for the fact that we could not use the if command to detect whether another procedure has occurred. We used to let to create a variable, which we then set true or false to produce a cause and effect procedure. 

## RELATED MODELS

None

## CREDITS AND REFERENCES
The Snake game by Google was a reference for this model.
Link: https://www.google.com/fbx?fbx=snake_arcade 

Rachel Huang and Yuri Wang
Mr. Platek
Introduction to Computer Science MKS21 Period 9
22 January 2022
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

ant
true
0
Polygon -7500403 true true 136 61 129 46 144 30 119 45 124 60 114 82 97 37 132 10 93 36 111 84 127 105 172 105 189 84 208 35 171 11 202 35 204 37 186 82 177 60 180 44 159 32 170 44 165 60
Polygon -7500403 true true 150 95 135 103 139 117 125 149 137 180 135 196 150 204 166 195 161 180 174 150 158 116 164 102
Polygon -7500403 true true 149 186 128 197 114 232 134 270 149 282 166 270 185 232 171 195 149 186
Polygon -7500403 true true 225 66 230 107 159 122 161 127 234 111 236 106
Polygon -7500403 true true 78 58 99 116 139 123 137 128 95 119
Polygon -7500403 true true 48 103 90 147 129 147 130 151 86 151
Polygon -7500403 true true 65 224 92 171 134 160 135 164 95 175
Polygon -7500403 true true 235 222 210 170 163 162 161 166 208 174
Polygon -7500403 true true 249 107 211 147 168 147 168 150 213 150

ant 2
true
0
Polygon -7500403 true true 150 19 120 30 120 45 130 66 144 81 127 96 129 113 144 134 136 185 121 195 114 217 120 255 135 270 165 270 180 255 188 218 181 195 165 184 157 134 170 115 173 95 156 81 171 66 181 42 180 30
Polygon -7500403 true true 150 167 159 185 190 182 225 212 255 257 240 212 200 170 154 172
Polygon -7500403 true true 161 167 201 150 237 149 281 182 245 140 202 137 158 154
Polygon -7500403 true true 155 135 185 120 230 105 275 75 233 115 201 124 155 150
Line -7500403 true 120 36 75 45
Line -7500403 true 75 45 90 15
Line -7500403 true 180 35 225 45
Line -7500403 true 225 45 210 15
Polygon -7500403 true true 145 135 115 120 70 105 25 75 67 115 99 124 145 150
Polygon -7500403 true true 139 167 99 150 63 149 19 182 55 140 98 137 142 154
Polygon -7500403 true true 150 167 141 185 110 182 75 212 45 257 60 212 100 170 146 172

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

fire
false
0
Polygon -7500403 true true 151 286 134 282 103 282 59 248 40 210 32 157 37 108 68 146 71 109 83 72 111 27 127 55 148 11 167 41 180 112 195 57 217 91 226 126 227 203 256 156 256 201 238 263 213 278 183 281
Polygon -955883 true false 126 284 91 251 85 212 91 168 103 132 118 153 125 181 135 141 151 96 185 161 195 203 193 253 164 286
Polygon -2674135 true false 155 284 172 268 172 243 162 224 148 201 130 233 131 260 135 282

fish
true
0
Polygon -1 true false 131 256 87 279 86 285 120 300 150 285 180 300 214 287 212 280 166 255
Polygon -1 true false 195 165 235 181 218 205 210 224 204 254 165 240
Polygon -1 true false 45 225 77 217 103 229 114 214 78 134 60 165
Polygon -7500403 true true 136 270 77 149 81 74 119 20 146 8 160 8 170 13 195 30 210 105 212 149 166 270
Circle -16777216 true false 106 55 30

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

play-button
false
0
Rectangle -7500403 true true 0 60 285 225
Rectangle -1 true false 15 75 270 210
Rectangle -7500403 true true 30 105 45 180
Rectangle -7500403 true true 30 105 75 120
Rectangle -7500403 true true 30 135 75 150
Rectangle -7500403 true true 60 120 75 135
Rectangle -7500403 true true 90 105 105 180
Rectangle -7500403 true true 90 165 135 180
Rectangle -7500403 true true 150 105 165 180
Rectangle -7500403 true true 180 105 195 180
Rectangle -7500403 true true 150 105 195 120
Rectangle -7500403 true true 150 135 195 150
Rectangle -7500403 true true 210 135 255 150
Rectangle -7500403 true true 210 105 225 150
Rectangle -7500403 true true 240 105 255 150
Rectangle -7500403 true true 225 135 240 180

shark
false
0
Polygon -7500403 true true 283 153 288 149 271 146 301 145 300 138 247 119 190 107 104 117 54 133 39 134 10 99 9 112 19 142 9 175 10 185 40 158 69 154 64 164 80 161 86 156 132 160 209 164
Polygon -7500403 true true 199 161 152 166 137 164 169 154
Polygon -7500403 true true 188 108 172 83 160 74 156 76 159 97 153 112
Circle -16777216 true false 256 129 12
Line -16777216 false 222 134 222 150
Line -16777216 false 217 134 217 150
Line -16777216 false 212 134 212 150
Polygon -7500403 true true 78 125 62 118 63 130
Polygon -7500403 true true 121 157 105 161 101 156 106 152

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

snake
true
0
Circle -7500403 true true 15 30 270
Circle -1 true false 189 99 42
Circle -1 true false 69 99 42
Circle -1 true false 90 150 0
Polygon -7500403 true true 120 75 120 75 120 75
Polygon -2064490 true false 128 82 173 82 173 7 148 21 128 7 128 67
Circle -16777216 true false 72 97 36
Circle -16777216 true false 192 98 36

snake-title
false
15
Rectangle -1 true true 0 75 45 90
Rectangle -1 true true 0 75 15 120
Rectangle -1 true true 0 120 45 135
Rectangle -1 true true 0 165 45 180
Rectangle -1 true true 30 120 45 165
Rectangle -1 true true 60 75 75 180
Rectangle -1 true true 90 75 105 180
Rectangle -1 true true 75 75 90 90
Rectangle -1 true true 120 75 135 180
Rectangle -1 true true 150 75 165 180
Rectangle -1 true true 135 120 150 135
Rectangle -1 true true 135 75 150 90
Rectangle -1 true true 180 75 195 180
Rectangle -1 true true 195 105 225 120
Rectangle -1 true true 210 75 225 105
Rectangle -1 true true 195 135 225 150
Rectangle -1 true true 210 150 225 180
Rectangle -1 true true 240 75 255 180
Rectangle -1 true true 240 75 285 90
Rectangle -1 true true 240 165 285 180
Rectangle -1 true true 240 120 285 135

snow
false
0
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

snowball
true
0
Circle -1 true false 0 0 300
Circle -16777216 true false 129 39 42
Circle -16777216 true false 129 129 42
Circle -16777216 true false 129 219 42

snowflake
true
0
Circle -7500403 true true 14 27 258
Rectangle -1 true false 135 30 150 285
Rectangle -1 true false 15 150 270 165
Rectangle -1 true false 150 135 165 150
Rectangle -1 true false 225 60 240 75
Rectangle -1 true false 210 75 225 90
Rectangle -1 true false 195 90 210 105
Rectangle -1 true false 180 105 195 120
Rectangle -1 true false 165 120 180 135
Rectangle -1 true false 150 165 165 180
Rectangle -1 true false 225 240 240 255
Rectangle -1 true false 210 225 225 240
Rectangle -1 true false 195 210 210 225
Rectangle -1 true false 180 195 195 210
Rectangle -1 true false 165 180 180 195
Rectangle -1 true false 120 165 135 180
Rectangle -1 true false 45 240 60 255
Rectangle -1 true false 60 225 75 240
Rectangle -1 true false 75 210 90 225
Rectangle -1 true false 90 195 105 210
Rectangle -1 true false 105 180 120 195
Rectangle -1 true false 120 135 135 150
Rectangle -1 true false 45 60 60 75
Rectangle -1 true false 60 75 75 90
Rectangle -1 true false 75 90 90 105
Rectangle -1 true false 105 120 120 135
Rectangle -1 true false 90 105 105 120

snowman
true
0
Circle -1 true false 0 0 300
Circle -7500403 true true 84 158 42
Circle -7500403 true true 174 159 42
Circle -16777216 true false 59 85 30
Circle -16777216 true false 90 55 30
Circle -16777216 true false 136 38 30
Circle -16777216 true false 180 55 30
Circle -16777216 true false 215 89 30
Polygon -955883 true false 139 158 141 100 230 136 139 157

square
false
0
Rectangle -7500403 true true 30 30 270 270

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
