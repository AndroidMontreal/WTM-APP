import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static const String app_name = "Women Techmakers Montreal";
  static const String app_version = "Version 1.0.4";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String google_sans_family = "GoogleSans";
  static bool isDebugMode = false;

  static checkDebug() {
    assert(() {
      // * Change with your local url if any
      isDebugMode = true;
      return true;
    }());
  }

  static bool get checkDebugBool {
    var debug = false;
    assert(debug = true);

    return debug;
  }

  //* Images
  static const String home_img = "assets/images/home_img.jpeg";
  static const String banner_light = "assets/images/banner_light.jpg";
  static const String banner_dark = "assets/images/banner_dark.png";


  //* Preferences
  static SharedPreferences prefs;
  static const String loggedInPref = "loggedInPref1";
  static const String displayNamePref = "displayNamePref";
  static const String emailPref = "emailPref";
  static const String phonePref = "phonePref";
  static const String photoPref = "photoPref";
  static const String isAdminPref = "isAdminPref";
  static const String darkModePref = "darkModePref";


  //* Media
  static const String facebookUrl = "https://www.facebook.com/wtm.montreal";
  static const String twitterUrl = "https://twitter.com/WTM_Montreal";
  static const String linkedinUrl = "https://www.linkedin.com/company/women-techmakers-montreal/";
  static const String youtubeUrl = "https://www.youtube.com/c/WomenTechmakersMontr%C3%A9al";
  static const String meetupUrl = "https://www.meetup.com/GDG-Montreal/";

  static const String email = "info@wtmmontreal.com";
}
