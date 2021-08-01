import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:disaster_prevention/models/inventory_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'models/inventory_coord.dart';

class Four11 extends StatefulWidget {
  final Box<InventoryImage> img;
  final Box<InventoryCoord> coord;
  const Four11(this.img, this.coord);
  @override
  _Four11State createState() => _Four11State();
}

class _Four11State extends State<Four11> {
  late File _image;
  late String linkImg;
  final picker = ImagePicker();
  int check = 0;
//Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        linkImg = pickedFile.path;
        check = 1;
      }
    });
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        check = 1;
      }
    });
  }

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
            Container(
              height: _total * 0.45,
              width: _wd * 0.9,
              child: check == 0
                  ? AutoSizeText(
                      'No image selected Yet!',
                      style: TextStyle(fontSize: 45),
                      maxLines: 2,
                    )
                  : Image.file(
                      _image,
                      fit: BoxFit.contain,
                    ),
            ),
            Container(
              height: _total * 0.05,
            ),
            Row(
              children: [
                Container(
                  height: _total * 0.1,
                  width: _wd * 0.4,
                  child: ElevatedButton(
                    child: AutoSizeText(
                      'Import from Gallery',
                      style: TextStyle(fontSize: 25),
                      maxLines: 2,
                    ),
                    onPressed: getImageFromGallery,
                  ),
                ),
                Container(
                  width: _wd * 0.1,
                ),
                Container(
                  height: _total * 0.1,
                  width: _wd * 0.4,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.green,
                      ),
                    ),
                    child: AutoSizeText(
                      'Save Map',
                      style: TextStyle(fontSize: 25),
                      maxLines: 2,
                    ),
                    onPressed: () {
                      int copyVerify = 0;
                      if (check == 1) {
                        for (var i = 0; i < widget.img.length; i++) {
                          if (widget.img.getAt(i)?.link == null &&
                              linkImg == widget.img.getAt(i)!.link) {
                            copyVerify = 1;
                          }
                        }
                        widget.img.add(
                          InventoryImage(link: linkImg),
                        );
                      }
                      showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.of(context).pop(true);
                          });
                          return AlertDialog(
                            title: check == 0
                                ? Text("Please Choose an Image")
                                : copyVerify == 0
                                    ? Text('Please Choose a new Image')
                                    : Text('Image Saved'),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
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
