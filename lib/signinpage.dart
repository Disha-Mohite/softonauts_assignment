import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softonauts_assignment/signuppage.dart';

import 'dropincenter.dart';

class SignInPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: new Scaffold(

        body: Container(
            color: Colors.orange.shade50,

            child: Container(
                alignment: Alignment.center,

                child: Card(
                  margin: const EdgeInsets.all(20.0),
                  color: Colors.white,
                  elevation: 30.0,
                  child: Wrap(

                    children: <Widget>[

                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 16,
                                color: Colors.black87),
                          )
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),

                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),

                      Container(

                          width: double.infinity,
                          height: 70,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: ElevatedButton(

                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(Colors.deepOrangeAccent)),
                            child: const Text('Sign In'),

                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      DropInCenter(title: 'Drop In Center',)));
                            },
                          )
                      ),

                      Container(
                        child: Row(
                          children: <Widget>[

                             Align(
                               alignment: Alignment.bottomLeft,
                               child: TextButton(


                               onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(
                                     builder: (context) => SignUPPage()));
                               },

                               child: const Text('Forgot Password',
                                 style: TextStyle(
                                   color: Colors.black45,
                                 ),
                                 //  textAlign:  TextAlign.right//TextStyle
                               ),

                             ),),



                            const Spacer(),


                            Align(
                              alignment: Alignment.bottomRight,

                              child: TextButton(

                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SignUPPage()));
                                },

                                child: const Text('Sign UP',
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),

                                ),
                              ),
                            ),

                          ],


                        ),

                      ),


                      Container(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(

                          onPressed: () {
                            //Sign  screen
                          },
                          child: const Text('Terms Of Use',
                              style: TextStyle(
                                color: Colors.deepOrange,
                              ),
                              textAlign: TextAlign.center
                          ),
                        ),
                      )

                    ],

                  ),


                )
            )

        ),


      ),

    );
  }

}