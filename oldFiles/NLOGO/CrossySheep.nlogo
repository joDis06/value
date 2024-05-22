breed [ sheeps sheep]
breed [ trains train ]
sheeps-own [ steps score alive? mode? ]
globals [ level ] ;; **** globals borrowed from frogger****

;; Observer
to setup
  ca
  resize-world -15 15 -10 10
  set-patch-size 20
  set level 1
  board-setup
  sheep-setup
  track-setup
end

;; observer
;; this sets the road and the start and end grass patches
to board-setup
  ask patches with [pycor < -7 ] [set pcolor 38]
  ask patches with [pycor > 7 ] [set pcolor 66]
end

;; Observer
;; this spawns the sheep player
to sheep-setup
ask patch 0 -9
  [sprout 1
  [
    set breed sheeps
    set shape "sheep"
    set size 1.5
    set color white
    set alive? true
    set mode? false
  ]]
end

;;observer
;;this creates the tracks where the trains will ride on
; the funky math calculates how many tracks there will be, so that the street will be filled by level 5
to track-setup
  ask n-of ((level * (level + 1)) / 2 ) patches with
  [
    pycor >= -6
    and pycor <= 6
    and (not (pcolor = gray))
  ]
  [
    set pcolor gray
    let rowcor pycor
    ask patches with
    [
      pycor = rowcor
    ]
    [set pcolor gray]
  ]
end

;;observer
;; 4 train procedures in one! wowie! for neatness purposes
to trains:D
  train-setup
  move-train
  train-leave
  train-crash
end

;; observer
;; this occasionally spawns trains, the rate increases with each level for difficulty
to train-setup
  every (0.9 / level)
  [
   ask one-of patches with [pcolor = gray and pxcor = -15]
   [ sprout 1
  [
    set breed trains
    set shape "train passenger engine"
    set size 4
    set color blue
  ]]]
end

;; observer
;; Moves the trains
to move-train
  every 0.055
  [
    ask trains
    [set heading 90
      fd 1]
  ]
end

;;observer
;; this kills trains at the right side of the board
to train-leave
  ask trains with [xcor = 15] [die]
end

;; Observer
;; Raymond
;; this kills sheep when they meet a train
to train-crash
  ask trains with [any? sheeps-on patch pxcor pycor]
  [
    ask sheeps-on patch pxcor pycor [set alive? false]
  ]
end

;; observer
;; driver function ; makes game go yay
to go
  win
  lose
  new-level
  trains:D
  huh?
end

;;****user-message borrowed from Frogger model****
; sends a message to the player depending on if they won or lost
;;observer
to lose
  if (any? sheeps with [alive? = false])
  [
    user-message (word "GAME OVER!\nTotal Score: " ([score] of sheep 0) " ")
    ask sheeps [die]
    setup
  ]
end

;;observer
;; Raymond and Mishel
;; Sends a message to the user that they have completed the game
to win
  if (level = 5) and (any? sheeps-on patches with [pycor = 9])
  [
    user-message (word "YOU WON!\nTotal Score: " ([score] of sheep 0) " ")
    ifelse "continue" = user-one-of "Keep going?"
    ["continue" "restart"]
    [new-level]
    [setup]
  ]
end

;; Observer
;; Mishel
;; Creates a new level when the level has been completed
to new-level
  if (any? sheeps with [ ycor = 9 ])
  [
    cp
    ask trains [ die ]
    ask sheeps [ set ycor -9 ]
    set level ( level + 1 )
    new-board
  ]
end


;; Observer
;; Mishel
;; Adds tracks
to new-board
  ifelse (not (level >= 5))
  [
    track-setup
    ask patches with [ pycor < -7 ] [ set pcolor 38 ]
    ask patches with [ pycor > 7 ] [ set pcolor 66 ]
  ]
  [
    ask patches with [ pycor >= -6 and pycor <= 6 ] [ set pcolor gray ]
    ask patches with [ pycor < -7 ] [ set pcolor 38 ]
    ask patches with [ pycor > 7 ] [ set pcolor 66 ]
  ]
end

