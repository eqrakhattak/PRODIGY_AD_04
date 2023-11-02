
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

  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];

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

      if(displayElement[index] == ''){
        if(oTurn){
          displayElement[index] = 'O';
        }else if (!oTurn){
          displayElement[index] = 'X';
        }

        oTurn = !oTurn;
        changeTurn();
      }

      // _checkWinner();
    });
  }

  // void _tapped(){
  //   // print('box tapped');
  //   if(xTurn == true){
  //     element = x;
  //     xTurn = false;
  //     oTurn = true;
  //   } else {
  //     element = o;
  //     xTurn = true;
  //     oTurn = false;
  //   }
  //   changeTurn();
  //   setState(() {});
  // }

  void _clearBoard(){

    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    // filledBoxes = 0;
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
                      child: DisplayElement(value: displayElement[index],),
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
