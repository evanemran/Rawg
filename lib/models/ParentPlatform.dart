import 'package:gamezone/models/Platform.dart';
import 'package:gamezone/models/Ratings.dart';

import 'PlatformChild.dart';

class ParentPlatforms {
  PlatformChild? platform;

  ParentPlatforms({this.platform});

  ParentPlatforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? PlatformChild.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.platform != null) {
      data['platform'] = this.platform!.toJson();
    }
    return data;
  }
}