Include = 'problem-shared.g'

### ball

body redBall { size=[.06 .06 .06 .02] color=[1 0 0] type=ST_ssBox contact, logical={ object } }
joint (table1 redBall) { from=<T t(0 0 .02) t(.3 -.0 .03)> type=JT_rigid }

### tools

body stick1 { type=9 size=[.8 .025 .04 .01] color=[.6 .3 0] contact, logical={ object, pusher } }
joint (table1 stick1) { from=<T t(0 0 .02) t(-.2 -.7 .02)> type=JT_rigid}

### wall

body wall1 { type=9 size=[2. .4 .05 .01] color=[.6 .3 0] contact, logical={ wall, table } }
joint (table1 wall1) { from=<T t(0 0 .02) t(0 .9 .2) d(90 1 0 0)> type=JT_rigid}
shape (wall1) { type=9 size=[2. .2 .05 .01] color=[.6 .3 0] contact rel=<T d(-90 1 0 0) t(0 .1 -.175)> }

