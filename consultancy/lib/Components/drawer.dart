import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ListTile(
            leading: Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Text(
              'Trending',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.trending_up,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Text(
              'Most Viewed',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.reviews_rounded,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Text(
              'Favourites',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      elevation: 10,
    );
  }
}
