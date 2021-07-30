import 'package:auto_size_text/auto_size_text.dart';
import 'package:disaster_prevention/4_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              height: _total * 0.05,
            ),
            Container(
              height: _total * 0.05,
              width: _wd * 0.5,
              margin: EdgeInsets.only(left: _wd * 0.25, right: _wd * 0.25),
              child: FittedBox(
                child: AutoSizeText(
                  "Field Work",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            Container(
              height: _total * 0.05,
            ),
            // SizedBox(
            //   width: _wd * 0.7,
            //   child: FlatButton(
            //     padding: EdgeInsets.zero,
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Four1(),
            //         ),
            //       );
            //     },
            //     child: FittedBox(
            //       child: Text(
            //         "Settings And Synchronization Data",
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 1000,
            //         ),
            //       ),
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50),
            //     ),
            //   ),
            // ),
            Container(
              height: _total * 0.05,
            ),
            SizedBox(
              height: _total * 0.1,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Four1(),
                    ),
                  );
                },
                child: AutoSizeText(
                  '4-1 Create your own Map',
                  style: TextStyle(fontSize: 45),
                  maxLines: 2,
                ),
              ),
            ),
            Container(
              height: _total * 0.05,
              width: _wd * 0.75,
              child: AutoSizeText(
                "The info regarding 4-1 ................................................................................",
                style: TextStyle(fontSize: 20),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: _total * 0.1,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: AutoSizeText(
                  '4-2 Add what you hear and see',
                  style: TextStyle(fontSize: 45),
                  maxLines: 2,
                ),
              ),
            ),
            Container(
              height: _total * 0.05,
              width: _wd * 0.75,
              child: AutoSizeText(
                "The info regarding 4-2 ................................................................................",
                style: TextStyle(fontSize: 20),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: _total * 0.1,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                child: FittedBox(
                  child: AutoSizeText(
                    '4-3 Disaster Prevention Map Making',
                    style: TextStyle(fontSize: 45),
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            Container(
              height: _total * 0.05,
              width: _wd * 0.75,
              child: AutoSizeText(
                "The info regarding 4-3 ................................................................................",
                style: TextStyle(fontSize: 20),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          onPressed: () {
            // Navigator.pop(c  ontext);
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
