import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/invitation_card.dart';

class EventDetailsDataProvider extends ChangeNotifier {
  String _eventType = "";
  String _eventDate = "";
  String _eventTime = "";
  String _eventLocation = "";

  String get eventType => _eventType;
  set eventType(String _) {
    this._eventType = _;
  }

  String get eventDate => _eventDate;
  set eventDate(String _) {
    this._eventDate = _;
  }

  String get eventTime => _eventTime;
  set eventTime(String _) {
    this._eventTime = _;
  }

  String get eventLocation => _eventLocation;
  set eventLocation(String _) {
    this._eventLocation = _;
  }

  void submit_data() {
    InvitationCardData? invitationCardData = InvitationCardData.getInstance();

    EventDetails event = EventDetails(
        eventDate: this._eventDate,
        eventLocation: this._eventLocation,
        eventTime: this._eventTime,
        eventType: this._eventType);
    invitationCardData!.eventDetails = event;
  }
}
