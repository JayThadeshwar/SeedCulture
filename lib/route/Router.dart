import 'package:flutter/material.dart';

import '../startup/MySplashScreen.dart';
import '../startup/IntroScreen.dart';
import '../auth/LoginPage.dart';
import '../auth/LoginFarmer.dart';
import '../auth/SignUpPage.dart';
import '../auth/SignUpFarmer.dart';
//import '../auth/SignUpAdditional.dart';
import '../screens/Dashboard.dart';
import '../Constants.dart';
import '../screens/SellProducts.dart';
//import '../screens/ProductListing.dart';
import '../screens/CustomerDashboard.dart';
import '../screens/AboutUs.dart';
import '../screens/CustProductListing.dart';
import '../screens/RazorpayImpl.dart';
import '../screens/WebViewExample.dart';
import '../auth/welcome_screen.dart';


class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => MySplashScreen());
        break;
      case introRoute:
        return MaterialPageRoute(builder: (_) => IntroScreen());
        break;      
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case loginFarmerRoute:
        return MaterialPageRoute(builder: (_) => LoginPageFarmer());
        break;
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
        break;
      case signUpFarmerRoute:
        return MaterialPageRoute(builder: (_) => SignUpPageFarmer());
        break;
      case dashboardRoute:
        int data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => Dashboard(data));
        break;
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
        break;
      case sellProductRoute:
        return MaterialPageRoute(builder: (_) => SellProducts());
        break;
      case customerDashboardRoute:
        return MaterialPageRoute(builder: (_) => CustomerDashboard());
        break; 
      case customerProductListingRoute:
        return MaterialPageRoute(builder: (_) => CustProductListing());
        break;
      case razorpayPaymentRoute:
        int data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => RazorpayImpl(data));
        break;
      case webViewRoute:
        return MaterialPageRoute(builder: (_) => WebViewExample());
        break;
      // case productListingRoute:
      //   return MaterialPageRoute(builder: (_) => ProductListing());
      //   break;
      case aboutUsRoute:
        int data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => AboutInfo(data));
        break;        
      default:
        return MaterialPageRoute(builder: (_) => Text('No route found'));
    }
  }
}
