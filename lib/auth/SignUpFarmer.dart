import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/Farmer.dart';

import 'SignUpAdditional.dart';
import '../Constants.dart';
import 'package:farmerapp/auth/components/background.dart';

class SignUpPageFarmer extends StatefulWidget {
  SignUpPageFarmer({Key key}) : super(key: key);

  @override
  _SignUpPageFarmerState createState() => new _SignUpPageFarmerState();
}
final databaseReference = FirebaseDatabase.instance.reference();

void insertFarmerInDb(fullName,ano,cno,pass){
  databaseReference.child("farmer").push().set({    
    'name': fullName,
    'aadhar_no': ano,
    'contact': cno,
    'password': pass
  }); 
}

class _SignUpPageFarmerState extends State<SignUpPageFarmer> {
  static final _formKey = GlobalKey<FormState>();

  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();
  final FocusNode myFocusNodeContact = FocusNode();

  TextEditingController signContactController = new TextEditingController();
  TextEditingController signNameController = new TextEditingController();
  TextEditingController signEmailController = new TextEditingController();
  TextEditingController signPasswordController = new TextEditingController();

  bool _autoValidate = false;
  bool _obscureTextLogin = true;

  ScrollController _scroll;

  @override
  void initState() {
    super.initState();
    _scroll = new ScrollController();
    myFocusNodeEmail.addListener(() {
      _scroll.animateTo(-2.0,
          duration: Duration(seconds: 1), curve: Curves.ease);
      setState(() {});
    });
    myFocusNodePassword.addListener(() {
      _scroll.animateTo(-2.0,
          duration: Duration(seconds: 1), curve: Curves.ease);
      setState(() {});
    });
    myFocusNodeName.addListener(() {
      setState(() {});
    });
    myFocusNodeContact.addListener(() {
      _scroll.animateTo(-2.0,
          duration: Duration(seconds: 1), curve: Curves.ease);
      setState(() {});
    });
  }

  @override
  void dispose() {
    myFocusNodeEmail.dispose();
    myFocusNodePassword.dispose();
    super.dispose();
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
        child: Center(
          child: ListView(
            controller: _scroll,
            children: [
              Container(                
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text('Create farmer account',
                                  textScaleFactor: 1.8,
                                  style: GoogleFonts.merriweather(),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Colors.blue[900])),
                                  color: Colors.blue[700],
                                  label: Text(
                                    'SIGN UP WITH FACEBOOK',
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
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton.icon(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.lightBlue[600])),
                                  color: Colors.lightBlue[400],
                                  label: Text('SIGN UP WITH GOOGLE',
                                      style: GoogleFonts.merriweather(
                                          textStyle:
                                              TextStyle(color: Colors.white))),
                                  icon: FaIcon(FontAwesomeIcons.google,
                                      color: Colors.white),
                                  onPressed: () {}),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child:
                                      Divider(color: Colors.grey, thickness: 1),
                                ),
                                Expanded(
                                  child:
                                      Text('OR', textAlign: TextAlign.center),
                                ),
                                Expanded(
                                  flex: 4,
                                  child:
                                      Divider(color: Colors.grey, thickness: 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  focusNode: myFocusNodeName,
                                  controller: signNameController,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintStyle: GoogleFonts.merriweather(
                                        textStyle: TextStyle(
                                            fontSize:
                                                _autoValidate == true ? 13 : 15,
                                            color: Colors.grey[600]),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
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
                                            color: Colors.black, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      hintText: 'Enter your full name',
                                      labelText: 'Full Name',
                                      labelStyle: GoogleFonts.merriweather()),
                                  validator: (val) =>
                                      val.isEmpty ? 'Name is required' : null,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  focusNode: myFocusNodeEmail,
                                  controller: signEmailController,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintStyle: GoogleFonts.merriweather(
                                        textStyle: TextStyle(
                                            fontSize:
                                                _autoValidate == true ? 13 : 15,
                                            color: Colors.grey[600]),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
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
                                            color: Colors.black, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      hintText: 'Enter your Aadhar number',
                                      labelText: 'Aadhar number',
                                      labelStyle: GoogleFonts.merriweather()),
                                  keyboardType: TextInputType.number,
                                  validator: (val) =>
                                      val.isEmpty ? 'Aadhar number is required' : (val.length!=12 ? 'Invalid Aadhar number' : null),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  focusNode: myFocusNodeContact,
                                  controller: signContactController,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintStyle: GoogleFonts.merriweather(
                                        textStyle: TextStyle(
                                            fontSize:
                                                _autoValidate == true ? 13 : 15,
                                            color: Colors.grey[600]),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
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
                                            color: Colors.black, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      hintText: 'Enter your contact number',
                                      labelText: 'Contact Number',
                                      labelStyle: GoogleFonts.merriweather()),
                                  keyboardType: TextInputType.number,
                                  validator: (val) => val.isEmpty
                                      ? 'Contact number is required'
                                      : null,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  obscureText: _obscureTextLogin,
                                  focusNode: myFocusNodePassword,
                                  controller: signPasswordController,
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
                                          fontSize:
                                              _autoValidate == true ? 13 : 15,
                                          color: Colors.grey[600]),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red[900], width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    hintText: 'Enter your Password',
                                    labelText: 'Password',
                                    labelStyle: GoogleFonts.merriweather(),
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
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Colors.blue[800])),
                                    color: Colors.blue,
                                    child: Text(
                                      'CREATE ACCOUNT',
                                      style: GoogleFonts.merriweather(
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        print('Valid user');
                                        // insertFarmerInDb(
                                        //   signNameController.text,
                                        //   signEmailController.text,
                                        //   signContactController.text,
                                        //   signPasswordController.text
                                        // ); 
                                        
                                        Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => MyCustomForm(
                                            signNameController.text,signEmailController.text,
                                            signContactController.text,signPasswordController.text
                                          )));
                                      } else {
                                        setState(() {
                                          _autoValidate = true;
                                        });
                                      }
                                    }),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Text.rich(
                                  TextSpan(
                                    text: 'By signing up, you agree to the ',
                                    style: GoogleFonts.merriweather(),
                                    children: [
                                      TextSpan(
                                          text: 'Terms of Service',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              print('Terms and service');
                                            }),
                                    ],
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
