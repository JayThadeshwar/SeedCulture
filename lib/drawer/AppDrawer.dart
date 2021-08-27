import 'package:flutter/material.dart';
import '../Constants.dart';
import '../models/CUser.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AppDrawer extends StatefulWidget {
  final int appDrawerIndex;
  AppDrawer(this.appDrawerIndex);

  @override
  _AppDrawerState createState() => new _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        child: Drawer(
          elevation: 5,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(CUser.name, style: TextStyle(fontSize: 18)),
                //accountEmail: Text(CUser.contact),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    CUser.name.substring(0,1),
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              _createDrawerItem(context, Icons.dashboard, 'Home', 1),
              _createDrawerItem(context, Icons.account_box, 'Account', 2),
              // _createDrawerItem(
              //     context, Icons.business_center, 'Transaction Details', 3),
              _createDrawerItem(context, Icons.add_location_alt, 'Tracking', 4),
              _createDrawerItem(context, Icons.logout, 'Log Out', 8),
            ],
          ),
        ),
      )
    );
  }

  // areYouSure(context){
  //   return Alert(
  //     context: context,
  //     type: AlertType.warning,
  //     title: "Logout from account",
  //     desc: "Are you sure you want to logout?",
  //     buttons: [
  //       DialogButton(
  //         child: Text(
  //           "Yes",
  //           style: TextStyle(color: Colors.white, fontSize: 20),
  //         ),
  //         onPressed: () => Navigator.popUntil(context,ModalRoute.withName('/WelcomeScreen')),
  //         color: Color.fromRGBO(0, 179, 134, 1.0),
  //       ),
  //       DialogButton(
  //         child: Text(
  //           "No",
  //           style: TextStyle(color: Colors.white, fontSize: 20),
  //         ),
  //         onPressed: () => Navigator.pop(context),
  //         gradient: LinearGradient(colors: [
  //           Color.fromRGBO(116, 116, 191, 1.0),
  //           Color.fromRGBO(52, 138, 199, 1.0)
  //         ]),
  //       )
  //     ],
  //   ).show();
  // }

  Widget _createDrawerItem(
      BuildContext context, IconData lead, String text, int index) {
    return Card(
      elevation: 3,
      color: index == widget.appDrawerIndex ? Colors.blue[100] : Colors.white,
      child: ListTile(
        leading: Icon(lead,
            color:
                index == widget.appDrawerIndex ? Colors.blue : Colors.black54),
        title: textStyler(text, index),
        onTap: () {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, dashboardRoute,
                arguments: 1);
          } else if (index == 2) {
            Navigator.pushNamed(context, aboutUsRoute,
                arguments: 2);
          } else if (index == 4) {
            Navigator.pushNamed(context, webViewRoute,
                arguments: 4);
          } else if (index == 8) {
             Navigator.pushReplacementNamed(context, welcomeRoute);
          }
        },
      ),
    );
  }

  Widget textStyler(String textToStyle, int index) {
    Text styledText;
    if (index == widget.appDrawerIndex) {
      styledText = Text(
        textToStyle,
        style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),
      );
    } else {
      styledText = Text(textToStyle);
    }
    return styledText;
  }
}
