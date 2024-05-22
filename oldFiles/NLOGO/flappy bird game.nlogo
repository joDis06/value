globals [ score ]

breed [ birds bird ]
breed [ pipes pipe ]
breed [ squares square ]
breed [ circles circle ]

;; Observer
;; Clears everything and sets up the map.
;; Author(s): Irene & Yile
to setup
  ca
  set-default-shape birds "bird"
  map-setup
  import-pcolors-rgb "flappybb.jpg"
  reset-ticks
end

;; Observer
;; Alternate nighttime version of map.
;; Author(s): Yile
to nightmode
  ca
  set-default-shape birds "bird"
  map-setup
  import-pcolors-rgb "flappynight.jpg"
  reset-ticks
end

;; Observer
;; This procedure sets the map up for play by setting the obstacles and flappybird, as well as circles used for scoring.
;; Author(s): Irene
to map-setup
  obstacle-setup
  create-birds 1
   [
    set shape "bird"
    setxy -45 0
    set size 25
  ]
  create-circles 1
   [
    set shape "circle"
    setxy -4 -27
    set color white
    set size 5
  ]
  create-circles 1
   [
    set shape "circle"
    setxy 62 35
    set color white
    set size 5
  ]
  create-circles 1
   [
    set shape "circle"
    setxy -69 6
    set color white
    set size 5
  ]
end

;; Turtles
;; This procedure puts pressure on the Turtles by continuously making the flappybird go down.
;; Author(s): Yile & Irene & Calvin
to gravity
  ask birds
  [
    set heading 180
    fd 0.05
  ]
end

;; Turtles
;; Makes the pipes move from the right to left, makes the map move. The world wraps so the pipes come back. Also adds a circle that helps count score.
;; Author(s): Yile & Irene
to map-move
 ask squares
  [
    set heading 270
    fd 0.05
  ]
  ask circles
  [
    set heading 270
    fd 0.05
  ]
end

;; Turtles
;; This helps the flappybird push against gravity. Allows the player clicks their mouse to make the flappybird go up (fly).
;; Author(s): Yile & Irene
to move-bird
  if mouse-down?
  [
    set heading 0
    ask birds
    [ fd 0.2 ]
  ]
end

;; Observer
;; System game over message
;; Author(s): Irene
to lose
    ifelse (score < 1) [ user-message one-of
    ["You couldn't even get one? Try again."
      "You almost got a point, go again?"
      "Nice try! You'll get 'em next time :)"
      "Is it the game? Or is it you? But it's possible, so try again!"] ]
    [user-message "Game Over!"]
  if (score > 5) [user-message one-of
    ["Hey, you're kinda good at this game! Ever consider going pro?"
      "Sheeesh, you're kinda cracked!"
      "Wow, that's a nice score you reached!"
      "Not too bad! Keep up the good work :D"
      "You got a pretty good score, but I think you can get even higher, right?"
      "Game Over!"]]

end

;; Turtles
;; This is what detects if the bird hits the pipe or the ground. If it does, you lose.
;; Author(s): Mr. Platek, Irene, Calvin
to lose-condition
  ask birds [ if (pycor < -75)
  [ lose ] ]
  ask squares
  [if (any? birds in-radius 13) [ lose ] ]
end

;; Turtles
;; This procedure increases the score count by 1 everytime you pass a pipe safely
;; Author(s): Irene
to count-score
  ask circles [if (any? birds in-radius 5)
    [set score (score + 0.01) ]]
end

;; Turtles
;; This procedure begins your game.
;; Author(s): Yile & Irene
to start
  gravity
  map-move
  move-bird
  lose-condition
  count-score
end


;; Turtles
;; Sets up the obstacles (pipes) using individual squares (sets the shape, coordinates, and size)
;; Author(s): Irene
to obstacle-setup
; Pipe 1
  create-squares 1
  [ set shape "square" setxy 125 -75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 -75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 -63 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 -63 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 -55 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 -55 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 -47 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 -47 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 -39 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 -39 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 -31 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 -31 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 -24 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 -24 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 129 -24 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 115 -24 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 67 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 67 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 59 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 59 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 51 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 51 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 43 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 43 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 35 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 35 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 125 31 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 119 31 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 129 31 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 115 31 set size 40 ]
; Pipe 2
  create-squares 1
  [ set shape "square" setxy 0 -75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 -75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 -63 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 -63 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 4 -57 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -10 -57 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 -57 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 -57 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 67 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 67 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 59 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 59 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 51 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 51 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 43 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 43 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 35 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 35 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 31 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 23 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 23 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 15 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 15 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 7 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 7 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 -1 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 0 -1 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -10 -2 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 4 -2 set size 40 ]
  create-squares 1
  [ set shape "square" setxy -6 -2 set size 40 ]
