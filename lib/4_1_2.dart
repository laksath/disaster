import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Four12 extends StatefulWidget {
  @override
  _Four12State createState() => _Four12State();
}

class _Four12State extends State<Four12> {
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
                "4-1-2 -- City Map",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Container(
              height: _total * 0.10,
              width: _wd * 0.75,
              child: Text(
                "Use city and educational Maps",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Container(
              height: _total * 0.10,
              width: _wd * 0.75,
              child: Text(
                "The following link  below leads to several hazard maps that have beeon collected over the years.",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Container(
              height: _total * 0.1,
            ),
            InkWell(
              child: new Text(
                'Open Browser to view hazard maps',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => launch(
                  'https://www.city.hita.oita.jp/soshiki/somubu/kikikanrishitu/kikikanri/anshin/bosai/Preparing_for_disaster/3317.html'),
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
