import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/invitation_card.dart';

class HostDetailsDataProvider extends ChangeNotifier {
  String _hostName = "";
  String _hostEmail = "";
  String _hostPhoneNumber = "";
  String _hostAddress = "";

  String get hostName => _hostName;
  set hostName(_) {
    this._hostName = _;
  }

  String get hostEmail => _hostEmail;
  set hostEmail(_) {
    this._hostEmail = _;
  }

  String get hostPhoneNumber => _hostPhoneNumber;
  set hostPhoneNumber(_) {
    this._hostPhoneNumber = _;
  }

  String get hostAddress => _hostAddress;

  set hostAddress(_) {
    this._hostAddress = _;
  }

  void submit_data() {
    InvitationCardData invitationCardData = InvitationCardData.getInstance()!;

    HostDetails hostDetails = HostDetails(
        hostAddress: this._hostAddress,
        hostEmail: this._hostEmail,
        hostName: this._hostName,
        hostPhoneNumber: this._hostPhoneNumber);
    invitationCardData.hostDetails = hostDetails;
  }
}
