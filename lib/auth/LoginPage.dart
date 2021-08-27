import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../db/DatabaseOps.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constants.dart';
import 'package:farmerapp/auth/components/background.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  static final _formKey = GlobalKey<FormState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _autoValidate = false;
  bool _obscureTextLogin = true;

  String _loginLabelText = 'Password';

  ScrollController _scroll;

  @override
  void initState() {
    super.initState();
    myFocusNodeEmailLogin.addListener(() {
      setState(() {});
    });
    myFocusNodePasswordLogin.addListener(() {
      setState(() {});
    });
    _scroll = new ScrollController();
    myFocusNodePasswordLogin.addListener(() {
      _scroll.animateTo(0.0,
          duration: Duration(seconds: 1), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    myFocusNodeEmailLogin.dispose();
    myFocusNodePasswordLogin.dispose();
    super.dispose();
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  callError(context){
    return Alert(
      context: context,
      type: AlertType.error,
      title: "Login unsuccessful",
      desc: "Either username or password is incorrect",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: ListView(
        controller: _scroll,
        children: [
          Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       colorFilter: new ColorFilter.mode(
            //           Colors.black.withOpacity(0.1), BlendMode.darken),
            //       image: AssetImage("assets/loginBg.jpeg"),
            //       fit: BoxFit.cover),
            // ),
            height: MediaQuery.of(context).size.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Center(
                child: Stack(
                  children: [
                    Column(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Center(
                                    child: Text(
                                      'Login as Customer',
                                      textScaleFactor: 2.0,
                                      style: GoogleFonts.merriweather(
                                        textStyle: TextStyle(
                                            color: Colors.black,),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: RaisedButton.icon(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.blue[900])),
                                      color: Colors.blue[700],
                                      label: Text(
                                        'LOGIN WITH FACEBOOK',
                                        style: GoogleFonts.merriweather(
                                            textStyle:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      icon: FaIcon(FontAwesomeIcons.facebook,
                                          color: Colors.white),
                                      onPressed: () {}),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: RaisedButton.icon(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.lightBlue[600])),
                                      color: Colors.lightBlue[400],
                                      label: Text('LOGIN WITH TWITTER',
                                          style: GoogleFonts.merriweather(
                                              textStyle: TextStyle(
                                                  color: Colors.white))),
                                      icon: FaIcon(FontAwesomeIcons.twitter,
                                          color: Colors.white),
                                      onPressed: () {}),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(7.0),
                                child:
                                    Divider(thickness: 1.0, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text('Login using your account',
                                        textScaleFactor: 1.5,
                                        style: GoogleFonts.merriweather(
                                          textStyle: TextStyle(
                                              color: Colors.black,),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: TextFormField(
                                      focusNode: myFocusNodeEmailLogin,
                                      controller: loginEmailController,
                                      decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintStyle: GoogleFonts.merriweather(
                                            textStyle: TextStyle(
                                                fontSize: _autoValidate == true
                                                    ? 13
                                                    : 15,
                                                color: Colors.grey[600]),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          hintText: 'Enter your Username',
                                          labelText: 'Username',
                                          labelStyle: GoogleFonts.merriweather(
                                              textStyle: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (val) => val.isEmpty
                                          ? 'Username is required'
                                          : null,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: TextFormField(
                                      obscureText: _obscureTextLogin,
                                      focusNode: myFocusNodePasswordLogin,
                                      controller: loginPasswordController,
                                      decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        fillColor: Colors.white,
                                        filled: true,
                                        suffixIcon: GestureDetector(
                                          onTap: _toggleLogin,
                                          child: Icon(
                                            _obscureTextLogin
                                                ? FontAwesomeIcons.eyeSlash
                                                : FontAwesomeIcons.eye,
                                            size: 18.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        hintStyle: GoogleFonts.merriweather(
                                          textStyle: TextStyle(
                                              fontSize: _autoValidate == true
                                                  ? 13
                                                  : 15,
                                              color: Colors.grey[600]),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red[900],
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        hintText: 'Enter your Password',
                                        labelText: _loginLabelText,
                                        labelStyle: GoogleFonts.merriweather(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      validator: (val) => val.isEmpty
                                          ? 'Password is required'
                                          : null,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Colors.blue[800])),
                                        color: Colors.blue,
                                        child: Text(
                                          'LOGIN',
                                          style: GoogleFonts.merriweather(
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        onPressed: () async{
                                          if (_formKey.currentState
                                              .validate()) {
                                            bool res = await DatabaseOps.verifyCustomer(loginEmailController.text,loginPasswordController.text);                                       
                                            if(res==true){
                                              Navigator.pushReplacementNamed(
                                                context, customerDashboardRoute);  
                                            } else{
                                              callError(context);
                                            }                                                                                        
                                          } else {
                                            setState(() {
                                              _autoValidate = true;
                                            });
                                          }
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text("Don't have an account yet?",
                                          style: GoogleFonts.bitter(
                                            textStyle:
                                                TextStyle(color: Colors.black),
                                          )),
                                      Spacer(),
                                      InkWell(
                                          child: Text('Create account',
                                              style: GoogleFonts.merriweather(
                                                textStyle: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.black),
                                              )),
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, signUpRoute);
                                          }),
                                    ],
                                  ),
                                ),
                                Expanded(flex: 2, child: Container()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
