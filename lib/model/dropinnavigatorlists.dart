class DropInNavigatorLists {
  int? code;
  bool? status;
  String? message;
  List<DropInNavigatorList>? dropInNavigatorList;

  DropInNavigatorLists(param0, param1, param2, param3, 
      {this.code, this.status, this.message, this.dropInNavigatorList});



   DropInNavigatorLists.fromJson(Map<String, dynamic> json) {

    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['drop_in_navigator_list'] != null) {
      dropInNavigatorList = [];
      json['drop_in_navigator_list'].forEach((v) {
        dropInNavigatorList?.add(new DropInNavigatorList.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dropInNavigatorList != null) {
      data['drop_in_navigator_list'] =
          this.dropInNavigatorList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DropInNavigatorList {
  String? navigatorName;
  List<String>? locationId;
  List<String>? navigatorLocation;
  List<String>? navigatorCity;
  List<String>? navigatorZipcode;
  List<AppointmentType>? appointmentType;
  List<String>? contactNumber;

  DropInNavigatorList(
      {this.navigatorName,
        this.locationId,
        this.navigatorLocation,
        this.navigatorCity,
        this.navigatorZipcode,
        this.appointmentType,
        this.contactNumber});

  DropInNavigatorList.fromJson(Map<String, dynamic> json) {
    navigatorName = json['navigator_name'];
    locationId = json['location_id'].cast<String>();
    navigatorLocation = json['navigator_location'].cast<String>();
    navigatorCity = json['navigator_city'].cast<String>();
    navigatorZipcode = json['navigator_zipcode'].cast<String>();
    if (json['appointment_type'] != null) {
      appointmentType = [];
      json['appointment_type'].forEach((v) {
        appointmentType?.add(new AppointmentType.fromJson(v));
      });
    }
    contactNumber = json['contact_number'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['navigator_name'] = this.navigatorName;
    data['location_id'] = this.locationId;
    data['navigator_location'] = this.navigatorLocation;
    data['navigator_city'] = this.navigatorCity;
    data['navigator_zipcode'] = this.navigatorZipcode;
    if (this.appointmentType != null) {
      data['appointment_type'] =
          this.appointmentType?.map((v) => v.toJson()).toList();
    }
    data['contact_number'] = this.contactNumber;
    return data;
  }
}

class AppointmentType {
  int? id;
  String? appointmentType;

  AppointmentType({
    this.id,
    this.appointmentType});

  AppointmentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentType = json['appointment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['appointment_type'] = this.appointmentType;
    return data;
  }
}