; Pipe 3
  create-squares 1
  [ set shape "square" setxy 59 -75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 -63 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -63 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 -55 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -55 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 -47 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -47 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 -39 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -39 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 -31 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -31 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 -24 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -24 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 -16 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -16 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 -8 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 -8 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 0 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 0 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 6 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 6 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 55 6 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 69 6 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 75 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 67 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 67 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 59 61 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 65 61 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 55 61 set size 40 ]
  create-squares 1
  [ set shape "square" setxy 69 61 set size 40 ]
end
@#$#@#$#@
GRAPHICS-WINDOW
180
21
765
516
-1
-1
3.021
1
10
1
1
1
0
1
0
1
-95
95
-80
80
0
0
1
ticks
30.0

BUTTON
48
69
111
102
NIL
setup
NIL
1
T
OBSERVER
NIL
R
NIL
NIL
1

BUTTON
49
174
124
214
NIL
start
T
1
T
TURTLE
NIL
S
NIL
NIL
1

MONITOR
183
23
240
68
NIL
score
0
1
11

BUTTON
48
117
129
151
NIL
nightmode
NIL
1
T
OBSERVER
NIL
N
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?
Flappy Bird is a game in which you control a bird with the objective to score as many points as possible. You get a point for every green pipe you pass through. If you touch the ground or a green pipe, you lose the game (game over).   

## HOW IT WORKS
We started off with gravity, that always puts pressure on the flappy bird, so if you’re not clicking the bird will fall down. With the click of the mouse, you activate the move-bird function we built that makes the bird go up with every click. To create the moving pipes, we asked the pipes to move forward so it gives the illusion of the real game. We turned on the warp so the pipes can come back infinitely. We made the pipes out of many plotted small green squares (turtles). To make the lose condition, used in-radius, meaning if the bird is inside the radius, or touches the squares, or if you touch the bottom of the map, a game over message will pop up. To count score, we created circles in the middle of the pipe area and when the bird is in the radius of those circles, it would increase the value of the score, meaning passing a pipe safely would increase score by 1. 

## HOW TO USE IT
To play flappy bird, all you need to do is click the setup button to load the map, and then click start (or press the S key) to begin playing. Click your mouse button on the screen to make the flappybird fly. When you the game over message pops up, you click halt, setup, and start to refresh and play another game. You can see your score in the top right of the game screen.

## THINGS TO NOTICE
When you die there is a different user message saying game over in a different way (only when you get a score less than 1 or greater than 5). 

## THINGS TO TRY
You can click on the nightmode button to change the background from day to night.

## EXTENDING THE MODEL
We could’ve added different skins for the flappy bird and the pipes to our game model. We also could also add a highscore tracker, so you can be aware of what you need to beat to get a new highscore! We can also add accelerated speed to make the game more challenging.

## NETLOGO FEATURES
For the background we drew our own in, saved it as .jpg file and uploaded that to netlogo using import-pcolors-rgb, so to run our flappy bird code on your computer you also are required to download the backgrounds to load it properly. An interesting code we used was the in-radius code to help our lose condition. We figured out how to make the flappy bird game end when the flappy bird "touches the pipe" when we used small little boxes with their individual radii to create the pipe, so we could use that command. The bird was actually being detected within the certain radius of the squares.

## RELATED MODELS
Frogger model found in model library.

## CREDITS AND REFERENCES
Credits to the original flappy bird game made by Dong Nguyen under his dev company .Gears.
Credits to code from the Frogger model in Netlogo for inspiration.
Yile Tong and Irene Zou Period 9
Received help from Mr. Platek for idea of using in-radius for the lose function, a senpai in the CS Dojo (didn't get his name) for helping with lose function and figuring out that the in-radius would need smaller turtles (the squares) to work, and Calvin (junior) for part of lose function as well as for heading in the first three turtle functions. 
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

bird
false
0
Circle -1184463 true false 59 74 152
Circle -1184463 true false 119 74 152
Rectangle -1184463 true false 120 75 210 225
Rectangle -955883 true false 210 135 285 165
Line -16777216 false 210 150 285 150
Circle -16777216 false false 180 105 0
Circle -1 true false 180 75 60
Polygon -16777216 true false 225 120 240 105 225 90 210 105 225 120
Polygon -16777216 false false 135 75 165 75 210 75 225 75 240 90 255 105 270 135 285 135 210 135 210 165 270 165 285 165 285 135 270 135 210 135 210 165 270 165 255 195 255 195 240 210 240 210 210 225 195 225 180 225 165 225 150 225 120 225 90 210 90 210 75 195 60 165 60 150 60 135 75 105 90 90 120 75 135 75
Line -16777216 false 105 195 120 135
Line -16777216 false 165 180 105 195
Circle -16777216 false false 176 71 67

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

cloud
false
0
Circle -1 true false 13 118 94
Circle -1 true false 86 101 127
Circle -1 true false 51 51 108
Circle -1 true false 118 43 95
Circle -1 true false 158 68 134

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

pipe
false
0
Rectangle -10899396 false false 135 60 165 75
Rectangle -10899396 false false 135 225 165 240

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
Rectangle -13840069 true false 105 105 195 195

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
