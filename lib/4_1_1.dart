import 'package:flutter/material.dart';

class Four11 extends StatefulWidget {
  @override
  _Four11State createState() => _Four11State();
}

class _Four11State extends State<Four11> {
  @override
  Widget build(BuildContext context) {
    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: _wd * 0.05,
          vertical: _total * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: _topPadding,
              color: Colors.white,
            ),
            Container(
              height: _total * 0.10,
              width: _wd * 0.75,
              child: Text(
                "Creating a map",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Container(
              height: _total * 0.10,
              width: _wd * 0.75,
              child: Text(
                "Create your own map",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Container(
              height: _total * 0.10,
              width: _wd * 0.75,
              child: Text(
                "Scanned image of the hand written sketch",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Image.asset(
              'images/4_1_1.jpg',
              width: _wd * 0.9,
              // height: 240.0,
              // fit: BoxFit.,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
