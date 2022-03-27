import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:softonauts_assignment/signinpage.dart';
import 'package:http/http.dart' as http;

import 'dropincenter.dart';

Future<void> registerUser(var fname, var mnam, var lnam, var email,
    var paswd, var birthdat, var contact, var ssndigit, var adrson,
    var adrstw, var city, var state, var zipcode, var gender, var logintyp) async {
  final response = await http.post(
    Uri.parse('https://softonauts.com/clients/Android/get-drop-in-navigator-list'),
    headers: <String, String>{
      'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.By2r2BwheJsbrEGrHOaMQwrrmlY7wHVFzWtuEmv39fM',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'first_name': fname,
      'middle_name': mnam,
      'last_name': lnam,
      'dob': birthdat,
      'gender': gender,
      'contact_number': contact,
      'email': email,
      'address_one': adrson,
      'address_two': adrstw,
      'city': city,
      'state': state,
      'zipcode': zipcode,
      'password': paswd,
      'login_type': logintyp,
      'ssn_digits': ssndigit
    }
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
     return ;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
enum GenderType { male, female, notDisclosed }
void main() => runApp(SignUPPage());


class SignUPPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUPPageState();
  }
}
class _SignUPPageState extends State<SignUPPage> {
  int _respSignUp = 0;
  GenderType _typegen = GenderType.male;
  TextEditingController nameController = TextEditingController();
  TextEditingController midlenameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController ssnController = TextEditingController();
  TextEditingController adrsoneController = TextEditingController();
  TextEditingController adrstwoController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();

  _register(){


     var fnam =nameController.text;
     var mnamm= midlenameController.text;
    var lnamm = lastnameController.text;
     var birth =birthdateController.text;
     var gender ='Female';
     var contact =contactController.text;
     var email =emailController.text;
     var adrson =adrsoneController.text;
     var adrstw =adrstwoController.text;
     var city =cityController.text;
     var stat =stateController.text;
    var zip =zipcodeController.text;
    var paswd =passwordController.text;
    var logintyp ='internal';
    var ssn =ssnController.text;


     var res = registerUser(fnam, mnamm ,lnamm,birth,gender,contact,
         email,adrson,adrstw,city,stat,zip,paswd,logintyp,ssn);

     var body = res.toString();

   }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange.shade50,


          body: SingleChildScrollView(


              child: Container(
                  color: Colors.orange.shade50,
                  alignment: Alignment.center,

                  child: Card(
                    margin: const EdgeInsets.all(20.0),
                    color: Colors.white,
                    elevation: 30.0,
                    child:Wrap(

                      children: <Widget>[

                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 16,
                                  color: Colors.black87),
                            )
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),

                          height: 90,
                          child: TextField(

                            controller: nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'First Name',
                              hintStyle: TextStyle(color: Colors.black26),

                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: midlenameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Middle Name',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: lastnameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: birthdateController,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'BirthDate',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: contactController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Contact No',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: ssnController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'SSN (Last 4 Digit)',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: adrsoneController,
                            keyboardType: TextInputType.streetAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Address1',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),


                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: adrstwoController,
                            keyboardType: TextInputType.streetAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Address2',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: cityController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'City',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: stateController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'State',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 90,
                          child: TextField(

                            controller: zipcodeController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Zipcode',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                        ),

                        Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('Male'),
                              leading: Radio(
                                value: GenderType.male,
                                groupValue: _typegen,
                                onChanged: (value) {
                                  setState(() {
                                    _typegen = GenderType.male;
                                  }
                                  );
                                },
                              ),
                            ),
                            ListTile(

                              title: const Text('Female'),
                              leading: Radio(
                                value: GenderType.female,
                                groupValue: _typegen,
                                onChanged: (value) {
                                  setState(() {
                                    _typegen = GenderType.female;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Not Disclosed'),
                              leading: Radio(
                                value: GenderType.notDisclosed,
                                groupValue: _typegen,
                                onChanged: (value) {
                                  setState(() {
                                    _typegen = GenderType.notDisclosed;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(

                            width: double.infinity,
                            height: 70,
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: ElevatedButton(

                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent)),
                              child: const Text('Sign Up'),

                              onPressed: () {
                                _register();
                                _gotoDropin(context);

                              },
                            )
                        ),

                        Container(
                          child:Row(
                            children: [

                              Align(

                                alignment: Alignment.bottomLeft,
                                child:TextButton(


                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));

                                  },

                                  child: const Text('Sign In',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    //  textAlign:  TextAlign.right//TextStyle
                                  ),

                                ),

                              ),


                            ],


                          ),


                        ),

                      ],

                    ),


                  )

              )
          )



      ),
    );
  }
  void _showToast(BuildContext context, String reply) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(reply),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _gotoDropin(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DropInCenter(title: 'Drop In Center',)));
  }
}

