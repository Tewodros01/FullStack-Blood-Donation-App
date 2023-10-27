import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/src/features/authentication/pages/signin_page/signin_screen.dart';
import 'package:frontend/src/features/authentication/pages/signup_page/signup_screen.dart';
import 'package:frontend/src/features/core/pages/chat_screen/chat_user_screen.dart';
import 'package:frontend/src/features/core/pages/dashboard_page/dash_board_page.dart';
import 'package:frontend/src/features/core/pages/profile/profile_page.dart';
import 'package:frontend/src/localization/language.service.dart';
import 'package:frontend/src/localization/localization.dart';
import 'package:frontend/src/utils/shared_service.dart';
import 'package:frontend/src/utils/themes/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Widget _defoultHome = const SigninPage();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool result = await SharedService.isLoggedIn();
  if (result) {
    _defoultHome = const DashBoardPage();
  }
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CAppTheme.ligthTheme,
        darkTheme: CAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        translations: LocalString(),
        locale: LangugeServices().local,
        title: 'Blood Donation',
        initialRoute: '/',
        navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
          '/': (context) => _defoultHome,
          '/home': (context) => const DashBoardPage(),
          '/registore': (context) => const SignUpPage(),
          '/login': (context) => const SigninPage(),
          '/profile': (context) => const ProfilePage(),
          '/message': (context) => const ChatPage(),
        },
      ),
    );
  }
}
