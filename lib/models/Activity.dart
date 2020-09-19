import 'package:artsideout_app/models/Profile.dart';

class Activity {
  String id;
  String title;
  String desc;
  String zone;
  String imgUrl;
  Map<String, String> time;
  Map<String, double> location;
  List<Profile> profiles;

  Activity(
      {this.id,
      this.title,
      this.desc,
      this.zone,
      this.imgUrl,
      this.time,
      this.location,
      this.profiles});
}
