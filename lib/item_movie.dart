import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget{
  final movies;
  final item;

  Color mainColor = const Color(0xff3C3261);
  var imageUrl = 'https://image.tmdb.org/t/p/w500/';

  MovieItem(
      this.movies,
      this.item);

  @override
  Widget build(BuildContext context) {
    ///This item is horizontal so we will use the [Row Widget]
    ///Image at left and text at the right
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Container(
                margin: const EdgeInsets.all(16.0),
                child: new Container(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(imageUrl + movies[item]['poster_path']),
                        fit: BoxFit.cover
                    ),
                    boxShadow: [
                      new BoxShadow(
                          color: mainColor,
                          blurRadius: 5.0,
                          offset: new Offset(2.0, 5.0)
                      )
                    ]
                ),
              ),
            ),
            ///Using Expanded so that all content will show
            ///This vertical so the Column will be used,
            ///putting it into a container widget enable giving it margin
            new Expanded(
              child: new Container(
                margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: new Column(
                    children: <Widget>[
                      ///Movie Title
                      new Text(
                        movies[item]['title'],
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Arvo',
                            fontWeight: FontWeight.bold,
                            color: mainColor
                        ),
                      ),

                      new Padding(padding: EdgeInsets.all(2.0)),
                      ///Movie Overview
                      new Text(
                          movies[item]['overview'],
                          maxLines: 3,
                          style: new TextStyle(
                            fontFamily: 'Arvo',
                            color: const Color(0xff8785A4),
                          )
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start
                ),
              ),
            )
          ],
        ),
        ///Divider
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0)
        )
      ],
    );
  }
}