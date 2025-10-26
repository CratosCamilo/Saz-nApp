import 'package:flutter/material.dart';
import 'app/theme.dart';

// Screens
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/restaurants/restaurants_screen.dart';
import 'features/restaurants/restaurant_about_screen.dart';
import 'features/menu/menu_screen.dart';
import 'features/cart/cart_screen.dart';

void main() {
  runApp(const SazonApp());
}

class SazonApp extends StatelessWidget {
  const SazonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SazónApp',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),

      // ⬇️ Cambia aquí para ver cada vista sin flujo ni backend
      home: LoginScreen(),
      // home: RegisterScreen(),
      // home: RestaurantsScreen(),
      // home: RestaurantAboutScreen(),
      // home: MenuScreen(),
      // home: CartScreen(),
    );
  }
}
