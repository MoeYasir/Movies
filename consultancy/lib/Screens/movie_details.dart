import 'package:consultancy/constants.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  final dynamic id;
  const MovieDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff222A31),
            title: Text(
                widget.id['title'] == null
                    ? widget.id['name'] == null
                        ? 'Not available'
                        : widget.id['name'].toString()
                    : (widget.id['title'].toString()),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15)),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                height: 100,
                width: 100,
                child: Image(
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                  image: NetworkImage(
                      baseImageUrl + widget.id['backdrop_path'].toString()),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * .32,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overview : ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                          widget.id['overview'] != null
                              ? widget.id['overview'].toString()
                              : 'OverView Not Provided',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 15)),
                      const SizedBox(height: 15),
                      Row(
                        // mainAxisAlignment: spacearoun,
                        children: [
                          Text(
                            'Rating: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(widget.id['vote_average'].toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]))
        ],
        // ),

        // body: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       pinned: false,
        //       floating: true,
        //       snap: false,
        //       flexibleSpace: FlexibleSpaceBar(
        //         title: Text(widget.id['title'].toString()),
        //         centerTitle: true,
        //       ),
        //       title: Text('Movie Details'),
        //       expandedHeight: 100,
        //     ),
        //     SliverList(
        //         delegate: SliverChildListDelegate([
        //       Image(
        //         image: NetworkImage(
        //             baseImageUrl + widget.id['poster_path'].toString()),
        //       ),
        //       Text(
        //         'data',
        //         style: TextStyle(
        //           fontSize: 600,
        //           color: Colors.white,
        //         ),
        //       )
        //     ])),
        //   ],
        // ),
        // body: Center(
        //   child: Image(
        //     image:
        //         NetworkImage(baseImageUrl + widget.id['poster_path'].toString()),
        //   ),
        // ),
      ),
    ));
  }
}
