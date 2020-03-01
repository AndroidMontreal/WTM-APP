import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_devfest/Localization/AppLocalizations.dart';
import 'package:flutter_devfest/home/home_bloc.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/home/speaker.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:flutter_devfest/utils/widgets/SocialActionsWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerPage extends StatelessWidget {
  static const String routeName = "/speakers";


  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    return DevScaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection("speakers").snapshots(),
          builder: (context, snapshots) {
            if (!snapshots.hasData)
              return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child:
                      Text(AppLocalizations.of(context).translate("loading")));
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (c, i) {
                return buildCardItem(c, snapshots.data.documents[i]);
              },
              itemCount: snapshots.data.documents.length,
            );
          }),
      title: AppLocalizations.of(context).translate("speakers"),
    );
  }

  Widget buildCardItem(BuildContext context, DocumentSnapshot speakerDocument) {
    var language = AppLocalizations.of(context).getLanguagesCode();
    Speaker speaker = Speaker.fromDocumentSnapshot(speakerDocument, language);
    return Card(
      elevation: 0.0,
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: speaker.image,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          speaker.name,
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 5,
                          color: Tools.multiColors[Random().nextInt(4)],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      speaker.title,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      speaker.shortBio,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SocialActions(speaker.socials),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
