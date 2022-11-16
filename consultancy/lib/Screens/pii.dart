import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: FutureBuilder(
              future: loadMovies(),
              builder: (context, AsyncSnapshot snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        child: Text(snapshot.data[i]['original_name']),
                      );
                    });
              })),
    );
  }

  loadMovies() async {
    https: //api.themoviedb.org/3/tv/popular?api_key=2c098f262daac4431b567af883e72864&language=en-US&page=1
    // https://developers.google.com/books/docs/overview
    var url = Uri.https('api.themoviedb.org', '/3/tv/popular',
        {'api_key': '2c098f262daac4431b567af883e72864'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('===================');
      print(jsonResponse['results'][0]['vote_average']);
      print('====================================');

      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
      return jsonResponse['results'];
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    // TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccessToken),
    //     logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));
    // Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    // Map popularTvShows = await tmdbWithCustomLogs.v3.tv.getPopular();
    // Map popularMovies = await tmdbWithCustomLogs.v3.movies.getPopular();

    // setState(() {
    //   trendingList = trendingResult['results'];
    //   popularTv = popularTvShows['results'];
    //   popularMoviesList = popularMovies['results'];
    //   print(
    //     trendingList.length,
    // popularMoviesList[index].length,
  }
}
