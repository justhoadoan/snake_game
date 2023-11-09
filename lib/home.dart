import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snakegame/blank_pixel.dart';
import 'package:snakegame/snake_pixel.dart';
import 'package:snakegame/food_pixel.dart';
 
 class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super (key : key );

  @override
  State<HomePage> createState() => _HomePageState();
 }
 class _HomePageState extends State<HomePage>{
//grid dimensions
int rowSize = 10;
int totalNumberOfSquares = 100;
// snake postition
List<int> snakePos = [
0,
1,
2,
];
// food position
int foodPos = 55;
//start the game
void startGame(){
  Timer.periodic(Duration(milliseconds: 200), (timer){
    setState(() {
      //add new head
      snakePos.add(snakePos.last+1);
      //remove tail
      snakePos.removeAt(0);
      });

  });
  
}

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //scores
          Flexible(

      fit: FlexFit.tight,
      child: Container(
            
),
          ),
          //game grid
           Flexible(
            fit: FlexFit.tight,
            flex: 3,
      child: GestureDetector(
        onVerticalDragUpdate:(details){
          if(details.delta.dy>0){
            print('Move up');

          }

        },
        child: GridView.builder(
          itemCount: totalNumberOfSquares,
          physics: const  NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowSize ), 
        itemBuilder: (context, index){
          if (snakePos.contains(index)){
            return const SnakePixel();
                 }
                 else if (foodPos==index)
                 {
                  return const FoodPixel();
                 }
      
                 else
                 {
                  return const BlankPixel();
                 }
        }),
      ),
        ),
                
          
          
          
          //play button
           Flexible(

      fit: FlexFit.tight,
      child: Container(
        child: Center(
          child: MaterialButton(
            child: Text('PLAY'),
            color: Colors.pink,
            onPressed: startGame ,

            )
            )
            
),
          ),
        ]
          ),
          );
  }
      


  }
  
  