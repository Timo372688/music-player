import 'package:flutter/material.dart';
import 'playing.dart';
import 'collection.dart';

void main() => runApp(MyApp());

var blueColor = Color(0xFF090e42);
var lightBlueColor = Color(0xFF00CCFF);

var flume = 'https://i.scdn.co/image/8d84f7b313ca9bafcefcf37d4e59a8265c7d3fff';
var martinGarrix = 'https://c1.staticflickr.com/2/1841/44200429922_d0cbbf22ba_b.jpg';
var rosieLowe = 'https://i.scdn.co/image/db8382f6c33134111a26d4bf5a482a1caa5f151c';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleeping Music',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 32.0,),

          // Contains the search bar
          MyTextField(),

          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Text(
              'Collections',
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
              ),
            ),
          ),

          // Multiple rows, which contain the content of the collections
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 5.0, 0.0),
                child: MyCollection('Rain', 'assets/rain-drops.jpg', [MySong('Rain comp. 1', 'assets/songs/rain/rain1-small.jpg', 'assets/songs/rain/rain1-large.jpg', '51:13'), MySong('Rain comp. 2', 'assets/songs/rain/rain2-small.jpg', 'assets/songs/rain/rain2-large.jpg', '51:13'), MySong('Rain comp. 3', 'assets/songs/rain/rain3-small.jpg', 'assets/songs/rain/rain3-large.jpg', '51:13')]),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 30.0, 5.0, 0.0),
                child: MyCollection('Jazz', 'assets/coffee.jpg', [MySong('New York Jazz', 'assets/songs/jazz/new-york-jazz-small.jpg', 'assets/songs/jazz/new-york-jazz.jpg', '49:50'), MySong('Funky Jazz', 'assets/songs/jazz/funky-jazz-small.jpg', 'assets/songs/jazz/funky-jazz.jpg', '2:28'), MySong('Home Town', 'assets/songs/jazz/hometown-small.jpg', 'assets/songs/jazz/hometown.jpg', '5:26')]),
              ),
            ],
          ),
          
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 5.0, 0.0),
                child: MyCollection('Games & Movies', 'assets/tulip.jpg', [MySong('Ori and the Whisps', 'assets/songs/movies/ori-small.jpg', 'assets/songs/movies/ori.jpg', '51:13'), MySong('Ori and the Whisps', 'assets/songs/movies/ori-small.jpg', 'assets/songs/movies/ori.jpg', '51:13')]),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 5.0, 0.0),
                child: MyCollection('Waves', 'assets/waves.jpg', [MySong('Ori and the Whisps', 'assets/songs/movies/ori-small.jpg', 'assets/songs/movies/ori.jpg', '51:13'), MySong('Ori and the Whisps', 'assets/songs/movies/ori-small.jpg', 'assets/songs/movies/ori.jpg', '51:13')]),
              ),
            ],
          ),
          
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 15.0, 0.0, 0.0),
            child: Text(
              'Recommended',
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),

          // Some recommended songs
          MySong('Ori and the Whisps', 'assets/songs/movies/ori-small.jpg', 'assets/songs/movies/ori.jpg', '51:13'),
          MySong('New York Jazz', 'assets/songs/jazz/new-york-jazz-small.jpg', 'assets/songs/jazz/new-york-jazz.jpg', '49:50'),
          MySong('Funky Jazz', 'assets/songs/jazz/funky-jazz-small.jpg', 'assets/songs/jazz/funky-jazz.jpg', '2:28'),
          MySong('Home Town', 'assets/songs/jazz/hometown-small.jpg', 'assets/songs/jazz/hometown.jpg', '5:26'),
          MySong('rain compliation', 'assets/songs/rain/rain3-small.jpg', 'assets/songs/rain/rain3-large.jpg', '3:43:12'),
        ]
      )
    );
  }
}

class MyCollection extends StatelessWidget {
  final title;
  final image;
  final List<Widget> l;

  MyCollection(this.title, this.image, this.l);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CollectionScreen(title, image, l)
          )
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 130.0,
            width: 178.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(image, fit: BoxFit.cover)
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[200],
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
            )
          )
        ]
      ),
    );
  }
}

class MySong extends StatelessWidget {
  final title;
  final imageSmall;
  final imageLarge;
  final duration;

  MySong(this.title, this.imageSmall, this.imageLarge, this.duration);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayingScreen(title, imageLarge, duration)
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
                child: Image.asset(imageSmall),
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