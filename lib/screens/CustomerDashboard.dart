import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants.dart';
import '../models/CUser.dart';
import '../db/DatabaseOps.dart';

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}

class CustomerDashboard extends StatefulWidget {
  @override
  CustomerDashboardState createState() {
    return CustomerDashboardState();
  }
}
// Create a corresponding State class, which holds data related to the form.
class CustomerDashboardState extends State<CustomerDashboard> {
  Items item1 = new Items(
      title: "Products",
      subtitle: "List of products",
      event: "",
      img: "assets/todo.png");

  Items item2 = new Items(
    title: "Tracking",
    subtitle: "Order placed",
    event: "",
    img: "assets/shopping.png",
  );
  // Items item3 = new Items(
  //   title: "View",
  //   subtitle: "Cart",
  //   event: "",
  //   img: "assets/shopping.png",
  // );
  


 @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2];
    var color = 0xff000000;
    return Scaffold(
      backgroundColor: Color(0xff00B0FF),
      body: Column(
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
                      "Welcome,",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      CUser.name,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600)),
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
                    padding: EdgeInsets.all(40),
                    child: GridView.count(
          childAspectRatio: 1.8,
          crossAxisCount: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
          children: List.generate(myList.length,(index){
            return InkWell(
              child: Container(
                padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    myList[index].img,
                    width: 42,
                  ),
                  Text(
                    myList[index].title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    myList[index].subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                  Text(
                    myList[index].event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
              onTap:(){
                if(index == 0){
                  Navigator.pushNamed(context,customerProductListingRoute);                      
                } else if(index==1){
                  Navigator.pushNamed(context,webViewRoute);                      
                }
              }
            );            
          }),
        ), 
  
                  )
            ),

          ),

        ],
      ),
    );
  }
}