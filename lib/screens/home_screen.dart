import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/new.dart';
import 'package:flutter_sample_app/models/populer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Firestore firestore = Firestore.instance;
  List<Popular> populerList = new List<Popular>();
  List<New> newList = new List<New>();

  @override
  void initState() {
    super.initState();
    getPopularList();
    getNewList();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final body = Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                            height: MediaQuery.of(context).size.height / 2.5,
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                                color:Color(0xFF2E4CB9),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25.0))),
                            child: Container(
                                margin: EdgeInsets.only(top: 20.0, left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Day 7",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          "Love and Accept \nYourself",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w700),
                                        )),
                                  ],
                                ))),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              margin: EdgeInsets.only(top: 60.0),
                              alignment: Alignment.bottomRight,
                              height: 250.0,
                              width: 220.0,
                              child: Image.asset("images/meditation.png")),
                        )
                      ],
                    ),
                    Container(
                        margin:
                            EdgeInsets.only(left: 25.0, top: 20.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Popular",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 180.0,
                        width: _width,
                        child: buildPopularListItem(populerList)),
                    Container(
                        margin:
                            EdgeInsets.only(left: 25.0, top: 20.0, right: 10.0),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "New",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        )),
                    new Container(
                        margin: EdgeInsets.only(top: 5.0),
                        height: 180.0,
                        width: _width,
                        child: buildNewListItem(newList)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return new Container(
      child: new Stack(
        children: <Widget>[
          body,
        ],
      ),
    );
  }

  Widget buildNewListItem(List<New> list) {
    return new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 5.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 5.0, top: 4.0, bottom: 30.0);

        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {},
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: NetworkImage(
                      list[index].image,
                    ),
                    fit: BoxFit.cover),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(50), blurRadius: 1.0)
                ],
              ),
              //                                    height: 200.0,
              width: 250.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: index == 0
                          ?Color(0xFF0FF9870).withOpacity(0.6)
                          : index == 1
                              ? Colors.green.withOpacity(0.6)
                              : index == 2
                                  ? Colors.yellow.withOpacity(0.6)
                                  : index == 3
                                      ? Colors.deepOrangeAccent.withOpacity(0.6)
                                      : Colors.green.withOpacity(0.6),
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                  new Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 15.0, top: 15.0),
                            child: new Text(
                              list[index].title,
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 14.0, top: 15.0),
                        child: new Text(
                          list[index].subTitile,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 15.0, top: 15.0),
                            child: new Text(
                              list[index].steps != null
                                  ? list[index].steps + " " + "Steps "
                                  : "2" + " " + "Steps",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 5.0, top: 15.0, right: 5.0),
                            color: Colors.white,
                            height: 15.0,
                            width: 1.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 5.0, top: 16.0),
                            child: new Text(
                              list[index].duration != null
                                  ? list[index].duration
                                  : "5 Mins",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: newList.length,
    );
  }

  Widget buildPopularListItem(List<Popular> list) {
    return new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 5.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 5.0, top: 4.0, bottom: 30.0);

        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {},
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: NetworkImage(
                      list[index].image,
                    ),
                    fit: BoxFit.cover),
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(50), blurRadius: 1.0)
                ],
              ),
              //                                    height: 200.0,
              width: 250.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Color(0xFF2E4CB9).withOpacity(0.6)
                          : index == 1
                              ? Colors.cyan.withOpacity(0.6)
                              : index == 2
                                  ? Colors.yellow.withOpacity(0.6)
                                  : index == 3
                                      ? Colors.deepOrangeAccent.withOpacity(0.6)
                                      : Colors.green.withOpacity(0.6),
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                  new Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 15.0, top: 15.0),
                            child: new Text(
                              list[index].title,
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 14.0, top: 15.0),
                        child: new Text(
                          list[index].subTitile,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 15.0, top: 15.0),
                            child: new Text(
                              list[index].steps != null
                                  ? list[index].steps + " " + "Steps "
                                  : "2" + " " + "Steps",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 5.0, top: 15.0, right: 5.0),
                            color: Colors.white,
                            height: 15.0,
                            width: 1.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 5.0, top: 16.0),
                            child: new Text(
                              list[index].duration != null
                                  ? list[index].duration
                                  : "5 Mins",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: populerList.length,
    );
  }

  getPopularList() async {
    firestore.collection("popular").snapshots().listen((dataSnapshot) {
      populerList.clear();
      for (int i = 0; i < dataSnapshot.documents.length; i++) {
        populerList.add(Popular.data(dataSnapshot.documents[i].data,
            dataSnapshot.documents[i].documentID));
      }
      print("in popular ${populerList.length}");
      setState(() {});
    });
  }

  getNewList() async {
    firestore.collection("new").snapshots().listen((dataSnapshot) {
      newList.clear();
      for (int i = 0; i < dataSnapshot.documents.length; i++) {
        newList.add(New.data(dataSnapshot.documents[i].data,
            dataSnapshot.documents[i].documentID));
      }
      print("in new ${newList.length}");
      setState(() {});
    });
  }
}
