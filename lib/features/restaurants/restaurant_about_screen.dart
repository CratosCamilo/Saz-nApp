import 'package:flutter/material.dart';

class RestaurantAboutScreen extends StatelessWidget {
  const RestaurantAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Row(children: [
                Icon(Icons.restaurant_menu, size: 28),
                SizedBox(width: 8),
                Text('Restaurante', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ]),
              SizedBox(height: 10),
              Text('Bienvenidos al Restaurante', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              SizedBox(height: 24),
              Icon(Icons.restaurant, size: 72),
              SizedBox(height: 24),
              Text(
                '"Bienvenidos a nuestro restaurante  donde cada plato es preparado con pasión y dedicación. Disfrute de una experiencia culinaria única, pensada para satisfacer su paladar. ¡Que tenga una excelente experiencia!"',
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _SimpleNav(),
    );
  }
}

class _SimpleNav extends StatelessWidget {
  const _SimpleNav();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: 0,
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Inicio'),
        NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Menú'),
        NavigationDestination(icon: Icon(Icons.contacts_outlined), label: 'Contacto'),
        NavigationDestination(icon: Icon(Icons.info_outline), label: 'Nosotros'),
      ],
    );
  }
}
