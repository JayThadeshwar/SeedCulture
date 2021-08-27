class Farmer {
  String name;
  String aadharNo;
  String contact;
  String password;
  String dob;
  String state;
  String city;
  String name_pass;
  int landSize;

  Farmer(
      {this.name,
      this.aadharNo,
      this.contact,
      this.password,
      this.dob,
      this.state,
      this.city,
      this.landSize,
      this.name_pass});

  Farmer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    aadharNo = json['aadhar_no'];
    contact = json['contact'];
    password = json['password'];
    dob = json['dob'];
    state = json['state'];
    city = json['city'];
    landSize = json['land_size'];
    name_pass = json['name_pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['aadhar_no'] = this.aadharNo;
    data['contact'] = this.contact;
    data['password'] = this.password;
    data['dob'] = this.dob;
    data['state'] = this.state;
    data['city'] = this.city;
    data['land_size'] = this.landSize;
    data['name_pass'] = this.name_pass;
    return data;
  }
}
