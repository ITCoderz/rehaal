import 'package:get/get.dart';
import 'package:rehaal/view/auth/view/create_account_view.dart';
import 'package:rehaal/view/auth/view/login_view.dart';
import 'package:rehaal/view/auth/view/new_password.dart';
import 'package:rehaal/view/auth/view/reset_password.dart';
import 'package:rehaal/view/auth/view/verify_otp.dart';
import 'package:rehaal/view/auth/view/welcome_view.dart';
import 'package:rehaal/view/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:rehaal/view/plans/view/add_activity.dart';
import 'package:rehaal/view/plans/view/add_duration_view.dart';
import 'package:rehaal/view/plans/view/add_member.dart';
import 'package:rehaal/view/plans/view/add_new_plan.dart';
import 'package:rehaal/view/plans/view/view_activities.dart';
import 'package:rehaal/view/profile/view/profile_view.dart';
import 'package:rehaal/view/splash/view/splash_view.dart';

class AppRoutes {
  static String splashView = "/splashView";
  static String welcomeView = "/welcomeView";
  static String loginView = "/loginView";
  static String createAccount = "/createAccount";
  static String resetPassword = "/resetPassword";
  static String newPassword = "/newPassword";
  static String verifyOTP = "/verifyOTP";
  static String bottomNavBar = "/bottomNavBar";
  static String addNewPlanView = "/addNewPlanView";
  static String addDurationView = "/addDurationView";
  static String viewActivities = "/viewActivities";
  static String addNewActivity = "/addNewActivity";
  static String addMember = "/addMember";
  static String profileView = "/profileView";

  static List<GetPage> routes = [
    GetPage(
        name: splashView,
        page: () => SplashView(),
        transition: Transition.fade),
    GetPage(
        name: welcomeView,
        page: () => WelcomeView(),
        transition: Transition.fade),
    GetPage(
        name: loginView, page: () => LoginView(), transition: Transition.fade),
    GetPage(
        name: createAccount,
        page: () => CreateAccountView(),
        transition: Transition.fade),
    GetPage(
        name: resetPassword,
        page: () => ResetPassword(),
        transition: Transition.fade),
    GetPage(
        name: newPassword,
        page: () => NewPassword(),
        transition: Transition.fade),
    GetPage(
        name: verifyOTP, page: () => VerifyOtp(), transition: Transition.fade),
    GetPage(
        name: bottomNavBar,
        page: () => BottomNavBar(),
        transition: Transition.fade),
    GetPage(
        name: addNewPlanView,
        page: () => AddNewPlanView(),
        transition: Transition.fade),
    GetPage(
        name: addDurationView,
        page: () => AddDurationView(),
        transition: Transition.fade),
    GetPage(
        name: viewActivities,
        page: () => ViewActivities(),
        transition: Transition.fade),
    GetPage(
        name: addNewActivity,
        page: () => AddActivity(),
        transition: Transition.fade),
    GetPage(
        name: addMember, page: () => AddMember(), transition: Transition.fade),
    GetPage(
        name: profileView,
        page: () => ProfileView(),
        transition: Transition.fade),
  ];
}
