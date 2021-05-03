import 'package:bankly_test/api/models.dart';
import 'package:flutter/material.dart';

import 'hero.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final imagesList = [
    "assets/images/newyork.jpeg",
    "assets/images/capetown.jpeg",
    "assets/images/switzerland.jpeg",
  ];

  final colorList = [
    Colors.redAccent.shade100,
    Colors.blueAccent.shade100,
    Colors.amber.shade50
  ];

  final PageController ctrl = PageController(viewportFraction: 0.8);
  int currentPage = 0;

  @override
  void initState() {
    ctrl.addListener(() {
      int next = ctrl.page.round();
      if (currentPage != next) {
        currentPage = next;
      }
    });
   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: ctrl,
        itemCount: 3,
        itemBuilder: (context, int currentIdx) {

          bool active = currentIdx == currentPage;
          return _buildNormalPage(imagesList, active, currentIdx);
        }
    );
  }

  Widget _buildNormalPage(List<String> imagesList, bool active, int currentIdx) {
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;
    
    return GestureDetector(
      onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HeroPage(image: imagesList[currentIdx])));
    },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(imagesList[currentIdx]),
                fit: BoxFit.cover
            ),
            boxShadow: [BoxShadow(color: Colors.black87, blurRadius: blur, offset: Offset(offset, offset) )]
        ),
        child: Center(
            child: Hero(
              tag: 'location-img-${imagesList[currentIdx]}',
              child: Text(detailsList[currentIdx].title, style: TextStyle(fontSize: 40, color: Colors.white)),
            )
        ),
      ),
    );
  }
}
