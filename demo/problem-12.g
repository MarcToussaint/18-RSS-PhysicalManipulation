Include = 'problem-shared.g'

### ball

body redBall { size=[.06 .06 .06 .02] color=[1 0 0] type=ST_ssBox contact, logical={ object } }
joint (table1 redBall) { from=<T t(0 0 .02)> to=<T t(.3 .5 .03)> type=JT_rigid }

### tools

body stick1 { type=9 size=[.8 .025 .04 .01] color=[.6 .3 0] contact, logical={ object, pusher } }
joint (table1 stick1) { from=<T t(0 0 .02) t(-.2 -.7 .02)> type=JT_rigid}

#body stick2 {}
#joint (table1 stick2) { from=<T t(0 0 .02)> to=<T t(-.2 -1. .02)> type=JT_rigid}
#shape (stick2) { type=9 size=[.8 .025 .04 .01] color=[.6 .3 0] contact, logical={ object, pusher } }
