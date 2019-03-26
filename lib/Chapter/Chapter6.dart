import 'package:flutter/material.dart';
import 'ImagePath.dart';

class Cooks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CookState();
}

class CookState extends State<Cooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("第四章")),
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                _share(context, "第四章");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.style),
              )),
        ],
      ),
      body:
      ListView(
        children: <Widget>[
          BingInfo("images/web.jpg",
              "北极海鹦",
              "碧海蓝天中的捕鱼能手",
              "以梦为马 以海为家",
              text2),
          BingInfo("images/web1.jpg",
              "法国，戈尔德",
              "静止了，所有的花开",
              "浪漫紫色的气泡幻想",
              text4),
          BingInfo("images/web2.jpg",
              "美国，布里杰-蒂顿国家森林",
              "一起来探索荒野吧",
              "为好奇心裹上保鲜膜，跟我探索世界",
              text3),
          BingInfo("images/web3.jpg",
              "城市之光",
              "走吧去洛杉矶逛馆子",
              "给你最深层的博物馆解读",
              text5),
          BingInfo("images/web4.jpg",
              "发现美的眼睛",
              "石头的生命力",
              "雕塑界的艺术殿堂",
              text6),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _share(context, "floatingActionButton");
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

void _share(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  Scaffold.of(context).showSnackBar(snackBar);
}

class BingInfo extends StatelessWidget {

  final imagePath;
  final text1;
  final text2;
  final text3;
  final text4;

  BingInfo(this.imagePath, this.text1, this.text2, this.text3, this.text4);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment(-0.97, 0.97),
            children: <Widget>[
              Card(
                child: Image.asset(imagePath,
                  fit: BoxFit.cover,),
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child:
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(60),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(text1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0),),
                  ),),
              ),
              Positioned(
                child:
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(200),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 100.0, top: 4.0, bottom: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          text2,
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 16.0),),
                        Text(
                          text3,
                          style: TextStyle(
                              color: Colors.grey, fontSize: 16.0),),
                      ],
                    ),
                  ),),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text4,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),),
            ),
          ),

        ],
      ),
    );
  }


}
