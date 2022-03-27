import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:softonauts_assignment/model/dropinnavigatorlists.dart';
import 'api_client.dart';
import 'connection_status_singletone.dart';
import 'navigatordetails.dart';

Future<DropInNavigatorLists> getDroInNavigatorlist(String userid) async {
  final response = await http.post(
    Uri.parse('https://softonauts.com/clients/Android/get-drop-in-navigator-list'),
    headers: <String, String>{
      'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.By2r2BwheJsbrEGrHOaMQwrrmlY7wHVFzWtuEmv39fM',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'user_id': userid,
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return DropInNavigatorLists.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
class DropInCenter extends StatefulWidget{

  DropInCenter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DropInCenterState createState() => _DropInCenterState();
}

class _DropInCenterState extends State<DropInCenter> {
  final TextEditingController _controller = TextEditingController();
  late StreamSubscription _connectionChangeStream;
  Future<DropInNavigatorLists>? _futureAlbum;
  List<DropInNavigatorList> _dropinnavlist = [];
  List<String> _locationid = [];
  List<String> _navigatorLocations = [];
  List<String> _navigatorCitys = [];
  List<String> _navigatorZipcodes = [];
  List<String> _contactNumbers = [];
  List<AppointmentType> _appointmentTypes = [];
  TextEditingController nameController = TextEditingController();

  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);

  }
  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }
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
      body:  Container(
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

            Card(
              borderOnForeground: true,
              margin: const EdgeInsets.all(1.0),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(20),

                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search By Name, City, Zipcode',
                  ),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(8.0),
              child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),

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
              _futureAlbum = getDroInNavigatorlist("96");
            });
          },
          child: const Text('Get Dropin List'),
        ),
      ],
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



  FutureBuilder<DropInNavigatorLists> buildFutureBuilder() {
    return FutureBuilder<DropInNavigatorLists>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if(snapshot.data != null){
            if(snapshot.data!.dropInNavigatorList!.length >0){
              _dropinnavlist = snapshot.data!.dropInNavigatorList!;

              return ListView.builder(
                itemBuilder: (BuildContext, index){
                  _navigatorLocations = _dropinnavlist[index].navigatorLocation!;
                  _locationid = _dropinnavlist[index].locationId!;
                  return Card(
                    child: ListTile(
                        leading: CircleAvatar(

                          backgroundImage: AssetImage('assets/images/ic_person.png'), // no matter how big it is, it won't overflow
                        ),
                      title: Text(_dropinnavlist[index].navigatorName!),
                      subtitle: Text(_navigatorLocations[0].toString()),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => NavigatorDetail(
                              title: 'Navigator Detail',
                                navname: _dropinnavlist[index].navigatorName!,
                                navadrs: _navigatorLocations[0].toString(),
                                locationid: _locationid[0].toString()
                            )));
                      }
                    ),
                  );
                },
                itemCount: _dropinnavlist.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
              );
            }

          }else{
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