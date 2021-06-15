import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class Team extends StatefulWidget {
  const Team({Key key}) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        // This streamBuilder reads the real-time status of SlimyCard.
        initialData: false,
        stream: slimyCard.stream, //Stream of SlimyCard
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 100),

              // SlimyCard is being called here.
              SlimyCard(
                // In topCardWidget below, imagePath changes according to the
                // status of the SlimyCard(snapshot.data).
                topCardWidget: topCardWidget((snapshot.data)
                    ? 'images/logo.png'//aggresive
                    : 'images/bra.png'),//calm
                bottomCardWidget: bottomCardWidget(),
              ),
            ],
          );
        }),
      ),
    );
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Team',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Text(
          'Press Down for more info.',
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
             child: Column(
               children: [
                 //Image.asset('images/logo.png'),
                 CircleAvatar(
                   backgroundColor: Colors.white,
                   backgroundImage: AssetImage('images/logo.png'),
                   radius: 30,
                 ),
                 SizedBox(height: 20, width: 20,),
                 Text("Star Boy", style: TextStyle(color: Colors.white, fontSize: 20),),
               ],
             ),
           ),
            SizedBox(height: 30, width: 20,),

            Container(
              child: Column(
                children: [
                  //Image.asset('images/logo.png'),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/bra.png'),
                    radius: 30,
                  ),
                  SizedBox(height: 20, width: 20,),
                  Text("Akwasi Titus", style: TextStyle(color: Colors.white, fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: 30, width: 20,),

            Container(
              child: Column(
                children: [
                  //Image.asset('images/logo.png'),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/logo.png'),
                    radius: 30,
                  ),
                  SizedBox(height: 20, width: 20,),
                  Text("Gideon", style: TextStyle(color: Colors.white, fontSize: 20),),
                  SizedBox(width: 20,)
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
