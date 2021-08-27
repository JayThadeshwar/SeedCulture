// import 'package:flutter/material.dart';
// import '../db/DatabaseOps.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ProductListing extends StatefulWidget {
//   final String title;
//   ProductListing({Key key, this.title}) : super(key: key);

//   @override
//   _ProductListingState createState() => _ProductListingState();
// }

// class _ProductListingState extends State<ProductListing> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//   var color = 0xff000000;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: StreamBuilder(
//           stream: DatabaseOps.getProductsFromDb(),
//           builder: (context,snapshot){
//             if(snapshot.hasData){
//               return GridView.count(
//           childAspectRatio: 1.7,
//           crossAxisCount: 1,
//           crossAxisSpacing: 18,
//           mainAxisSpacing: 18,
//           children: List.generate(snapshot.data.length,(index){
//             return InkWell(
//               child: Container(
//               decoration: BoxDecoration(
//                   color: Color(color), borderRadius: BorderRadius.circular(10)),
//               child: Column(

//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.asset(
//                     snapshot.data.img,
//                     width: 42,
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   Text(
//                     snapshot.data.productname,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     snapshot.data.desc,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   Text(
//                     snapshot.data.cost,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ],
//               ),
//             ),
//               onTap:(){
//                 if(index == 0){
//                 //    Navigator.pushNamed(context,customerProductListingRoute);  
//                 }
//               }
//             );            
//           }),
//         );
//             }
//             return CircularProgressIndicator();
//           }
//         ),
//       ),
//     );
//   }
// }
