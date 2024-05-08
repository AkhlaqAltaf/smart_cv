class InvitationCard {
  static InvitationCard? instance;

  EventDetails? eventDetails;
  HostDetails? hostDetails;
  MessageDetail? messageDetail;
  static InvitationCard? getInstance() {
    return instance == null ? InvitationCard() : instance;
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
