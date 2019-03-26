import 'package:flutter/material.dart';
import 'Chapter.dart';

class AppBarBottomSample extends StatefulWidget {
  @override
  _AppBarBottomSampleState createState() => new _AppBarBottomSampleState();
}

class _AppBarBottomSampleState extends State<AppBarBottomSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: pages.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//  void _nextPage(int delta) {
//    final int newIndex = _tabController.index + delta;
//    if (newIndex < 0 || newIndex >= _tabController.length)
//      return;
//    _tabController.animateTo(newIndex);
//  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          body: Stack(children: <Widget>[
            TabBarView(
              controller: _tabController,
              children: pages.map((int position) {
                return ChoicePage(position: position);
              }).toList(),
            ),
            Align(
              alignment: Alignment(0.0, 1.0),
              child:
              PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      accentColor: Colors.blue),
                  child: Container(
                    height: 48.0,
                    alignment: Alignment.center,
                    child: TabPageSelector(controller: _tabController),
                  ),
                ),
              ),
            ),

          ],)
      ),
    );
  }
}

const List<int> pages = const <int>[0, 1, 2];

class ChoicePage extends StatelessWidget {
  ChoicePage({this.position = 0});

  final int position;

  @override
  Widget build(BuildContext context) {
    switch (position) {
      case 0:
        return ImagePick();
      case 1:
        return HomePage();
      case 2:
        return Cooks();
      default:
        return ListViews(position: 2);
    }
  }
}

class Choice {
  const Choice({ this.title, this.icon });

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
