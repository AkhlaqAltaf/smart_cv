class InvitationCardData {
  static InvitationCardData? instance;

  EventDetails? eventDetails;
  HostDetails? hostDetails;
  MessageDetail? messageDetail;
  int? id;
  String? created_on;
  InvitationCardData.instances();

  static InvitationCardData? getInstance() {
    if (instance == null) {
      instance = InvitationCardData.instances();
    }
    return instance;
  }

  InvitationCardData.data(
    this.eventDetails,
    this.hostDetails,
    this.messageDetail,
    this.id,
    this.created_on,
  );

  factory InvitationCardData.fromJson(Map<String, dynamic> json) {
    return InvitationCardData.data(
        EventDetails.fromJson(json['event']),
        HostDetails.fromJson(json['host']),
        MessageDetail(),
        json['id'],
        json['created_on']);
  }
}

class EventDetails {
  String? eventType;
  String? eventDate;
  String? eventTime;
  String? eventLocation;

  EventDetails({
    this.eventType,
    this.eventDate,
    this.eventTime,
    this.eventLocation,
  });

  Map<String, dynamic> toJson() {
    return {
      'event_type': eventType,
      'event_date': eventDate,
      'event_time': eventTime,
      'event_location': eventLocation
    };
  }

  factory EventDetails.fromJson(Map<String, dynamic> json) {
    return EventDetails(
        eventDate: json['event_date'],
        eventLocation: json['event_location'],
        eventTime: json['event_time'],
        eventType: json['event_type']);
  }
}

class HostDetails {
  String? hostName;
  String? hostEmail;
  String? hostPhoneNumber;
  String? hostAddress;

  HostDetails({
    this.hostName,
    this.hostEmail,
    this.hostPhoneNumber,
    this.hostAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      'hostname': hostName,
      'host_email': hostEmail,
      'host_phone_number': hostPhoneNumber,
      'host_address': hostAddress
    };
  }

  factory HostDetails.fromJson(Map<String, dynamic> json) {
    return HostDetails(
        hostAddress: json['host_address'],
        hostEmail: json['host_email'],
        hostName: json['hostname']);
  }
}

class MessageDetail {
  String? messageText;

  MessageDetail({
    this.messageText,
  });
  Map<String, dynamic> toJson() {
    return {'message': messageText};
  }
}
