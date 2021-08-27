import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:farmerapp/auth/components/rounded_button.dart';

class RazorpayImpl extends StatefulWidget {
  final int cost;
  RazorpayImpl(this.cost);
  @override
  RazorpayImplState createState() => new RazorpayImplState();
}

class RazorpayImplState extends State<RazorpayImpl> {
  int totalAmt = 0;
  Razorpay _razorPay;

  @override
  void initState() {
    super.initState();
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorPay.clear();
  }

  void openCheckout() async{
    var options = {
      'key': 'rzp_test_Cnt8xOyxxKL0sZ',
      'amount': totalAmt*100,
      'name': 'CottonSeedOP',
      'description': 'Payment',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try{
      _razorPay.open(options);
    }
    catch(e){
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: "+ response.paymentId);
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "ERROR: "+ response.code.toString()+" - " + response.message);
  }
  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL WALLET: "+ response.walletName);
  }

  TextEditingController qtyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product payment'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.fromLTRB(10,2,10,2),
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),
                 border: Border.all(color: Colors.blue)
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Enter quantity in kilograms(kg)",
                ),
                controller: qtyController,
                onChanged: (value){
                  setState(() {
                      totalAmt = num.parse(value)*widget.cost;
                  });
                }
              ),
            ),
          ),
          
          SizedBox(
            height: 30,
          ),

          RoundedButton(
            text: 'Make Payment',
            press: () {
              openCheckout();
            },
          ),
          // RaisedButton(
          //   onPressed:() {
          //     openCheckout();
          //   },
          //   child: Text("Make Payment"),
          // )
        ],
      ),
    );
  }
}
