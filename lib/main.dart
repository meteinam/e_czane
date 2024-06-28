import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_czane/constants.dart';
import 'package:e_czane/screens/duty_pharmacy_page.dart';
import 'package:e_czane/screens/login_page.dart';
import 'package:e_czane/screens/main_page.dart';
import 'package:e_czane/screens/main_page_responsive.dart';
import 'package:e_czane/screens/medicine_page.dart';
import 'package:e_czane/screens/pharmacy_nearby_page.dart';
import 'package:e_czane/screens/profile_page.dart';
import 'package:e_czane/screens/search_page.dart';
import 'package:e_czane/screens/signup_page.dart';
import 'package:e_czane/screens/welcome_page.dart';
import 'package:e_czane/style/color.dart';
import 'package:e_czane/widgets/eczane_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var tokenBox = Hive.openBox('tokenBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eczane',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: eczaneDarkRed),
          useMaterial3: true,
        ),
        initialRoute: '/WelcomePage',
        routes: {
          '/MyHomePage': (context) => const MyHomePage(title: 'Eczane'),
          '/LoginPage': (context) => EczaneLoginPage(),
          '/MainPage': (context) => const EczaneMainPage(),
          '/PharmacyNearbyPage': (context) => const PharmacyNearbyPage(),
          '/ProfilePage': (context) => const EczaneProfilePage(),
          '/MedicinePage': (context) => const MedicinePage(),
          '/SignUpPage': (context) => const EczaneSignupPage(),
          '/WelcomePage': (context) => const WelcomePage(),
          '/DutyPharmacyPage': (context) => const EczaneDutyPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 1;
  final screens = [
    const EczaneSearchPage(),
    const EczaneResponsiveMainPage(),
    const EczaneProfilePage(),
  ];
  final items = <Widget>[
    const Icon(Icons.search_rounded, size: 30),
    const Icon(Icons.home, size: 30),
    const Icon(Icons.person, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    DeviceSize.init(context);
    return EczaneScaffold(
      widget: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: eczaneLightGrey),
        ),
        child: CurvedNavigationBar(
          height: DeviceSize.height * 0.08,
          backgroundColor: Colors.transparent,
          color: eczaneDarkGrey,
          items: items,
          index: index,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }
}
