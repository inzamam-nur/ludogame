
import 'package:flutter/material.dart';
import 'package:ludo/home.dart';
import 'package:ludo/play.dart';

class GameOver extends StatefulWidget {
  const GameOver({super.key});

  @override
  State<GameOver> createState() => _GameOverState();

}


class _GameOverState extends State<GameOver> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    Size defaultSize = MediaQuery
        .of(context)
        .size;

    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/MicrosoftTeams-image (2).png'),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        onPressed: (){
                          const Text('home page',style: TextStyle(fontSize: 16),);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),

                          );

                        }, child:const  Text('Home',style: TextStyle(fontSize: 16,color: Colors.white),),),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PlayGame()),

                          );
                        }, child:const  Text('Play Again',style: TextStyle(fontSize: 20,color: Colors.white),),),
                    ),
                  )
                ],
              ),
            ),

          ],

        ),
      ),
    );
  }
}