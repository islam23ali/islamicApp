class AppURL {
  static const String kBaseURL = "https://ramada.romozgroup.com/api/";
  ///Auth
 static const String kLoginURI = "auth/login";
 // store keeper
  static const String kStockItemsURI = "store-keeper/product-stock";
  static const String kCharitiesOrderURI = "store-keeper/charity-orders";
  static const String kPackageMealsURI = "store-keeper/meals";
  static const String kProductsURI = "store-keeper/products";
  static const String kSuppliersURI = "store-keeper/suppliers";
  static const String kRegisterIncomingItemsURI = "store-keeper/incoming-orders";
  static const String kDeliveryOrderURI = "store-keeper/order-delivery";
  static const String kReceivingOrderURI = "store-keeper/order-retival";
  static const String kCaptainURI = "store-keeper/captain";
  static const String kLocationsURI = "store-keeper/locations";

  // quality specialits
  static const String kReportsURI = "quality-specialist/reports";
  static const String kQuestionsURI = "quality-specialist/questions?type=";
  static const String kQualityReportURI = "quality-specialist/quality-report";
  static const String kCleanlinessReportURI = "quality-specialist/cleanliness-report";
  // site Supervisor
  static const String kOrderSiteURI = "site-supervisor/confirm-order";

  //delivery
 static const String kOrderURI = "captain/confirm-order";
 //suprvisor
  static const String kCharityURI = "field-supervisor/charities";
  static const String kCharitygeneralURI = "general-supervisor/charities";
  static const String kgfieldsupervisorReportURI = "field-supervisor/reports";
  static const String kgeneralReportURI = "general-supervisor/reports";
  static const String kdistibutionReportURI = "field-supervisor/distributions";
  static const String kqualityReportURI = "field-supervisor/feedback-reports";
  static const String kattandanceReportURI = "field-supervisor/attendance";
//director
 static const String kdirectorReportURI = "director-association/reports";
 static const String kdistrubutionURI = "director-association/distributions";
 static const String kopinionURI = "director-association/user-opinion";


}
