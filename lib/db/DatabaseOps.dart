import 'package:firebase_database/firebase_database.dart';
import '../models/CUser.dart';
import '../models/Items.dart';

final databaseReference = FirebaseDatabase.instance.reference();
class DatabaseOps{

	static void insertFarmerInDb(fullName,ano,cno,pass,dob,state,city,landSize){
	  databaseReference.child("users/farmer").push().set({    
	    'name': fullName,
	    'aadhar_no': ano,
	    'contact': cno,
	    'password': pass,
	    'dob': dob,
	    'state': state,
	    'city': city,
	    'landSize': landSize,
	    'name_pass': cno+"_"+pass
	  }); 
	}

	static Future<bool> verifyFarmer(String contact,String pass) async{
		bool res = false;
		var db = await FirebaseDatabase.instance.reference().child("users/farmer").orderByChild("name_pass").equalTo(contact+"_"+pass).once();
		Map<dynamic, dynamic> values = db.value;
		if(values!=null){
			values.forEach((key,values) {
				if(contact==values['contact'] && pass==values['password']){
					CUser.id = values['name_pass'];
					CUser.name = values['name'];
			    	CUser.aadharNo = values['aadhar_no'];
			    	CUser.contact = values['contact'];
			    	CUser.dob = values['dob'];
			    	CUser.state = values['state'];
			    	CUser.city = values['city'];
			    	CUser.landSize = int.parse(values['landSize']);			    	
			    	res = true;
				}		    	
			});
		}	
		return res;	     
	}

	static void insertProductInDb(fid,cropName,qty,price,desc){
	  databaseReference.child("product").push().set({    
	    'farmerId': fid,
	    'cropName': cropName,
	    'quantity': qty,
	    'price': price,
	    'description': desc
	  }); 
	} 

	static Future<List<Items>> getProductsFromDb() async{
	  	var products = await databaseReference.child("product").once();
	  	List<Items> productList;	 
	  	Map<dynamic, dynamic> values = products.value;
	  	if(values!=null){
			values.forEach((key,values) {
				productList.add(new Items(
					productid : values['farmerId'],
					productname : values['cropName'],
			    	desc : values['description'],
			    	cost : values['price'],			    	
			    	img: "assets/food.png"
				));						
			});
		}	
		return productList;
	} 

	static void insertCustomerInDb(fullName,email,con,pass){
	  databaseReference.child("users/customer").push().set({    
	    'name': fullName,
	    'email': email,
	    'contact': con,
	    'password': pass,	    
	    'email_pass': email+"_"+pass
	  }); 
	}

	static Future<bool> verifyCustomer(String email,String pass) async{
		bool res = false;
		var db = await FirebaseDatabase.instance.reference().child("users/customer").orderByChild("email_pass").equalTo(email+"_"+pass).once();
		Map<dynamic, dynamic> values = db.value;
		if(values!=null){
			values.forEach((key,values) {
				if(email==values['email'] && pass==values['password']){
					CUser.id = values['email_pass'];
					CUser.name = values['name'];
			    	CUser.contact = values['contact'];
			    	CUser.email = values['email'];			    	
			    	res = true;
				}		    	
			});
		}	
		return res;	     
	}
}