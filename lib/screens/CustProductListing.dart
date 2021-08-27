import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/Items.dart';
import '../db/DatabaseOps.dart';
import '../Constants.dart';

class CustProductListing extends StatefulWidget {
  @override
  CustomerProductState createState() {
    return CustomerProductState();
  }
}
// Create a corresponding State class, which holds data related to the form.
class CustomerProductState extends State<CustProductListing> {
  List<Items> productList = [];
    refresh(context) {    
    return FutureBuilder(
      future: getProductsFromDb(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        if (snapshot.data == null) {
          return Center(
              child: CircularProgressIndicator(),          
          );
        }
        else if(snapshot.data.length==0)
        {
          return Center(
            child : Text('No data exitsts',textScaleFactor:1.7,textAlign: TextAlign.center),
            );
        }
         else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return makeTiles(snapshot.data[index]);
            },
          );
        }
      },
    );
  }
  Widget makeTiles(var item){

    return Card(
      child: ListTile(
        isThreeLine: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),        
        leading: Image.asset(
          'assets/food.png',
          width:40          
        ),
        title: Text(
          item.productname==null ? '' : item.productname,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Row(
          children: <Widget>[
            Text(item.desc==null ? '' : item.desc+"\n\nPrice: "+item.cost+"/kg", style: TextStyle(color: Colors.black)),
          ],
        ),
        onTap: (){
          Navigator.pushNamed(context,razorpayPaymentRoute,arguments:int.parse(item.cost));
        },
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 40.0)),

    );    
  }


Widget makeCard(var item){
  var color = 0xff000000;
  return InkWell(
    child: Container(
    decoration: BoxDecoration(
        color: Color(color), borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          item.img,
          width: 42,
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          item.productname,
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
          item.desc == null ? '' : item.desc,
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          item.cost,
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
      Navigator.pushNamed(context,razorpayPaymentRoute,arguments:int.parse(item.cost));
    }
  );
}

  
  getProductsFromDb() async{
      var products = await databaseReference.child("product").once();
         
      Map<dynamic, dynamic> values = products.value;
      if(values!=null){
      values.forEach((key,values) {
        if(values['farmerId']!=null){
          productList.add(new Items(
            productid : values['farmerId'],
            productname : values['cropName'],
              desc : values['description'],
              cost : values['price'],           
              img: "assets/food.png"
          ));
        }                  
      });
    } 
    return productList;
  } 

  @override
  Widget build(BuildContext context) {
    Future<List<Items>> myList = DatabaseOps.getProductsFromDb();  
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: refresh(context)
    );
             
  }

}