Include = 'problem-shared.g'

#Edit table1{ X=<T t(1. 0 .7)>, size=[2.4 2. .04 .02] }

### ball

body redBall { size=[.06 .06 .06 .02] color=[1 0 0] type=ST_ssBox contact, logical={ object } }
joint (table1 redBall) { from=<T t(0 0 .02) t(.6 0. .03)> type=JT_rigid }

### hook

body nostick { type=5 size=[.2 .2 .2] }
joint (table1 nostick) { from=<T t(0 0 .02) t(.2 -.0 .02) d(-90 0 0 1)> type=JT_rigid }
shape stick(nostick) { type=ST_ssBox size=[.8 .025 .04 .01] color=[.6 .3 0] contact, logical={ object } }
shape stickTip (nostick) { rel=<T t(.4 .1 0) d(90 0 0 1)> type=ST_ssBox size=[.2 .026 .04 0.01] color=[.6 .3 0], logical={ object, pusher } }

### hook

body nostick2 { type=5 size=[.2 .2 .2] }
joint (table1 nostick2) { from=<T t(0 0 .02) t(-.3 -.6 .02)> type=JT_rigid }
shape stick2(nostick2) { type=ST_ssBox size=[.4 .025 .04 .01] color=[.6 .3 0] contact, logical={ object } }
shape stickTip2 (nostick2) { rel=<T t(.2 .1 0) d(90 0 0 1)> type=ST_ssBox size=[.2 .026 .04 0.01] color=[.6 .3 0], logical={ object, pusher } }
