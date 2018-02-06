Include = 'problem-shared.g'

#Edit table1{ X=<T t(1. 0 .7)>, size=[2.4 2. .04 .02] }

### ball

frame blueBall (table1) { size=[.1 .1 .1 .05] color=[.2 .2 .8] shape=ST_ssBox contact
 from=<T t(0 0 .02) t(-.1 .5 .05)> joint=JT_rigid , logical={ object } }

### tools

frame box (table1) {
 joint=JT_rigid from=<T t(0 0 .02) t(-.5 -.5 .05)>
     shape=ST_ssBox size=[.1 .1 .1 .02] color=[.6 .3 0] contact, logical={ object } }


### bucket

frame bucket (table1) {
    shape=ST_ssBox size=[.3 .3 .04 .01] color=[.3 .6 0] contact,
    joint=JT_rigid from=<T t(0 0 .02) t(.5 -.8 -.0195)>
    , logical={ table }
}
