import 'dart:io';

import 'package:flutter/material.dart';

import 'ImagePath.dart';
import 'ManyUtils.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';
import 'package:shimmer/shimmer.dart';

//第一章

class ImagePick extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Body();
}

File _image;
VideoPlayerController _controller;
bool _isPlaying = false;
Icon playIcon = Icon(Icons.play_arrow);

class Body extends State<ImagePick> {
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(video1)
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("第一章"))),
      body: Center(child: MessagePage(() {
        setState(() {});
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
            playIcon = Icon(Icons.play_arrow);
          } else {
            _controller.play();
            playIcon = Icon(Icons.pause);
          }
        },
        child: playIcon,
      ),
    );
  }
}

//中心文本
class MessagePage extends StatelessWidget {
  final RefreshView refreshView;

  MessagePage(this.refreshView);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView(
      children: <Widget>[
        Container(
            height: height * 2 / 5,
            width: width,
            child: GestureDetector(
              onTap: () {
                const url = 'https://juejin.im/';
                launchURL(url);
              },
              child: FadeInImage.memoryNetwork(
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: path5),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                final snackBar = SnackBar(content: Text('第一章'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.black,
                    highlightColor: Colors.white,
                    child: Text(
                      text1,
                      softWrap: true,
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              getImage((image) {
                _image = image;
                refreshView();
              });
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: height * 1 / 4,
                    width: width,
                    color: Colors.grey.withAlpha(100),
                    child: _image == null
                        ? Center(
                            child: Text('点击，选择图片'),
                          )
                        : Image.file(
                            _image,
                            fit: BoxFit.cover,
                          )),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: _controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(
                        height: height * 1 / 4,
                        width: width,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
