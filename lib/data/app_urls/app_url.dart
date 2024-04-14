class AppURL {
  static const String kBaseURL = "http://selfaccounting.arabicalgorithm.com/api";
  ///Auth
 static const String kLoginURI = "/user/auth/login";
 static const String kLoginSocialURI = "/user/auth/login_social";
 static const String kRegisterURI = "/user/auth/signup";
 static const String kRegisterSocialURI = "/user/auth/signup_social";
 // store keeper
  static const String kPrayersURI = "/user/auth/prayers?date=";
  static const String kNextPrayerURI = "/user/auth/next_prayer";
  static const String kAssumptionsURI = "/user/auth/assumptions";
  static const String kMakeAssumptionsURI = "/user/auth/make_assumption";
  static const String kReportsURI = "/user/auth/reports?from_date=";
  static const String kTitlePagesURI = "/user/auth/pages_title?type=";
  static const String kGoodDeedsURI = "/user/auth/good_deeds?date=";
  static const String kGoodDeedsPostURI = "/user/auth/make_good_deed?date=";
  static const String kHadithURl = "/user/auth/hadith";
  static const String kRemembranceURl = "/user/auth/remembrance_categories";
  static const String kRemembranceDetailsURl = "/user/auth/remembrances?category_id=";
  static const String kSupplicationURl = "/user/auth/supplication_categories";
  static const String kSupplicationDetailsURl = "/user/auth/supplications?category_id=";
  static const String kImsakiaURl = "/user/auth/settings";
  static const String kNotificationURl = "/user/auth/notifications";
  static const String kPercentageHomeURl = "/user/auth/home_page_percentage";
  static const String kAnalysisHomeURl = "/user/auth/home_page_analysis";

}
