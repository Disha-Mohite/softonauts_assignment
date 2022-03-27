import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'connection_status_singletone.dart';
import 'package:softonauts_assignment/model/timeslots.dart';
import 'package:http/http.dart' as http;

import 'navigatordetailstwo.dart';

Future<NaviTimeSlots> getTimeSlotslist(String locationid) async {
  final response = await http.post(
    Uri.parse('https://softonauts.com/clients/Android/get-time-slots'),
    headers: <String, String>{
      'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.By2r2BwheJsbrEGrHOaMQwrrmlY7wHVFzWtuEmv39fM',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'location_id': locationid,
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return NaviTimeSlots.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to get list.');
  }
}
class NavigatorDetail extends StatefulWidget{
  final String navname,navadrs,locationid;
  NavigatorDetail(
      {Key? key, required this.title, required this.navname, required this.navadrs, required this.locationid})
      : super(key: key);

  final String title;


  @override
  _NavigatorDetailState createState() => _NavigatorDetailState();

}

class _NavigatorDetailState extends State<NavigatorDetail> {
  late StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  Future<NaviTimeSlots>? _futureTimeslots;

  List<Timeslots> _timeslotss = [];
   Slotes _slotess = new Slotes();
  List<String> _morning = [];
  List<String> _noonlist = [];
  List<String> _evnlist = [];
  List<String> _nightlist = [];
  int totalslots = 0;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                       color: Colors.orange.shade50,
                       alignment: Alignment.topLeft,
                       padding: const EdgeInsets.all(10),
                       child: const Text(
                         'Drop In Center',
                         style: TextStyle(fontSize: 16,
                             color: Colors.deepOrangeAccent),
                       )
                   ),
                   Container(
                     color: Colors.white,
                       alignment: Alignment.topLeft,
                       padding: const EdgeInsets.all(8),
                       child: const Text(
                         'Navigator Details',
                         style: TextStyle(fontSize: 16,
                             color: Colors.deepOrangeAccent),
                       )
                   ),
                   Card(
                     borderOnForeground: true,
                     margin: const EdgeInsets.all(10.0),
                     shape: RoundedRectangleBorder(
                       side: BorderSide(color: Colors.deepOrangeAccent, width: 1),
                       borderRadius: BorderRadius.circular(10),
                     ),
                     color: Colors.orange.shade50,
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
                     alignment: Alignment.topRight,
                     padding: const EdgeInsets.all(8.0),
                     child: (_futureTimeslots == null) ?  buildColumn() : buildFutureBuilder(),

    ),
    ],
     ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                _futureTimeslots = getTimeSlotslist(widget.locationid);
              });
            },
            child: const Text('Get Timeslots'),
          ),
        ],


    );
  }


  FutureBuilder<NaviTimeSlots> buildFutureBuilder() {
    return FutureBuilder<NaviTimeSlots>(
      future: _futureTimeslots,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            if (snapshot.data!.timeslots!.length > 0) {
              _timeslotss = snapshot.data!.timeslots!;

              return ListView.builder(

                shrinkWrap: true,
                itemBuilder: (BuildContext, index) {

                  // _slotess  =_timeslotss[index].slotes!;
                  // _morning = _slotess.morning!;
                  // _noonlist = _slotess.afternoon!;
                  // _evnlist = _slotess.evening!;
                  // _nightlist = _slotess.night!;
                 //

                  return Card(
                    child: ListTile(

                        title: Text(_timeslotss[index].showDate!),
                        subtitle: Text(  _timeslotss[index].count!.toString() + "Slots available"),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => NavigatorDetailsTwo(
                                  title: 'Navigator Detail',
                                  navname: widget.navname,
                                  navadrs: widget.navadrs,
                                  locationid: widget.locationid,
                                  date: _timeslotss[index].showDate!
                              )));
                        }
                    ),
                  );
                },
                itemCount: _timeslotss.length,
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
              );
            }
          } else {
            return Text("No data");
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}