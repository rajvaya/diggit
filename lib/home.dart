import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:diggit/models/userModel.dart';
import 'package:diggit/models/meetsModel.dart';

import 'package:diggit/abstract.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future appFunction() async {
    User meet = await getTheUser();
    Meets info = await infoFoundUser(meet);
    return info;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: appFunction(),
        builder: (context, snapshot) {
          if (snapshot.hasData == true) {
            // print("BIO:" + snapshot.data.bio);
            return ListView(
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      color: Color.fromRGBO(30, 33, 37, 1),
                      height: 370,
                    ),
                    Positioned(
                      top: 330,
                      height: 150,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bio',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                            Text(
                              '${snapshot.data.bio ?? "Oops I don't have a bio"}',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[800],
                                blurRadius: 30,
                              )
                            ],
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    Positioned(
                      left: 42,
                      top: 85,
                      child: Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data.avatarUrl)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 25,
                                spreadRadius: 10)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      bottom: 120,
                      child: Text(
                        'Hi I am,',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 30),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      bottom: 75,
                      child: Text(
                        '${snapshot.data.name}',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 150, left: 45),
                  child: Text(
                    'People',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 35, right: 35),
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('${snapshot.data.followers}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text('Followers',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ]),
                      ),
                      VerticalDivider(
                        indent: 8,
                        endIndent: 8,
                        width: 2,
                        color: Color.fromRGBO(30, 33, 37, 1),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('${snapshot.data.following}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text('Following',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ]),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey[500], blurRadius: 20)
                      ],
                      borderRadius: BorderRadius.circular(12)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 35, left: 45),
                  child: Text(
                    'Repositories',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: 20, left: 35, right: 12, bottom: 15),
                          height: 150,
                          width: 230,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[500], blurRadius: 20)
                              ]),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 20, right: 12, bottom: 15),
                          height: 150,
                          width: 230,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[500], blurRadius: 20)
                              ]),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 20, right: 12, bottom: 15),
                          height: 150,
                          width: 230,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[500], blurRadius: 20)
                              ]),
                        ),
                      ],
                    ))
              ],
            );
          } else if (snapshot.hasData == false) {
            return Container(
                child: Center(
              child: Text('Not Found',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.red)),
            ));
          } else if (snapshot.connectionState == ConnectionState.active) {
            return Container(
                child: Center(
                    child: Text('Trying to find you a new friend',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w400))));
          } else {
            return Container(
                child: Center(
                    child: Text("Let's wait",
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w400))));
          }
        },
      ),
    );
  }
}
