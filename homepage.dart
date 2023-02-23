import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mario/pages/bariar.dart';
import 'package:mario/pages/bird.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double birdy = 0;
  double time = 0 ;
  double height=0;
  double inatiheight =0;
  double barixone =0;
  double barixtwo =1;
  bool startgame = false;
  void jump(){
    inatiheight = birdy;
    setState(() {
      time = 0;
       inatiheight = birdy;
    });
   
  }
  void gamestart(){
    startgame = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) { 
      time +=0.05;
      height=-4.9*time*time+2.8*time;
      setState(() {
        birdy = inatiheight -height;
        barixone -= 0.05;
        barixtwo -=0.05;
    });
    if(birdy>1){
      timer.cancel();
      startgame = false;
    }
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          //div in two part
          Expanded(
            flex: 2,
          
            child: Stack(
              children: [
                GestureDetector (
              onTap: (){
                if(startgame){
                  jump();
                }
                else{
                  gamestart();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(0,birdy),
              color: Colors.blue,
              duration: const Duration(milliseconds: 0),
              child:  const Mybird(),
                      ),
            ),
            Container(
              alignment: const Alignment(0,-0.3),
              child: startgame?
              const Text(""):
              const Text("Tap to play",style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),),
            ),
           AnimatedContainer(
             alignment:  Alignment(barixone,1),
             duration: const Duration(milliseconds: 0),
             child:  Mybariar(
              size: 150.0,
            ),
             ),
              AnimatedContainer(
             alignment:  Alignment(barixone,-1),
             duration: const Duration(milliseconds: 0),
             child:  Mybariar(
              size: 180.0,
            ),
             ),
              AnimatedContainer(
             alignment: Alignment(barixtwo,-1),
             duration: Duration(milliseconds: 0),
             child:  Mybariar(
              size: 200.0,
            ),
             )
             
              ],
            )
          ),
          Container(height: 15,
          color: Colors.green,),
          Expanded(
            
            child: Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("SCORE",style: TextStyle(
                      color: Colors.white,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Text("0",style: TextStyle(
                      color: Colors.white,fontSize: 35
                    )),

                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("BEST",style: TextStyle(
                      color: Colors.white,fontSize: 20
                    )),
                    SizedBox(height: 20,),

                    Text("400",style: TextStyle(
                      color: Colors.white,fontSize: 35
                    ))],)
              ],
            ),
            
          ),
          )
        ],
      ),
      
    );
    
  }
}