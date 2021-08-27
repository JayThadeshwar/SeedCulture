import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants.dart';
import '../db/DatabaseOps.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class MyCustomForm extends StatefulWidget {
  final String name,aadhar,con,pass;
  MyCustomForm(this.name,this.aadhar,this.con,this.pass);
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {

  TextEditingController dobController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController stateController = new TextEditingController();
  TextEditingController landSizeController = new TextEditingController();

  DateTime _date= DateTime.now();
  Future<Null> selectDate(BuildContext Context) async{
    final DateTime picked= await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1910),
      lastDate: DateTime(2002),
    );
    if(picked!=null&&picked!=_date)
    {
      setState(() {
        _date=picked;
        print(_date.toString());
      });
    }
  }

  Widget makeForm(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your certificate Number',
              labelText: 'Farmer Certficate Number',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a valid certificate number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: dobController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
              contentPadding: const EdgeInsets.all(20.0),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid date(dd-mm-yyyy)';
              }
              return null;
            },
          ),
          /*IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: (){
              selectDate(context);
            },
          ),*/
          TextFormField(
            controller: cityController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.location_city),
              hintText: 'Enter your city',
              labelText: 'City',
              contentPadding: const EdgeInsets.all(20.0),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid input';
              }
              return null;
            },
          ),
          TextFormField(
            controller: stateController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.account_balance_sharp),
              hintText: 'Enter your state',
              labelText: 'State',
              contentPadding: const EdgeInsets.all(20.0),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid input';
              }
              return null;
            },
          ),
          TextFormField(
            controller: landSizeController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.landscape),
              hintText: 'Enter your land size',
              labelText: 'Land Size (in acres)',
              contentPadding: const EdgeInsets.all(20.0),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a valid number input';
              }
              return null;
            },
          ),
          new Container(
              // padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              margin: EdgeInsets.only(top:10),
              child: Center(
                child: RaisedButton(
                child: const Text('Submit'),
                onPressed: () {
                  // It returns true if the form is valid, otherwise returns false
                  if (_formKey.currentState.validate()) {

                    DatabaseOps.insertFarmerInDb(widget.name,widget.aadhar,widget.con,widget.pass,
                    dobController.text,stateController.text,
                    cityController.text,landSizeController.text);
                    // If the form is valid, display a Snackbar.
                    // Scaffold.of(context)
                    //     .showSnackBar(SnackBar(content: Text('Sign up successful')));
                    callSuccess(context);
                    //Navigator.pop(context);
                  }
                },
              )),
              ),
        ],
      ),
    );
  }


  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  callSuccess(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: 'Registration complete',
      desc: 'Farmer registered successfully in our portal',
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

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      backgroundColor: Color(0xff00B0FF),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column( 
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
                        "Additional Details",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
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
              height: 20,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: SingleChildScrollView(
                      child: makeForm(),
                    ),
                  )
                  
              ),

            ),

          ],
        ),
      ),
    );        
  }
}