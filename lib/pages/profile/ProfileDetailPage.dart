import 'package:artsideout_app/components/profile/ProfileDetailWidget.dart';
import 'package:artsideout_app/models/Profile.dart';
import 'package:flutter/material.dart';

class ProfileDetailPage extends StatefulWidget {
  final Profile profile;

  ProfileDetailPage(this.profile);

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ProfileDetailWidget(widget.profile),
    );
  }
}
