import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:disaster_prevention/location_info.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'location_2_info.dart';
import 'models/inventory_2_coord.dart';

class Four3 extends StatefulWidget {
  final Box<InventoryImage> img;
  final Box<Inventory2Coord> coord2;

  const Four3(this.img, this.coord2);
  @override
  _Four3State createState() => _Four3State();
}

class _Four3State extends State<Four3> {
  late int imgIx;

  @override
  void initState() {
    imgIx = widget.img.isNotEmpty &&
            widget.coord2.isNotEmpty &&
            (widget.img.getAt(0)!.link == widget.coord2.getAt(0)!.link)
        ? 0
        : -1;
  }

  double startDXPoint = -1;
  double startDYPoint = -1;

  _onTapUp(TapUpDetails details, int imgIx) {
    this.startDXPoint = details.localPosition.dx.floorToDouble();
    this.startDYPoint = details.localPosition.dy.floorToDouble();
    print("$startDXPoint $startDYPoint ${widget.coord2.length}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Location2Info(
          startDXPoint,
          startDYPoint,
          widget.img.getAt(imgIx),
          1,
          widget.coord2,
        ),
      ),
    );
    setState(
      () {},
    );
  }

  int add = 0;

  addPoints() {
    setState(
      () {
        add = 1;
      },
    );
  }

  viewPoints() {
    setState(
      () {
        add = 0;
      },
    );
  }

  deletePoint() {
    setState(
      () {
        add = 2;
      },
    );
  }

  deleteCoordinate(int i) {
    widget.coord2.deleteAt(i);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;
    // print("${widget.coord2.length}");
    // print(widget.img.getAt(imgIx)!.link);
    // print("${widget.img.length}");
    // print(imgIx);
    // print(widget.img.getAt(i)!.link);
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
              height: _total * 0.1,
              child: AutoSizeText(
                'Choose a Map',
                style: TextStyle(fontSize: 45),
                maxLines: 2,
              ),
            ),
            imgIx == -1
                ? Container(
                    alignment: Alignment.center,
                    height: _total * 0.4,
                    child: AutoSizeText(
                      'Choose Image',
                      style: TextStyle(fontSize: 45),
                      maxLines: 2,
                    ),
                  )
                : Stack(
                    children: [
                      add == 1
                          ? GestureDetector(
                              onTapUp: (TapUpDetails details) =>
                                  _onTapUp(details, imgIx),
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                alignment: Alignment.center,
                                height: _total * 0.4,
                                child: Image.file(
                                  File(widget.img.getAt(imgIx)!.link),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: _total * 0.4,
                              child: Image.file(
                                File(widget.img.getAt(imgIx)!.link),
                                fit: BoxFit.contain,
                              ),
                            ),
                      for (var i = 0; i < widget.coord2.length; i++)
                        if (widget.img.isNotEmpty &&
                            widget.coord2.isNotEmpty &&
                            (widget.img.getAt(imgIx)!.link ==
                                widget.coord2.getAt(i)!.link))
                          Container(
                            margin: EdgeInsets.only(
                              left: widget.coord2.getAt(i)!.x,
                              top: widget.coord2.getAt(i)!.y,
                            ),
                            child: SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                  primary: (add == 0)
                                      ? Colors.blue
                                      : (add == 1)
                                          ? Colors.green
                                          : Colors.red, // <-- Button color
                                  onPrimary: (add == 0)
                                      ? Colors.blue
                                      : (add == 1)
                                          ? Colors.green
                                          : Colors.red, // <-- Splash color
                                ),
                                child: Text("*"),
                                onPressed: () {
                                  if (add == 2) deleteCoordinate(i);
                                  if (add < 2)
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Location2Info(
                                          widget.coord2.getAt(i)!.x,
                                          widget.coord2.getAt(i)!.y,
                                          widget.img.getAt(imgIx),
                                          0,
                                          widget.coord2,
                                        ),
                                      ),
                                    );
                                },
                              ),
                            ),
                          ),
                    ],
                  ),
            Container(
              height: _total * 0.1,
              child: Row(
                children: [
                  AutoSizeText(
                    'X $startDXPoint',
                    style: TextStyle(fontSize: 45),
                    maxLines: 2,
                  ),
                  AutoSizeText(
                    'Y $startDYPoint',
                    style: TextStyle(fontSize: 45),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.img.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: _total * 0.2,
                      width: _wd * 0.4,
                      child: IconButton(
                        icon: Image.file(
                          File(widget.img.getAt(index)!.link),
                          fit: BoxFit.contain,
                        ),
                        onPressed: () {
                          setState(() {
                            imgIx = index;
                            // print(imgIx);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 75,
            width: 75,
            child: new FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                viewPoints();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 75,
            width: 75,
            child: new FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              onPressed: () {
                deletePoint();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 75,
            width: 75,
            child: new FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                addPoints();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 75,
            width: 75,
            child: new FloatingActionButton(
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
        ],
      ),
    );
  }
}
