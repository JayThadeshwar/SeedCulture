import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../db/DatabaseOps.dart';
import '../models/CUser.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:farmerapp/auth/components/rounded_button.dart';

class SellProducts extends StatefulWidget {
  @override
  SellProductsFormState createState() {
    return SellProductsFormState();
  }
}

TextEditingController cropNameController = new TextEditingController();
TextEditingController qtyController = new TextEditingController();
TextEditingController priceController = new TextEditingController();
TextEditingController descController = new TextEditingController();  
// Create a corresponding State class, which holds data related to the form.
class SellProductsFormState extends State<SellProducts> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  callSuccess(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: 'Product added',
      desc: 'Your product is added for selling',
      buttons: [
        DialogButton(
          child: Text(
            'OK',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
           Navigator.pop(context);          
          },

          width: 120,
        )
      ],
    ).show();
  }

  final _formKey = GlobalKey<FormState>();
  Widget customForm(){
        return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: cropNameController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.spa_rounded),
              hintText: 'Enter crop name',
              labelText: 'Crop Name',
              contentPadding: const EdgeInsets.all(17.0),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return 'Crop name cannot be empty';
              }
              return null;
            },
          ),
          TextFormField(
            controller: qtyController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.storage_sharp),
              hintText: 'Enter the quantity in kilograms',
              labelText: 'Quantity in kgs',
              contentPadding: const EdgeInsets.all(17.0),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter quantity of the product';
              }
              return null;
            },
          ),
          TextFormField(            
            controller: priceController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.money),
              hintText: 'Enter the cost',
              labelText: 'Price',
              contentPadding: const EdgeInsets.all(17.0),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter cost of the product';
              }
              return null;
            },
          ),
          TextFormField(
            maxLines:5,
            controller: descController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.description),
              hintText: 'Describe quality of crop',
              labelText: 'Description',
              contentPadding: const EdgeInsets.all(17.0),
            ),
            keyboardType: TextInputType.multiline,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter description of product';
              }
              return null;
            },
          ),
          Container(
              //padding: const EdgeInsets.only(left: 150.0, top: 70.0),
              margin: EdgeInsets.only(top:30),
              child: Center(
                child: RoundedButton(
                text: 'Submit',
                color: Color(0xff8eaee6),
                press: () {                  
                  if (_formKey.currentState.validate()) {                    
                    DatabaseOps.insertProductInDb(CUser.id,cropNameController.text,
                      qtyController.text,priceController.text,descController.text);
                    callSuccess(context);
                  }
                },
              )
              ),
            ),
        ],
      ),
      ),      
    );
  }


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      backgroundColor: Color(0xff00B0FF),
      resizeToAvoidBottomInset: false,      
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
                      "Product Details",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
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
                  child: customForm(),
                )
            ),

          ),

        ],
      ),
    );
  }
}