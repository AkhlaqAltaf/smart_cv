import 'package:flutter/material.dart';
import 'package:smart_cv/apis/invitation_card_apis/delete_invitation_card.dart';
import 'package:smart_cv/apis/invitation_card_apis/download_invitation_card.dart';
import 'package:smart_cv/apis/invitation_card_apis/invitation_cards.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/data_layer/invitation_card.dart';
import 'package:smart_cv/theme/theme_helper.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/widgets/custom_drawer/drawer.dart';

class InvitationCard extends StatefulWidget {
  const InvitationCard({Key? key}) : super(key: key);

  @override
  State<InvitationCard> createState() => _InvitationCardState();
}

class _InvitationCardState extends State<InvitationCard> {
  final List<String> _options = [
    'Classic',
    'Rustic',
    'Modern',
    'Vintage',
    'Floral',
    'Minimalist',
    'Elegant',
    'Whimsical',
  ];

  List<InvitationCardData>? _invitationCards;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchInvitationCards();
  }

  Future<void> _fetchInvitationCards() async {
    List<InvitationCardData>? invitationCards =
        await fetchInvitationCards(context);
    setState(() {
      _invitationCards = invitationCards;
      _isLoading = false;
    });
  }

  void _deleteInvitationCard(int id) async {
    await deleteInvitationCard(context, id);
    _fetchInvitationCards(); // Refresh data after deletion
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.invitationCardCreate);
          },
          tooltip: 'Select Image',
          child: Icon(Icons.add),
        ),
        appBar: customAppBar(
          context,
          "INVITATION CARDS",
        ),
        drawer: drawer(context),
        resizeToAvoidBottomInset: false,
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _invitationCards == null || _invitationCards!.isEmpty
                ? Center(child: Text('No invitation cards available'))
                : ListView.builder(
                    itemCount: _invitationCards!.length,
                    itemBuilder: (context, index) =>
                        makeCard(_invitationCards![index], context),
                  ),
      ),
    );
  }

  Card makeCard(InvitationCardData data, BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              appTheme.blueGray500C6,
            ],
          ),
        ),
        child: _InvitationCardListTile(
          data: data,
          options: _options,
          deleteCallback: _deleteInvitationCard,
        ),
      ),
    );
  }
}

class _InvitationCardListTile extends StatefulWidget {
  final InvitationCardData data;
  final List<String> options;
  final Function(int) deleteCallback;

  const _InvitationCardListTile({
    Key? key,
    required this.data,
    required this.options,
    required this.deleteCallback,
  }) : super(key: key);

  @override
  __InvitationCardListTileState createState() =>
      __InvitationCardListTileState();
}

class __InvitationCardListTileState extends State<_InvitationCardListTile> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.white24),
          ),
        ),
        child: IconButton(
          icon: Icon(Icons.download_outlined, color: Colors.white),
          onPressed: () {
            if (_selectedOption != null) {
              downloadInvitationCard(
                  context, widget.data.id!, _selectedOption!);
            }
          },
        ),
      ),
      title: Column(
        children: [
          DropdownButton<String>(
            value: _selectedOption,
            hint: Text('Select A Type'),
            items: widget.options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue;
              });
            },
          ),
          Text(
            widget.data.eventDetails!.eventType!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      subtitle: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: LinearProgressIndicator(
                backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                value: double.tryParse(widget.data.id.toString()),
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "ID : ${widget.data.id}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () async {
          await widget.deleteCallback(widget.data.id!);
        },
        icon: Icon(Icons.delete_forever_sharp, color: Colors.white, size: 30.0),
      ),
    );
  }
}
