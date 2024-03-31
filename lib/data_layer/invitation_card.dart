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
}


class MessageDetail {
  String? messageText;

  MessageDetail({
    this.messageText,
  });
}
