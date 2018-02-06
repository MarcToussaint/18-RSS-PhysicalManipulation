Include = 'problem-shared.g'

### ball

body redBall { size=[.06 .06 .06 .02] color=[1 0 0] type=ST_ssBox contact, logical={ object } }
joint (table1 redBall) { from=<T t(0 0 .02) t(.3 -.0 .03)> type=JT_rigid }

### tools

body stick1 {}
joint (table1 stick1) { from=<T t(0 0 .02) t(-.3 -.7 .02)> type=JT_rigid}
shape stick(stick1) { type=9 size=[.8 .025 .04 .01] color=[.6 .3 0] contact, logical={ object, pusher } }

### paper

body paper { type=9 size=[1. .2 .004 .002] color=[.6 .3 0] contact, logical={ object, table } }
joint (table1 paper) { from=<T t(0 0 .02) t(-.2 .7 .0)> type=JT_rigid}
shape paperHandle(paper) { type=9 size=[.05 .05 .2 .02] color=[.6 .3 0] rel=<T t(-.4 0 .1)> contact, logical={ object } }

