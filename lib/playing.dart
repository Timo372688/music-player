import 'package:flutter/material.dart';

var blueColor = Color(0xFF090e42);
var lightBlueColor = Color(0xFF00CCFF);

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
                // Image
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
                // Back-Button
                Column(
                  children: <Widget>[
                    SizedBox(height: 50.0,),
                    BackButton(
                      color: Colors.black,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(0.0, 0.9),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // song playing functionality
          Slider(
            onChanged: (double value) {},
            value: 0.2,
            activeColor: Colors.teal,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '1:37',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  '-1:13:42',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 2.5, 0.0),
                child: Icon(
                  Icons.fast_rewind,
                  color: Colors.grey[200],
                  size: 35,
                ),
              ),
              Icon(
                Icons.pause_circle_filled,
                color: Colors.teal,
                size: 65,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2.5, 0.0, 0.0, 0.0),
                child: Icon(
                  Icons.fast_forward,
                  color: Colors.grey[200],
                  size: 35,
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}