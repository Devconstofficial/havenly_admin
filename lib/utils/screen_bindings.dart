import 'package:get/get.dart';
import 'package:havenly_admin/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:havenly_admin/screens/listings_screen/controller/listing_controller.dart';

import '../screens/analytics_management/controller/analytics_controller.dart';
import '../screens/auth/controller/auth_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => ListingController());
    Get.lazyPut(() => AnalyticsController());
  }
}
