import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:consultancy/Screens/movie_details.dart';
import 'package:consultancy/constants.dart';
import 'package:consultancy/domain/api.dart';
import 'package:flutter/material.dart';

class PopularTvShows extends StatefulWidget {
  const PopularTvShows({Key? key}) : super(key: key);

  @override
  State<PopularTvShows> createState() => _PopularTvShowsState();
}

class _PopularTvShowsState extends State<PopularTvShows> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api().moviesApi('/3/trending/movie/day'),
      builder: (context, AsyncSnapshot snapshot) {
        var data = snapshot.data['results'];
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .45,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Badge(
                          padding: EdgeInsets.all(9),
                          // position: BadgePosition.center(),
                          badgeColor: Colors.yellowAccent,
                          elevation: 5,
                          // position: BadgePosition.center(),
                          // position:
                          // BadgePosition.topEnd(top: -5, end: 65),
                          badgeContent: AutoSizeText(
                            data[index]['vote_average']
                                .toString()
                                .substring(0, 3),
                            textAlign: TextAlign.center,
                          ),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetails(id: data[index]))),
                            child: CachedNetworkImage(
                                height:
                                    MediaQuery.of(context).size.height * .33,
                                imageUrl: baseImageUrl +
                                    data[index]['poster_path'].toString()),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 100,
                          height: MediaQuery.of(context).size.height * .07,
                          child: AutoSizeText(
                            data[index]['title'] != null
                                ? data[index]['title'].toString()
                                : data[index]['name'],
                            softWrap: true,
                            wrapWords: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              )
            ]));
      },
    );
  }
}
/*
Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .45,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Badge(
                                padding: EdgeInsets.all(9),
                                // position: BadgePosition.center(),
                                badgeColor: Colors.yellowAccent,
                                elevation: 5,
                                // position: BadgePosition.center(),
                                // position:
                                // BadgePosition.topEnd(top: -5, end: 65),
                                badgeContent: AutoSizeText(
                                 data[index]['vote_average']
                                      .toString()
                                      .substring(0, 3),
                                  textAlign: TextAlign.center,
                                ),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MovieDetails(
                                              id:data[index]))),
                                  child: CachedNetworkImage(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .33,
                                      imageUrl: baseImageUrl +
                                         data[index]['poster_path']
                                              .toString()),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 100,
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                child: AutoSizeText(
                                 data[index]['title'] != null
                                      ?data[index]['title'].toString()
                                      :data[index]['name'],
                                  softWrap: true,
                                  wrapWords: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                          );
                        },
                      ),
                    ),
*/

/* SizedBox(
                    height: MediaQuery.of(context).size.height * .48,
                    child: ListView.builder(
                        itemCount: popularTv.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Badge(
                                    padding: EdgeInsets.all(9),
                                    // position: BadgePosition.center(),
                                    badgeColor: Colors.yellowAccent,
                                    elevation: 5,
                                    badgeContent: AutoSizeText(
                                      popularTv[index]['vote_average']
                                          .roundToDouble()
                                          .toString(),
                                      // .substring(0, 3),
                                      textAlign: TextAlign.center,
                                    ),
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MovieDetails(
                                                      id: popularTv[index]))),
                                      child: CachedNetworkImage(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .33,
                                          imageUrl: baseImageUrl +
                                              popularTv[index]['poster_path']
                                                  .toString()),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * .07,
                                  child: AutoSizeText(
                                    popularTv[index]['name'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),*/