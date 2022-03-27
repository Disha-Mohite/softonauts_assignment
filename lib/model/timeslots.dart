class NaviTimeSlots {
  String? message;
  bool? status;
  int? code;
  List<Timeslots>? timeslots;

  NaviTimeSlots({this.message, this.status, this.code, this.timeslots});

  NaviTimeSlots.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
    if (json['timeslots'] != null) {
      timeslots = <Timeslots>[];
      json['timeslots'].forEach((v) {
        timeslots!.add(new Timeslots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.timeslots != null) {
      data['timeslots'] = this.timeslots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timeslots {
  String? showDate;
  String? currentDate;
  String? day;
  Slotes? slotes;
  int? count;
  List<Null>? booked;
  String? nextAvailability;
  String? nextAvailabilitySearch;

  Timeslots(
      {this.showDate,
        this.currentDate,
        this.day,
        this.slotes,
        this.count,
        this.booked,
        this.nextAvailability,
        this.nextAvailabilitySearch});

  Timeslots.fromJson(Map<String, dynamic> json) {
    showDate = json['show_date'];
    currentDate = json['current_date'];
    day = json['day'];
    slotes =
    json['slotes'] != null ? new Slotes.fromJson(json['slotes']) : null;
    count = json['count'];
    if (json['booked'] != null) {
      booked = <Null>[];
      json['booked'].forEach((v) {
        booked!.add(v);
      });
    }
    nextAvailability = json['next_availability'];
    nextAvailabilitySearch = json['next_availability_search'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show_date'] = this.showDate;
    data['current_date'] = this.currentDate;
    data['day'] = this.day;
    if (this.slotes != null) {
      data['slotes'] = this.slotes!.toJson();
    }
    data['count'] = this.count;
    if (this.booked != null) {
      data['booked'] = this.booked!;
    }
    data['next_availability'] = this.nextAvailability;
    data['next_availability_search'] = this.nextAvailabilitySearch;
    return data;
  }
}

class Slotes {
  List<String>? morning;
  List<String>? afternoon;
  List<String>? evening;
  List<String>? night;

  Slotes({this.morning, this.afternoon, this.evening, this.night});

  Slotes.fromJson(Map<String, dynamic> json) {
    morning = json['morning'].cast<String>();
    afternoon = json['afternoon'].cast<String>();
    evening = json['evening'].cast<String>();
    night = json['night'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['morning'] = this.morning;
    data['afternoon'] = this.afternoon;
    data['evening'] = this.evening;
    data['night'] = this.night;
    return data;
  }
}