import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/apis/invitation_card_apis/download_invitation_card.dart';
import 'package:smart_cv/apis/invitation_card_apis/invitation_cards.dart';
import 'package:smart_cv/data_layer/invitation_card.dart';
import 'package:smart_cv/provider/data_providers/loder_provider.dart';
import 'package:smart_cv/theme/theme_helper.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/widgets/custom_drawer/drawer.dart';

class InvitationCard extends StatefulWidget {
  const InvitationCard({Key? key}) : super(key: key);

  @override
  State<InvitationCard> createState() => _InvitationCard();
}

class _InvitationCard extends State<InvitationCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Select Image',
          child: Icon(Icons.add),
        ),
        appBar: customAppBar(
          context,
          "COVER LETTER",
        ),
        drawer: drawer(context),
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<List<InvitationCardData>>(
          future: fetchInvitationCards(context, 1),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              List<InvitationCardData>? invitation_cards = snapshot.data;
              if (invitation_cards != null) {
                return ListView.builder(
                  itemCount: invitation_cards.length,
                  itemBuilder: (context, index) =>
                      makeCard(invitation_cards[index], context),
                );
              } else {
                return Center(
                    child: Text('No cover Invitation Card Available'));
              }
            }
          },
        ),
      ),
    );
  }
}

Card makeCard(InvitationCardData data, BuildContext context) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              appTheme.blueGray500C6,
            ],
          ),
        ),
        child: makeListTile(data, context),
      ),
    );

ListTile makeListTile(InvitationCardData data, BuildContext context) =>
    ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: IconButton(
            icon: Icon(Icons.download_outlined, color: Colors.white),
            onPressed: () {
              downloadInvitationCard(context, data.id!);
            },
          ),
        ),
        title: Text(
          data.eventDetails!.eventType!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  // tag: 'hero',
                  child: LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                      value: double.tryParse(data.id.toString()),
                      valueColor: AlwaysStoppedAnimation(Colors.green)),
                )),
            Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("ID : ${data.id.toString()}",
                      style: TextStyle(color: Colors.white))),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("ID : ${data.created_on}",
                      style: TextStyle(color: Colors.white))),
            )
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            Provider.of<LoaderProvider>(context, listen: false).isLoading =
                true;
          },
          icon:
              Icon(Icons.delete_forever_sharp, color: Colors.white, size: 30.0),
        ));
