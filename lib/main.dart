import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Color> colors = [
    const Color((0xAA7E57C2)),
    const Color((0xAA5C6BC0)),
    const Color((0xAA2097F5)),
    const Color((0xAA26A59A)),
    const Color((0xAAFFC928)),
    const Color((0xAAFF7143)),
    const Color((0xAA8C6E63)),
    const Color((0xAAEC407A)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          tile("C","Do",1,const Color(0xFF66469b),350.0),
          tile("D","RI",2,const Color(0xFF49569A),330.0),
          tile("E","MI",3,const Color(0xFF1A78C2),310.0),
          tile("F","FA",4,const Color(0xFF1D857A),290.0),
          tile("G","So",5,const Color(0xFFCCA11E),270.0),
          tile("A","LA",6,const Color(0xFFFF6144),250.0),
          tile("B","SI",7,const Color(0xFF70584E),230.0),
          tile("C","DO",8,const Color(0xFFBD3462),210.0),
        ],
      ),
    );
  }

  Widget tile(String letter, String noteName, int number, Color color,
      [double height = 100.0]) =>
      GestureDetector(
        child: Container(
          height: height,
          width: 80.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.centerRight
            , colors: [
              color,
              colors[--number],
            ]),
            color: color,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                letter,
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
              Text(
                noteName,
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
              Text(
                "$number",
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ],
          ),
        ),
        onTap: (){
          playAudio("sounds/note$number.mp3");
        },
      );
  void playAudio(String path) async{
    AudioPlayer player = AudioPlayer();
    await player.play(AssetSource(path));
  }
}
