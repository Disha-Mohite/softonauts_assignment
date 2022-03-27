import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorDetailsTwo extends StatefulWidget{
  final String navname,navadrs,locationid, date;
  NavigatorDetailsTwo(
      {Key? key, required this.title, required this.navname, required this.navadrs, required this.locationid, required this.date})
      : super(key: key);

  final String title;


  @override
  _NavigatorDetailsTwoState createState() => _NavigatorDetailsTwoState();

}

class _NavigatorDetailsTwoState extends State<NavigatorDetailsTwo> {
  TextEditingController datetimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.deepOrangeAccent,
        leading: Icon(
          Icons.menu,
          color: Colors.white,

        ),
      ),

      body: Container(

        child:Wrap(

          children: <Widget>[
            Container(
                color: Colors.white,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Navigator Detail',
                  style: TextStyle(fontSize: 16,
                      color: Colors.deepOrangeAccent),
                )
            ),
            Container(
                color: Colors.orange.shade50,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(8),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                leading: CircleAvatar(

                  backgroundImage: AssetImage('assets/images/ic_person.png'), // no matter how big it is, it won't overflow
                ),
                title: Text(widget.navname,
                  style: TextStyle(fontSize: 16,
                      color: Colors.black87),
                ),
                subtitle: Text(widget.navadrs,
                  style: TextStyle(fontSize: 16,
                      color: Colors.black87),
                ),
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Select Appointment Type',
                  style: TextStyle(fontSize: 16,
                      color: Colors.black54),
                )
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 90,
              child: TextField(

                controller: datetimeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Face To Face',
                  hintStyle: TextStyle(color: Colors.black26),
                ),
              ),
            ),

            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Date and Time',
                  style: TextStyle(fontSize: 16,
                      color: Colors.black54),
                )
            ),

            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.date,
                  style: TextStyle(fontSize: 16,
                      color: Colors.deepOrangeAccent),
                )
            ),

            Container(

                width: double.infinity,
                height: 70,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(

                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent)),
                  child: const Text('Book Appointment'),

                  onPressed: () {

                  },
                )
            ),
          ],
        ),
      ),
    );
  }

}