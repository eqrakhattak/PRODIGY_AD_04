import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
                    border: Border.all(width: 2, color: Colors.white70),
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
                    border: Border.all(width: 0,),
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
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 8, bottom: 8),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFF0F1131),
                      ),
                      alignment: Alignment.center,
                      child: const Text('X', style: TextStyle(color: Colors.white70),),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
