import 'package:flutter/material.dart';

var blueColor = Color(0xFF090e42);
var lightBlueColor = Color(0xFF00CCFF);
var pinkColor = Color(0xFFff6b80);

class PlayingScreen extends StatelessWidget {
  final title;
  final image;
  final duration;

  PlayingScreen(this.title, this.image, this.duration);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Column(
        children: <Widget> [
          Container(
            height: 600.0,
            child: Stack(
              children: <Widget>[
                /// Image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover
                    )
                  )
                ),

                // Adding some effects to the image
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [blueColor.withOpacity(0.2), blueColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  )
                ),
                /// Back-Button
                Column(
                  children: <Widget>[
                    SizedBox(height: 50.0,),
                    BackButton(
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            )
          )
        ]
      ),
    );
  }
}