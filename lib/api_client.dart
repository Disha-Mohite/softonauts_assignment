import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


abstract class ApiClient {

  Future<http.Response> getDroInNavigatorlist(String userid) {
    return http.post(
      Uri.parse('https://softonauts.com/clients/Android/get-drop-in-navigator-list'),
      headers: <String, String>{
        'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.By2r2BwheJsbrEGrHOaMQwrrmlY7wHVFzWtuEmv39fM',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'user_id': userid,
      },

    );
  }

  Future<http.Response> getTimeSlotslist(String locationid) {
    return http.post(
      Uri.parse('https://softonauts.com/clients/Android/get-time-slots'),
      headers: <String, String>{
        'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.By2r2BwheJsbrEGrHOaMQwrrmlY7wHVFzWtuEmv39fM',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'location_id': locationid,
      },

    );
  }

  Future<http.Response> registerUser(var fname, var mnam, var lnam, var email,
      var paswd, var birthdat, var contact, var ssndigit, var adrson,
      var adrstw, var city, var state, var zipcode, var gender, var logintyp) {
    return http.post(
      Uri.parse('https://softonauts.com/clients/Android/register-user'),
      headers: <String, String>{
        'Authorization': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.By2r2BwheJsbrEGrHOaMQwrrmlY7wHVFzWtuEmv39fM',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
    'first_name':fname,
    'middle_name': mnam,
    'last_name':lnam,
    'dob':birthdat,
    'gender':gender,
    'contact_number':contact,
    'email':email,
    'address_one':adrson,
    'address_two':adrstw,
    'city':city,
    'state':state,
    'zipcode':zipcode,
    'password':paswd,
    'login_type':logintyp,
    'ssn_digits':ssndigit
      },

    );
  }
}