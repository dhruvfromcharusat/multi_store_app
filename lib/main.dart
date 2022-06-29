import 'package:flutter/material.dart';
import 'package:multi_store_app/Auth/customer_login.dart';
import 'package:multi_store_app/Auth/customer_signup.dart';
import 'package:multi_store_app/Auth/supplier_login.dart';
import 'package:multi_store_app/Auth/supplier_signup.dart';
import 'package:multi_store_app/mainscreens/customer_home.dart';
import 'package:multi_store_app/mainscreens/supplier_home.dart';
import 'package:multi_store_app/mainscreens/wellcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_home': (context) => const CustomerHomeScreen(),
        '/supplier_home': (context) => const SupplierHomeScreen(),
        '/customer_signup': (context) => const CustomerRegister(),
        '/customer_login': (context) => const CustomerLogin(),
        '/supplier_login': (context) => const SupplierLogin(),
        '/supplier_signup': (context) => const SupplierRegister(),
      },
    );
  }
}
