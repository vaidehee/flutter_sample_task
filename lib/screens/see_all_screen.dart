import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/practice.dart';

import 'audio_player_screen.dart';

class SeeAllPracticeSCreen extends StatefulWidget {
  @override
  _SeeAllPracticeSCreenState createState() => _SeeAllPracticeSCreenState();
}

class _SeeAllPracticeSCreenState extends State<SeeAllPracticeSCreen> {
  Firestore firestore = Firestore.instance;
  List<Practice> practiceList = new List<Practice>();
  bool isFavorite;

  @override
  void initState() {
    super.initState();
    getPracticeList();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    buildListITem();

    final body = new Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.topCenter,
                    child: new Padding(
                        padding: new EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Practice",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                  new Container(
                      margin: EdgeInsets.only(top: 20.0),
                      height: 200.0,
                      width: _width,
                      child: buildListITem()),
                  Container(
                      margin: EdgeInsets.only(left: 15.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "All Practices",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700),
                      )),
                  new Expanded(
                      child: ListView.separated(
                    itemCount: practiceList.length,
                    separatorBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AudioPlayerScreen(
                                      title: practiceList[index].title,
                                      practice: practiceList[index],
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 15.0,
                              top: index == 0 ? 0.0 : 7.0,
                              bottom: 7.0,
                              right: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 65.0,
                                width: 90.0,
                                decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(12.0)),
                                    image: new DecorationImage(
                                      image: NetworkImage(
                                          practiceList[index].image),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      practiceList[index].title,
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      practiceList[index].time != null
                                          ? practiceList[index].time
                                          : "3 mins",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  )
                                ],
                              )),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    practiceList[index].isFavorited !=
                                        practiceList[index].isFavorited;
                                  });
                                },
                                child: Icon(
                                  practiceList[index].isFavorited
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: practiceList[index].isFavorited
                                      ? Colors.red
                                      : Colors.grey.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
          ],
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

  Widget buildListITem() {
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AudioPlayerScreen(
                          title: practiceList[index].title,
                          practice: practiceList[index],
                        )),
              );
            },

            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: NetworkImage(
                      practiceList[index].image,
                    ),
                    fit: BoxFit.cover),
                color: index == 0
                    ? Colors.deepPurple
                    : index == 1
                        ? Colors.lightBlue
                        : index == 2
                            ? Colors.yellow
                            : index == 3
                                ? Colors.deepOrangeAccent
                                : Colors.green,
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
                              ? Colors.lightBlue.withOpacity(0.6)
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
                              practiceList[index].title,
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 15.0, top: 15.0),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 14.0, top: 15.0),
                        child: new Text(
                          practiceList[index].subTitile,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 15.0, top: 15.0),
                        child: new Text(
                          practiceList[index].time != null
                              ? practiceList[index].time
                              : "2 Mins",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300),
                        ),
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
      itemCount: practiceList.length,
    );
  }

  getPracticeList() async {
    print("in categories before ${practiceList.length}");

    firestore.collection("practice").snapshots().listen((dataSnapshot) {
      practiceList.clear();
      for (int i = dataSnapshot.documents.length - 1; i >= 0; i--) {
        practiceList.add(Practice.data(dataSnapshot.documents[i].data,
            dataSnapshot.documents[i].documentID));
      }
      print("in practiceList ${practiceList.length}");
      setState(() {});
    });
  }
}
