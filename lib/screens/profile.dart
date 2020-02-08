import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 25.0),
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/profile.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: Text(
                        "Alina John",
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    buildCard("Practices", "13", "4:24:04"),
                    buildCard("Meditations", "6", "0:55:04"),
                    buildStepsCard()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget  buildStepsCard() {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 220.0,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 10.0,
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 15.0, top: 5.0),
                child: Text(
                  "Stats",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Steps Goes Here",
                  style: TextStyle(fontSize: 10.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title, String number, String time) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 10.0,
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 30.0,
                    width: 30.0,
                    margin: EdgeInsets.only(left: 15.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                    child: Icon(
                      Icons.book,
                      size: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      title,
                      style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      number,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        time,
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
