import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../common/mock.dart';
import '../../common/widgets/app_button.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESTAURANTES', style: TextStyle(letterSpacing: 1.2)),
        actions: const [Padding(padding: EdgeInsets.only(right: 12), child: CircleAvatar(radius: 14))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 8),
                Expanded(child: Text('Buscar...')),
              ],
            ),
          ),
          const SizedBox(height: 16),
          for (final r in MockData.restaurants) ...[
            _RestaurantCard(name: r['name'] as String, image: r['image'] as String),
            const SizedBox(height: 16),
          ],
          const SizedBox(height: 8),
          AppButton(label: 'VER TODOS', filled: false, onPressed: () {}),
          const SizedBox(height: 24),
          _PromoBanner(),
        ],
      ),
      bottomNavigationBar: _BottomNav(index: 0),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  final String name;
  final String image;
  const _RestaurantCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          CachedNetworkImage(imageUrl: image, height: 140, width: double.infinity, fit: BoxFit.cover),
          Positioned(
            left: 12, bottom: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: Colors.white.withOpacity(.9), borderRadius: BorderRadius.circular(12)),
              child: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.all(12),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text('DESCUBRE EL TOP 10 RESTAURANTES\nDE TU UBICACIÓN', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int index;
  const _BottomNav({required this.index});
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: index,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Inicio'),
        NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'Menú'),
        NavigationDestination(icon: Icon(Icons.contacts_outlined), label: 'Contacto'),
        NavigationDestination(icon: Icon(Icons.info_outline), label: 'Nosotros'),
      ],
    );
  }
}
