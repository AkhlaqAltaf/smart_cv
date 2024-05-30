import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/invitation_card.dart';

class MessageDataProvider extends ChangeNotifier {
  String _messageText = "";
  String get messageText => _messageText;
  set messageText(_) {
    this._messageText = _;
  }

  void submit_data() {
    InvitationCardData invitationCardData = InvitationCardData.getInstance()!;

    MessageDetail messageDetail = MessageDetail(messageText: this._messageText);
    invitationCardData.messageDetail = messageDetail;
  }
}