;;movement procedures below enables sheep to move in all directions across the screen
;; **** credits to my (Mishel's) brother (Mikiel) for helping create the code for the score count code****
; his code: if (score > max_score) then (max score = score) ; reworked into netlogo lang as best I could
;; Mishel and Brother
;;observer
to move-sheep-up
    every 0.1
  [
      ask sheep 0
    [
      set heading 360
      fd 1
      set steps (steps + 1)
      set score (max list ([score] of sheep 0) ([steps] of sheep 0))
    ]
  ]
end

;;Observer
;; Moves sheeps down
to move-sheep-down
  every 0.1
    [
      ask sheep 0
      [
        set heading 180
        fd 1
        set score (max list ([score] of sheep 0) ([steps] of sheep 0))
        set steps (steps - 1)
      ]
    ]
end

;;Observer
;; Moves sheep left
to move-sheep-left
  every 0.1
    [
      ask sheep 0
      [
        set heading 270
        fd 1
      ]
    ]
end

;;Observer
;; Moves sheep right
to move-sheep-right
  every 0.1
    [
      ask sheep 0
      [
        set heading 90
        fd 1
      ]
    ]
end

;; FUN EASTER EGG STUFF BECAUSE WHY NOT - Mishel ¯\_(ツ)_/
;; please don't look the code here is ugly

;; observer
;; allows the sheep to enter the haven
to huh?
  secret!
  jeb_mode_activate
  jeb_mode
end

;; observer
;; brings you to the haven
to secret!
  if (any? sheeps-on patches with [(pcolor = gray) and (pxcor = -15)])
    [
      ask trains [ die ]
      ask sheep 0 [ set xcor 15 ]
      haven-board
      haven-sheep
      user-message " ah, so you've arrived to my haven, little lamb "
      user-message " it was brave of you to come here despite those treacherous trains "
      user-message " come, little lamb, and I will bestow upon you a gift "
    ]
end

;; observer
;; sets up the haven
to haven-board
  ask patches with [ pycor < -7 ] [ set pcolor 66 ]
  ask patches with [ pycor > 7 ] [ set pcolor 66 ]
  ask patches with [ pycor = 7 ] [ set pcolor 16 ]
  ask patches with [ pycor = -6 ] [ set pcolor 26 ]
  ask patches with [ pycor = -5 ] [ set pcolor 16 ]
  ask patches with [ pycor = -4 ] [ set pcolor 136 ]
  ask patches with [ pycor = -3 ] [ set pcolor 126 ]
  ask patches with [ pycor = -2 ] [ set pcolor 116 ]
  ask patches with [ pycor = -1 ] [ set pcolor 106 ]
  ask patches with [ pycor = 0 ] [ set pcolor 96 ]
  ask patches with [ pycor = 1 ] [ set pcolor 86 ]
  ask patches with [ pycor = 2 ] [ set pcolor 76 ]
  ask patches with [ pycor = 3 ] [ set pcolor 66 ]
  ask patches with [ pycor = 4 ] [ set pcolor 56 ]
  ask patches with [ pycor = 5 ] [ set pcolor 46 ]
  ask patches with [ pycor = 6 ] [ set pcolor 26 ]
  ask patches with [ pycor = -7 ] [ set pcolor 46 ]
  ask patches with [ pycor = -9 ] [ set pcolor gray ]
  ask patches with
  [
    ((pycor >= -1) and (pycor <= 1))
    and ((pxcor >= -1) and (pxcor <= 1))
  ]
  [ set pcolor white ]
  ask patch 0 0 [set pcolor 9]
end

;; observer
;; creates the haven-sheep god figure that gives you the magic of frienship
to haven-sheep
  crt 1
  [
    set breed sheeps
    set shape "sheep"
    set color black
    set size 1.5
    set heading 0
  ]
end

;; observer
;; initiates the gay agenda *cough* activates the colour shifting ability
to jeb_mode_activate
  if any? sheeps-on patches with [ pcolor = white ]
  [
    ask sheep 0
    [
      set color 5
      set mode? true
      ask sheeps with [ color = black ] [ die ]
  ]]
end


to jeb_mode
  if ([mode?] of sheep 0) = true
  [every 0.25
    [ask sheeps
      [
        set color (color + 10)
  ]]]
end




@#$#@#$#@
GRAPHICS-WINDOW
10
94
638
523
-1
-1
20.0
1
10
1
1
1
0
0
0
1
-15
15
-10
10
0
0
1
ticks
30.0

BUTTON
20
24
113
71
NIL
setup
NIL
1
T
OBSERVER
NIL
1
NIL
NIL
1

BUTTON
734
244
802
277
Up
move-sheep-up
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
735
280
806
313
Down
move-sheep-down
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
669
280
732
313
Left
move-sheep-left
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
807
279
876
312
Right
move-sheep-right
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
139
25
224
72
play
go
T
1
T
OBSERVER
NIL
2
NIL
NIL
1

MONITOR
302
26
359
71
score
max list ([score] of sheep 0) ([steps] of sheep 0)
17
1
11

MONITOR
372
27
422
72
NIL
level
17
1
11

BUTTON
741
361
810
394
Up
move-sheep-up
NIL
1
T
OBSERVER
NIL
I
NIL
NIL
1

BUTTON
741
396
810
429
Down
move-sheep-down
NIL
1
T
OBSERVER
NIL
K
NIL
NIL
1

BUTTON
672
397
739
430
left
move-sheep-left
NIL
1
T
OBSERVER
NIL
J
NIL
NIL
1

BUTTON
813
396
880
429
Right
move-sheep-right
NIL
1
T
OBSERVER
NIL
L
NIL
NIL
1

TEXTBOX
769
331
790
349
OR
11
0.0
1

TEXTBOX
670
208
820
226
CONTROLS:
11
0.0
1

@#$#@#$#@
## WHAT IS IT?

It is a game based off of Crossy Road.

## HOW IT WORKS

You can move in one of four directions: up, down, left or right.  The goal is to make it across the road as many times as you can without being hit by a train.

## HOW TO USE IT

You can move your sheep using w or i for up, s or k for down, a or j for left, and d or l for right.

## THINGS TO NOTICE

Each round, or each time you make it fully across, more trains will appear.

## THINGS TO TRY

Try to beat your score! You can continue the game for as long as you want to.
You can also try to find a secret place, hidden at the origin of danger

## EXTENDING THE MODEL

Add more and different obstacles.  You could also add another hazard, like the river in Frogger.

## NETLOGO FEATURES

The user messages are used to tell the user when they have lost or won.

## RELATED MODELS

Frogger.

## CREDITS AND REFERENCES

;; **** credits to my (Mishel's) brother (Mikiel) for helping create the code for the score count code****
; his code: if (score > max_score) then (max score = score) ; reworked into netlogo lang as best I could

*** globals borrowed from Frogger****

;;****user-message borrowed from Frogger model****
; sends a message to the player depending on if they won or lost

Mishel Gica, Sabrina Lin, Raymond Jung, Juliet Burguieres
Period 9

If author of the procedure is unnamed, it was written as a group effort in class
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

pacman
true
0
Circle -1184463 true false 65 65 170
Polygon -16777216 true false 225 105 150 150 225 210 255 135

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
Circle -1 true true 203 35 88
Circle -1 true true 70 35 162
Circle -1 true true 150 75 120
Polygon -7500403 true false 218 90 240 135 255 135 278 90
Circle -7500403 true false 214 42 67
Rectangle -1 true true 164 193 179 268
Polygon -1 true true 45 255 30 255 30 210 15 165 45 180
Circle -1 true true 3 53 150
Rectangle -1 true true 65 191 80 266
Polygon -1 true true 195 255 210 255 210 210 240 180 195 180
Polygon -7500403 true false 276 55 285 75 302 69 294 53
Polygon -7500403 true false 219 55 210 75 193 69 201 53

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

train passenger engine
false
0
Rectangle -7500403 true true 0 180 300 195
Polygon -7500403 true true 283 161 274 128 255 114 231 105 165 105 15 105 15 150 15 195 15 210 285 210
Circle -16777216 true false 17 195 30
Circle -16777216 true false 50 195 30
Circle -16777216 true false 220 195 30
Circle -16777216 true false 253 195 30
Rectangle -16777216 false false 0 195 300 180
Rectangle -1 true false 11 111 18 118
Rectangle -1 true false 270 129 277 136
Rectangle -16777216 true false 91 195 210 210
Rectangle -16777216 true false 1 180 10 195
Line -16777216 false 290 150 291 182
Rectangle -16777216 true false 165 90 195 90
Rectangle -16777216 true false 290 180 299 195
Polygon -13345367 true false 285 180 267 158 239 135 180 120 15 120 16 113 180 113 240 120 270 135 282 154
Polygon -2674135 true false 284 179 267 160 239 139 180 127 15 127 16 120 180 120 240 127 270 142 282 161
Rectangle -16777216 true false 210 115 254 135
Line -7500403 true 225 105 225 150
Line -7500403 true 240 105 240 150

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
