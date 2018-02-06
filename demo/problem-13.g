Include = 'problem-shared.g'

### ball

body redBall { type=ST_ssBox size=[.06 .06 .06 .02] color=[1 0 0] contact, logical={ object } }
joint (table1 redBall) { from=<T t(0 0 .02) t(-.2 0 .03)> type=JT_rigid }

### block

body block { type=ST_ssBox size=[.05 .5 .5 .01] color=[.6 .3 0] contact, logical={ object } }
joint (table1 block) { from=<T t(0 0 .02) t(-.4 0 .25)> type=JT_rigid}
shape (block) { type=ST_ssBox rel=<T t(0 0 -.225)> size=[.2 .5 .05 .01] color=[.6 .3 0] contact }
