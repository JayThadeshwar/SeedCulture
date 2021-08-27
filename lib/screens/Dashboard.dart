import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:farmerapp/drawer/AppDrawer.dart';
import '../Constants.dart';


class Dashboard extends StatefulWidget {
  final int screenIndex;
  Dashboard(this.screenIndex);

  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget displayCard(IconData ic, String title, String count, int colorCode) {
    return InkWell(
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 7,
          color: Color(colorCode),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(ic, color: Colors.white70),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(title,
                              style: GoogleFonts.merriweather(
                                textStyle: TextStyle(color: Colors.white),
                                fontSize: 12
                              ))),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.black26),
              Text(
                count,
                textScaleFactor: 1.6,
                style: GoogleFonts.merriweather(
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        onTap: () {});
  }

  Widget schemeCard(String header, String content, String footer,
      Color cardColor, Color buttonColor, Color fontColor,String path) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: cardColor,
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),

            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
                color: buttonColor,
              ),
              child: InkWell(
                onTap: () {
                  if(path!=null)
                    Navigator.pushNamed(context,path);    
                },
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(footer,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.merriweather(
                              //  textStyle: TextStyle(color: fontColor),
                                  textStyle: TextStyle(fontSize: 18.0),
                              ))),
                    ),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.arrow_forward_ios, color: fontColor)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.agriculture),
          label: Text('Sell products'),          
          onPressed: () {            
            Navigator.pushNamed(context,sellProductRoute); 
          },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      drawer: AppDrawer(widget.screenIndex),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: [
                SizedBox(height: 10),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex:3,
                            child: Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Text('STATS AT GLANCE',
                                  style: GoogleFonts.bitter(
                                    textStyle: TextStyle(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  textScaleFactor: 2),
                            ),
                          ),

                          Expanded(
                            flex:4,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: displayCard(
                                        Icons.trending_up, 'Agro Growth', '45%', 0xff6a90f0),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: displayCard(Icons.shopping_cart,
                                          'Products', '100', 0xff5cc2d2)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: displayCard(
                                        Icons.agriculture, 'Production', '3 ton', 0xffe8769e),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: displayCard(Icons.money, 'Profit',
                                          '25%', 0xff58d29e)),
                                ),
                              ],
                            ),
                          ),                                                    
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex:1,
                      child: Container(),
                  ),
      ],
            ),
    ),
    ),
      ),
    );
  }
}
