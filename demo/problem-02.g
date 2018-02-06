Include = 'problem-shared.g'

body world { type=ST_marker size=[.2 .2 .2 .2] }

### hook

body nostick  {}
joint (table1 nostick) { from=<T t(0 0 .02) t(-.2 -.7 .02)> type=JT_rigid}
shape stick(nostick) { type=9 size=[.8 .025 .04 .01] color=[.6 .3 0] contact, logical={ object } }
shape stickTip (nostick) { rel=<T t(.4 .1 0) d(90 0 0 1)> type=9 size=[.2 .026 .04 0.01] color=[.6 .3 0], logical={ object, pusher } }

### box

body box { type=9 size=[.3 .3 .4 .01] color=[.6 .3 0] contact, logical={ table } }
joint (table1 box) { from=<T t(0 0 .02) t(.3 0 .2)> type=JT_rigid }

### ball

body redBall { size=[.06 .06 .06 .02] color=[1 0 0] type=ST_ssBox contact, logical={ object } }
joint (box redBall) { from=<T t(0 0 .2) t(0 0 .03)> type=JT_rigid }

