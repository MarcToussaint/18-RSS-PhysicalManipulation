#include <Gui/opengl.h>
#include <LGP/optLGP.h>

//======================================================================

void illustrate(){
  OpenGL gl("Red Ball Scenes", 1200, 800);

  uint N=6;
  mlr::Array<mlr::KinematicWorld> K(N);
  for(uint i=0;i<N;i++){
    if(!i) K(i).init(STRING("problem-0"<<i+1<<".g"));
    else K(i).init(STRING("problem-0"<<i+2<<".g"));
    K(i).orsDrawMarkers=false;
    gl.addSubView(i, glStandardScene, NULL);
    gl.addSubView(i, K(i));
    gl.views(i).camera.setDefault();
    gl.views(i).text <<"problem " <<i+1;
  }
  gl.setSubViewTiles(3,2);

  gl.watch();
}

//======================================================================

void solve(uint i){
  mlr::KinematicWorld K(STRING("problem-0"<<i<<".g"));
  K.optimizeTree();
  FOL_World L(FILE("fol.g"));
  initFolStateFromKin(L, K);

  OptLGP lgp(K, L);
//  lgp.buildTree(2);  mlr::wait();
  lgp.run();
}

//======================================================================

void buildTree(uint i){
  mlr::KinematicWorld K(STRING("problem-0"<<i<<".g"));
  K.optimizeTree();
  FOL_World L(FILE("fol.g"));
  initFolStateFromKin(L, K);

  OptLGP lgp(K, L);
  lgp.buildTree(4);
  lgp.writeNodeList();
}

//======================================================================

//this is for playing around, testing, computing specific skeletons
void solveFixed(uint i){
  mlr::KinematicWorld K(STRING("problem-0"<<i<<".g"));
  K.optimizeTree();
  FOL_World L(FILE("fol.g"));
  initFolStateFromKin(L, K);
//  cout <<"INITIAL LOGIC STATE = " <<*L.start_state <<endl;

  OptLGP lgp(K, L);

  //interactively explore the manipulation tree
  //  lgp.player();

  //check finding symbolic terminals
  //  lgp.getSymbolicSolutions(3);

  //compute one specific skeleton:
  //  lgp.optFixedSequence("(grasp baxterR stick) (push stickTip redBall table1) (grasp baxterL redBall) ", 3);

  //compute multiple skeletons, rank, and display
  if(i==1) lgp.optMultiple({
                    "(grasp baxterR stick) (handover baxterR stick baxterL) (hitSlide stickTip redBall table1) (graspSlide baxterR redBall table1) ",
                    "(grasp baxterR stick) (handover baxterR stick baxterL) (push stickTip redBall table1) (grasp baxterR redBall) ",
                    "(grasp baxterR stick) (hitSlide stickTip redBall table1) (grasp baxterL redBall) ",
                    "(grasp baxterR stick) (push stickTip redBall table1) (grasp baxterL redBall) ",
                    "(graspSlide baxterR stick table1) (hitSlide stickTip redBall table1) (grasp baxterL redBall) ",
                    "(grasp baxterR stick) (hitSlide stickTip redBall table1) (graspSlide baxterL redBall table1) ",
                  });

  if(i==4) lgp.optMultiple({
                    "(grasp baxterR stick1) (handover baxterR stick1 baxterL) (hitSlide stick1 redBall table1) (grasp baxterR redBall)",
                    "(graspSlide baxterR stick1 table1) (push stick1 redBall table1) (grasp baxterL redBall)",
                    "(grasp baxterR stick1) (push stick1 redBall table1) (grasp baxterL redBall)",
                    "(grasp baxterR stick1) (push stick1 redBall table1) (hitSlide stick1 redBall table1) (grasp baxterL redBall)",
                    "(grasp baxterR stick1) (push stick1 redBall table1) (place3 redBall table1) (grasp baxterL redBall)",
//                    "(grasp baxterR stick1) (handover baxterR stick1 baxterL) (push stick1 redBall table1) (grasp baxterR redBall)"
                    "(grasp baxterR stick1) (push stick1 redBall table1) (place baxterR stick1 table1) (grasp baxterL redBall)"
                  });

  if(i==5) lgp.optMultiple({
                    "(grasp baxterL blueBall) (grasp baxterR stick) (throw baxterL blueBall) (hit stick blueBall) (place3 blueBall bucket) ",
                    "(grasp baxterR stick) (handover baxterR stick baxterL) (hitSlide stick blueBall table1) (place3 blueBall bucket) ",
                    "(grasp baxterR stick) (throw baxterR stick) (hitSlideAndSit stick blueBall table1) (place3 blueBall bucket) ",
                    "(grasp baxterL blueBall) (throw baxterL blueBall) (place3 blueBall bucket) ",
                    "(grasp baxterL stick) (hit stick blueBall) (place3 blueBall bucket) "
                  });

  mlr::wait();  lgp.renderToVideo();

//  lgp.verbose=2;
//  lgp.run();
//  lgp.renderToVideo();
}

//======================================================================

void example(){
  uint i=1;
  mlr::KinematicWorld K(STRING("problem-0"<<i<<".g"));
  K.optimizeTree();
  FOL_World L(FILE("fol.g"));
  initFolStateFromKin(L, K);

  OptLGP lgp(K, L);
//  lgp.player(); //use this for interactive command-line
  //set LGP/displayTree = 1 in MT.cfg to see the decision tree
  lgp.initDisplay();

  lgp.root->optLevel(1);
  lgp.root->optLevel(2);
  lgp.root->optLevel(3);
  lgp.root->expand();

  lgp.displayFocus = lgp.root;
  lgp.updateDisplay();

  MNode *n = lgp.root->children.last();
  n->optLevel(1);
  n->optLevel(2);
  n->optLevel(3);
  n->optLevel(1);
  n->expand();

  lgp.displayFocus = n;
  lgp.updateDisplay();

  mlr::wait();
}

//======================================================================

int main(int argc,char **argv){
  mlr::initCmdLine(argc, argv);
  rnd.clockSeed();

  //use illustrate to only display the problems
  //  illustrate(); return 0;

  //solve a problem
  if(mlr::checkParameter<uint>("problem")){
    //    buildTree(mlr::getParameter<uint>("problem"));
    solve(mlr::getParameter<uint>("problem"));
    return 0;
  }

  //compute some specific solutions
  solveFixed(1);

  //low-level example of using the LGP class
  //example();

  return 0;
}
