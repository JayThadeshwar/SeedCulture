import 'package:flutter/material.dart';
import '../../Constants.dart';

import 'package:farmerapp/auth/SignUpPage.dart';
import 'package:farmerapp/auth/LoginPage.dart';
import 'package:farmerapp/auth/LoginFarmer.dart';
import 'package:farmerapp/auth/components/background.dart';
import 'package:farmerapp/auth/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[            
            Text(
              "Welcome to SeedCulture!",
              textAlign:TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "FARMER",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPageFarmer();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "CUSTOMER",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
