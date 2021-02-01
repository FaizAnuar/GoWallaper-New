import 'package:flutter/material.dart';
import 'package:gowallpaper/services/wallpaper_utilities.dart';
import 'package:gowallpaper/screens/home.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({this.imgUrl});
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  String url = ImageView().imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  //check yg ni dgn thatwallpaper
                  //set wallpaper
                  onTap: () {
                    checkWallpaper(context: context, url: url);
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey,
                            gradient: LinearGradient(
                              colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                            )),
                        child: Center(
                          child: Text('Set as Wallpaper',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white70)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
