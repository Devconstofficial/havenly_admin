import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:havenly_admin/screens/dashboard_screen/dashboard_screen.dart';
import 'package:havenly_admin/screens/listings_screen/listing_screen.dart';
import 'package:havenly_admin/utils/screen_bindings.dart';
import '../screens/analytics_management/analytics_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/send_otp_screen.dart';
import '../screens/auth/set_new_pass.dart';
import '../screens/auth/verify_otp_screen.dart';
import 'app_strings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kLoginScreenRoute, page: () => LoginScreen(), binding: ScreenBindings(),),
      GetPage(name: kSendOtpScreenRoute, page: () => SendOtpScreen(), binding: ScreenBindings(),),
      GetPage(name: kVerifyOtpScreenRoute, page: () => VerifyOtpScreen(), binding: ScreenBindings(),),
      GetPage(name: kSetNewPassScreenRoute, page: () => SetNewPassScreen(), binding: ScreenBindings(),),
      GetPage(name: kDashboardScreenRoute, page: () => DashboardScreen(), binding: ScreenBindings(),),
      GetPage(name: kListingsScreenRoute, page: () => ListingsScreen(), binding: ScreenBindings(),),
      GetPage(name: kAnalyticsScreenRoute, page: () => AnalyticsScreen(), binding: ScreenBindings(),),
    ];
  }
}

