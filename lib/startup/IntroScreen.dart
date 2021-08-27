import 'package:flutter/material.dart';

import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import '../Constants.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        backgroundColor: Colors.blue[500],
        title: "Get online business",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "How often have you been asked, “What's your web address\" or \"Can I see your products online?”. Its time you answer those questions with your website. Create your digital footprint on the internet.",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Color(0xffc873f4),
        title: "Location based SEO",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "We optimize your website on Google so that it ranks better, gets noticed faster and generates more traffic that benefits your business.",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Color(0xff20d2bc),
        title: "Sell products online",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "We understand the value of your products. With websites you create through us, you can sell products online. Yes, Your own products on your own website.",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushReplacementNamed(context, loginRoute);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Text('Next',
        style: TextStyle(color: Colors.white), textScaleFactor: 1.5);
  }

  Widget renderDoneBtn() {
    return Text('Done',
        style: TextStyle(color: Colors.white), textScaleFactor: 1.5);
  }

  Widget renderSkipBtn() {
    return Text('Skip',
        style: TextStyle(color: Colors.white), textScaleFactor: 1.5);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      highlightColorSkipBtn: Colors.white,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      highlightColorDoneBtn: Colors.white,

      // Dot indicator
      colorDot: Color(0xffe8f0ff),
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      shouldHideStatusBar: false,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
