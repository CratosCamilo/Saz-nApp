import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../common/mock.dart';
import '../../common/widgets/app_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Menú'),
        actions: const [Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.shopping_cart_outlined))],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _SearchBar(),
          ),
          const SizedBox(height: 8),
          ...MockData.menu.map((m) => _MenuItemCard(item: m)).toList(),
          const SizedBox(height: 12),
        ],
      ),
      bottomNavigationBar: const _BottomNav(index: 1),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Buscar platos...',
        fillColor: AppColors.bg,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const _MenuItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(imageUrl: item['image'], width: 64, height: 64, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'], style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(item['subtitle'], style: const TextStyle(color: AppColors.grey)),
                const SizedBox(height: 4),
                Text('${item['price']}'.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.'),
                    style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          AppButton(label: 'Agregar al carrito', onPressed: () {}, filled: false, icon: Icons.add_shopping_cart),
        ],
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
