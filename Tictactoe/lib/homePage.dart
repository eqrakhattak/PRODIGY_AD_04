
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // final String x = 'X';
  // final String o = 'O';
  // late String element = '';
  // bool xTurn = true;
  bool oTurn = false;
  Border xTurnContainerBorder = Border.all(width: 2, color: Colors.white70);
  Border oTurnContainerBorder = Border.all(width: 0,);
  List<String> elements = ['', '', '', '', '', '', '', '', ''];
  int boxesFilled = 0;
  void changeTurn(){
    if(oTurn == false){
      xTurnContainerBorder = Border.all(width: 2, color: Colors.white70);
      oTurnContainerBorder =  Border.all(width: 0,);
    } else if(oTurn == true){
      oTurnContainerBorder = Border.all(width: 2, color: Colors.white70);
      xTurnContainerBorder = Border.all(width: 0,);
    }
  }

  void _tapped(int index) {
    setState(() {
      // if (oTurn && displayElement[index] == '') {
      //   displayElement[index] = 'O';
      //   // filledBoxes++;
      // } else if (!oTurn && displayElement[index] == '') {
      //   displayElement[index] = 'X';
      //   // filledBoxes++;
      // }

      if(elements[index] == ''){
        if(oTurn){
          elements[index] = 'O';
          boxesFilled++;
        }else if (!oTurn){
          elements[index] = 'X';
          boxesFilled++;
        }
        oTurn = !oTurn;
        changeTurn();
      }
      _checkWinner();
    });
  }

  void _checkWinner(){

    //check rows
    if(elements[0] != '' && elements[0] == elements[1] && elements[0] == elements[2]){
      _declareWinner(elements[0]);
    }
    if(elements[3] != '' && elements[3] == elements[4] && elements[3] == elements[5]){
      _declareWinner(elements[3]);
    }
    if(elements[6] != '' && elements[6] == elements[7] && elements[6] == elements[8]){
      _declareWinner(elements[6]);
    }

    //check columns
    if(elements[0] != '' && elements[0] == elements[3] && elements[0] == elements[6]){
      _declareWinner(elements[0]);
    }
    if(elements[1] != '' && elements[1] == elements[4] && elements[1] == elements[7]){
      _declareWinner(elements[1]);
    }
    if(elements[2] != '' && elements[2] == elements[5] && elements[2] == elements[8]){
      _declareWinner(elements[2]);
    }

    //check diagonals
    if(elements[0] != '' && elements[0] == elements[4] && elements[0] == elements[8]){
      _declareWinner(elements[0]);
    }
    if(elements[2] != '' && elements[2] == elements[4] && elements[2] == elements[6]){
      _declareWinner(elements[2]);
    }

    //draw
    if(boxesFilled==9){
      _drawGame();
    }
  }

  void _declareWinner(String winner){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('$winner is the winner!'),
          actions: [
            ElevatedButton(
              onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text('Play Again?'),
            ),
          ],
        );
      },
    );
  }

  void _drawGame(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('It\'s a draw!'),
          actions: [
            ElevatedButton(
              onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text('Play Again?'),
            ),
          ],
        );
      },
    );
  }

  void _clearBoard(){
    setState(() {
      for (int i = 0; i < 9; i++) {
        elements[i] = '';
      }
    });

    boxesFilled = 0;
    // element = '';
    // xTurn = true;
    // oTurn = false;
    // changeTurn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161849),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    border: xTurnContainerBorder,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: const Color(0xFF0F1131),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFFE61C4F),
                    size: 70,
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: 110,
                  width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: oTurnContainerBorder,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: const Color(0xFF0F1131),
                  ),
                  child: const Icon(
                    Icons.circle_outlined,
                    color: Color(0xFFFFCE3B),
                    size: 70,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, left: 8),
              decoration: const BoxDecoration(
                color: Color(0xFF6648C3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap:() => _tapped(index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8, bottom: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFF0F1131),
                      ),
                      alignment: Alignment.center,
                      child: DisplayElement(value: elements[index],),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _clearBoard,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.restart),
                  SizedBox(width: 8,),
                  Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DisplayElement extends StatelessWidget {

  final String value;
  const DisplayElement({super.key, required this.value});

  @override
  Widget build(BuildContext context) {

    IconData iconData;
    Color iconColor;

    switch (value){
      case 'X':
        iconData = Icons.close;
        iconColor = const Color(0xFFE61C4F);
        break;
      case 'O':
        iconData = Icons.circle_outlined;
        iconColor = const Color(0xFFFFCE3B);
        break;
      default:
        iconData = Icons.error;
        iconColor = const Color(0xFF0F1131);
    }

    return Icon(
      iconData,
      color: iconColor,
      size: 70,
    );
  }
}
