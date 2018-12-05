import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MovieDetails extends StatelessWidget{
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';

  MovieDetails(this.movie);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      ///[STack] widget Positions its children relative to the edges of its box
      ///Useful in overlapping several children in a simple way
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.network(
            ///BoxFit.cover shows the full width of the source[the entire device screen]
            image_url + movie['poster_path'],
            fit: BoxFit.cover,
          ),
          ///Make the image gotten[Above] blur &
          ///adding a color [black] which is half opaque
          new BackdropFilter(
              filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: new Container(
                color: Colors.black.withOpacity(0.5),
              ),
          ),
          ///A scroll view on top of the [opaque image]
          new SingleChildScrollView(
            child: new Container(
              margin: const EdgeInsets.all(20.0),
              ///[Vertical layout] image with width and height 400 coming first
              child: new Column(
                children: <Widget>[
                  /**Container to hold the image*/
                  new Container(
                    alignment: Alignment.center,
                    child: Container(
                        width: 400.0,
                        height: 400.0
                    ),
                    ///Decorate the above container and add [Image]
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: new DecorationImage(
                          image: new NetworkImage(image_url + movie['poster_path']),
                          fit: BoxFit.cover
                      ),
                      ///Give the above decoration a box / container shadow
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20.0,
                          offset: new Offset(0.0, 10.0)
                        )
                      ]
                    ),
                  ),
                  /**Container to hold: follow below*/
                  new Container(
                    ///command + click to check for .symmetric use
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 0.0
                    ),
                    ///Horizontal Layout
                    ///Title & average vote
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(
                            movie['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontFamily: 'Arvo'
                            ),
                          ),
                        ),
                        new Text(
                          //Use String Templating
                          '${movie['vote_average']}/10',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo'
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///Still in our [Column widget], let's add our movie overview below the
                  ///title and the average vote
                  new Text(
                    movie['overview'],
                    style: TextStyle(color: Colors.white, fontFamily: 'Arvo'),
                  ),
                  ///Give padding
                  Padding(padding: const EdgeInsets.all(10.0),),
                  ///lets create some fancy stuffs here
                  Row(
                    children: <Widget>[
                      new Expanded(
                          child: Container(
                            width: 150.0,
                            height: 60.0,
                            alignment: Alignment.center,
                            child: Text(
                              'Rate Movie',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Arvo',
                                fontSize: 20.0
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color(0xaa3C3261)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xaa3C3261)
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}