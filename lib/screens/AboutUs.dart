import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:farmerapp/drawer/AppDrawer.dart';
import '../models/CUser.dart';

class AboutInfo extends StatefulWidget {
  final int screenIndex;
  AboutInfo(this.screenIndex);

  @override
  AboutInfoState createState() {
    return AboutInfoState();
  }
}
class AboutInfoState extends State<AboutInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
        backgroundColor: Color(0xff00B0FF),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Account Details",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 4,
                      ),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  ),

                  child:
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
            child: Container(
              height: 350,
              child: Column(
                children:[
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(30),
                      children: <Widget>[
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundColor: Colors.black,
                          child: Icon(Icons.person, color: Colors.white, size: 50),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(30),
                          children: [
                            Expanded(
                              child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text("Name:   "+CUser.name,
                                  style: GoogleFonts.bitter(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  textScaleFactor: 1.5),
                            ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text("Aadhar Number:   "+CUser.aadharNo,
                                  style: GoogleFonts.bitter(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  textScaleFactor: 1.5),
                            ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text('Phone number:   +91'+CUser.contact,
                                  style: GoogleFonts.bitter(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  textScaleFactor: 1.5),
                            ),
                            ),
                  ],
                  ),
                  ),
                ],
              ),
            ),
          ),
                  )
              ),

            ),

          ],
        ),
        
        ),
      );
  }
}





