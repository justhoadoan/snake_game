// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snakegame/blank_pixel.dart';
import 'package:snakegame/snake_pixel.dart';
import 'package:snakegame/food_pixel.dart';
 
 class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super (key : key );

  @override
  State<HomePage> createState() => _HomePageState();
 }
 // ignore: camel_case_types
 enum snake_Direction {UP, DOWN, LEFT, RIGHT}
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
//SNAKE DIRECTION IS INITIALLY TO THE RIGHT
var currentDirection= snake_Direction.RIGHT;
// food position
int foodPos = 55;
//start the game
void startGame(){
  Timer.periodic(Duration(milliseconds: 200), (timer){
    setState(() {
      moveSnake();
     if(gameOver()){
       timer.cancel();
        showDialog(
          context: context, 
          builder: (builder){
            return AlertDialog(
             title: Text('Game over'),
             );
            
         });
     }
    
      });

  });
  
}
void eatFood(){
while (snakePos.contains(foodPos)){
  foodPos = Random().nextInt(totalNumberOfSquares);
}
}
void moveSnake(){
    switch (currentDirection) {
      case snake_Direction.RIGHT:{
        //if snake is at the right wall, need to re-adjust
        if(snakePos.last%rowSize==9){
          snakePos.add(snakePos.last+1-rowSize);
          } else {
            snakePos.add(snakePos.last+1);
          }
        

        
      }
        
        break;
        case snake_Direction.LEFT:{
            //add a head
        if(snakePos.last%rowSize==0){
          snakePos.add(snakePos.last-1+rowSize);
          } else {
            snakePos.add(snakePos.last-1);
          }

       
        }
        
        break;
        case snake_Direction.UP:{
            //add a head
        if(snakePos.last<rowSize){
          snakePos.add(snakePos.last-rowSize+totalNumberOfSquares);

        }
        else {
          snakePos.add(snakePos.last - rowSize);
        }

       
        }
        
        break;
        case snake_Direction.DOWN:{
            //add a head
       if(snakePos.last + rowSize>totalNumberOfSquares){
          snakePos.add(snakePos.last+rowSize-totalNumberOfSquares);

        }
        else {
          snakePos.add(snakePos.last +rowSize);
        }

      
        }
        
        break;
      default:
    }
   if (snakePos.last==foodPos){
    eatFood();
   } 
   else
   {
  //remove tail
        snakePos.removeAt(0);
   }
}
bool gameOver(){
  List<int> bodySnake = snakePos.sublist(0,snakePos.length-1);
  if (bodySnake.contains(snakePos.last)){
    return true;
  }
  return false;
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
          if(details.delta.dy>0 && currentDirection!= snake_Direction.UP){
           currentDirection = snake_Direction.DOWN;

          }
          else if(details.delta.dy<0 && currentDirection!=snake_Direction.DOWN){
            currentDirection = snake_Direction.UP;

          }
          },
        onHorizontalDragUpdate: (details){
          if(details.delta.dx>0 && currentDirection!=snake_Direction.LEFT){
            currentDirection = snake_Direction.RIGHT;

          }
          else if(details.delta.dx<0 && currentDirection!=snake_Direction.RIGHT){
            currentDirection = snake_Direction.LEFT;

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
  
  