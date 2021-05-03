import 'package:bankly_test/db/prefs.dart';
import 'package:bankly_test/ui/login/login_page.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {

  final String image;
  final String details;
  final Color color;

  const HeroPage({Key key, this.image, this.details, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              actions: [
                IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      sharedPrefs.clear();
                      final route = MaterialPageRoute(builder: (context) => LoginPage());
                      Navigator.of(context, rootNavigator: true).pushReplacement(route);
                    })
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'location-img-$image',
                  child: Image.asset(
                    image,
                    height: 360.0,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                color: color,
                padding: EdgeInsets.all(12.0),
                child: Text(
                    details,
                    style: TextStyle(
                        color: Colors.grey[600],
                        height: 1.4
                    )
                ),
              ),
            )
          ],
        )
    );
  }
}

