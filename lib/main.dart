import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/favorites_provider.dart';
import 'package:shopping/providers/product_provider.dart';
import 'package:shopping/providers/theme_provider.dart';
import 'package:shopping/views/splash/splash_screen.dart';
import 'package:shopping/widgets/bottom_nav_bar.dart';

import 'auth/login.dart';
import 'auth/signup.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            initialRoute: '/BottomNavBar',
            routes: {
              '/SplashScreen': (context) => const SplashScreen(),
              '/LoginPage': (context) => const LoginPage(),
              '/SignUpPage': (context) => const SignUpPage(),
              '/BottomNavBar': (context) => const BottomNavBar(),
              // Add other routes here as needed
            },
          );
        },
      ),
    );
  }
}
