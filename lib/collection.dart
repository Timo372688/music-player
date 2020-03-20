import 'package:flutter/material.dart';
import 'playing.dart';

var blueColor = Color(0xFF090e42);
var lightBlueColor = Color(0xFF00CCFF);
var pinkColor = Color(0xFFff6b80);

class CollectionScreen extends StatelessWidget {
  final title;
  final image;

  CollectionScreen(this.title, this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 32.0,),

          /// Contains the search bar
          Row(
            children: <Widget>[
              Container(
                width: 30.0,
                child: BackButton(
                  color: Colors.white,
                ),
              ),
              Flexible(
                child: MyTextField(),
              ),
            ]
          ),

          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 15.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                MySong('jazz playlist one', 'assets/music.png', '1:26:30'),
                MySong('tropical rain forest', 'assets/music.png', '3:43:12'),
                MySong('jazz playlist one', 'assets/music.png', '1:26:30'),
                MySong('tropical rain forest', 'assets/music.png', '3:43:12'),
                MySong('jazz playlist one', 'assets/music.png', '1:26:30'),
                MySong('tropical rain forest', 'assets/music.png', '3:43:12'),
                MySong('jazz playlist one', 'assets/music.png', '1:26:30'),
                MySong('tropical rain forest', 'assets/music.png', '3:43:12'),
                MySong('jazz playlist one', 'assets/music.png', '1:26:30'),
                MySong('tropical rain forest', 'assets/music.png', '3:43:12'),
              ],
            ),
          )
        ],
      )
    );
  }
}

class MySong extends StatelessWidget {
  final title;
  final image;
  final duration;

  MySong(this.title, this.image, this.duration);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayingScreen(title, 'assets/fancy-playing.jpg', duration)
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: Text(
                      duration,
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.normal,
                        fontSize: 13.0,
                      ),
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


class MyTextField extends StatelessWidget {
  const MyTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: lightBlueColor.withOpacity(0.1),
        child: Row(
          children: <Widget>[
            SizedBox(width: 10.0,),
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.grey[300]),
                decoration: InputDecoration(
                  hintText: 'Search music...',
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  border: InputBorder.none
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}