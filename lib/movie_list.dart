import 'package:flutter/material.dart';

///For making calls to an api
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'item_movie.dart';
import 'movie_details.dart';

class MovieList extends StatefulWidget{
  MyMovieListState createState() => new MyMovieListState();
}

class MyMovieListState extends State<MovieList>{
  var movies; //Movie will hold data gotten from the API in it and will further be used to populate the UI
  Color mainColor = const Color(0xff3C3261);

  //Get the response and use the response to update the UI
  void getData() async{
    var data = await getJson();
    //Use this to update the App state
    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Movies",
          style: new TextStyle(
              color: mainColor,
              fontFamily: 'Arvo',
              fontWeight: FontWeight.bold
          )),
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white70,
        /*leading: new Icon(
          Icons.arrow_back,
          color: mainColor
        ),*/
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
                children: <Widget>[
                  new Icon(
                      Icons.refresh,
                      color: mainColor,
                  )
                ],
            )
          )
        ],
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new MovieTitle(mainColor),
            new Expanded(
                child: new ListView.builder(
                    itemCount: movies == null ? 0 : movies.length,
                    itemBuilder: (context, i){
                      return new FlatButton(
                          padding: const EdgeInsets.all(0.0),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context){
                                return MovieDetails(movies[i]);
                              })
                            );
                          },
                          child: new MovieItem(movies, i),
                          color: Colors.white,
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}

//Making a [Movie Title] widget
class MovieTitle extends StatelessWidget{
  final Color mainColor;

  MovieTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
      child: new Text(
        "Top Rated",
        style: new TextStyle(
          color: mainColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Arvo',
          fontSize: 30.0
        ),
        textAlign: TextAlign.left,
      )
    );
  }
}
/// We are going to create a method with a return type Future.
/// The reason to use future is that we don’t want our app to keep waiting for the response
/// rather we want the app to make the api call
/// and then let us know when the response is ready.
/// Since the response is in JSON format we are using json.decode()
/// to convert the format of the data from JSON to Map type.
/// Refer to the [cook book >> networking]
Future<Map> getJson() async{
  var url = "http://api.themoviedb.org/3/discover/movie?api_key=004cbaf19212094e32aa9ef6f6577f22";
  http.Response response = await http.get(url);

  print(json.decode(response.body));
  return json.decode(response.body);
}
