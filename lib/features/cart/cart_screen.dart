import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../common/widgets/quantity_stepper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final items = [
    {
      'title': 'Pizza',
      'price': 15000,
      'image': 'https://images.unsplash.com/photo-1542831371-d531d36971e6?q=80&w=800',
      'qty': 1,
    },
    {
      'title': 'Hamburguesa',
      'price': 20000,
      'image': 'https://images.unsplash.com/photo-1550547660-d9450f859349?q=80&w=800',
      'qty': 1,
    },
  ];

  int get total => items.fold(0, (sum, it) => sum + (it['price'] as int) * (it['qty'] as int));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de Compras'), leading: const BackButton(), actions: const [
        Padding(padding: EdgeInsets.only(right: 16), child: Icon(Icons.shopping_cart_outlined)),
      ]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Tu Pedido', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          ...items.asMap().entries.map((e) => _CartItem(
                title: e.value['title'] as String,
                price: e.value['price'] as int,
                image: e.value['image'] as String,
                qty: e.value['qty'] as int,
                onQtyChanged: (q) => setState(() => items[e.key]['qty'] = q),
              )),
          const SizedBox(height: 8),
          _DeliveryTile(),
          const SizedBox(height: 8),
          _TotalRow(total: total),
          const SizedBox(height: 12),
          _TextBox(label: 'Dirección de envío'),
          const SizedBox(height: 8),
          _TextBox(label: 'Instrucciones o comentarios', maxLines: 3),
          const SizedBox(height: 24),
        ],
      ),
      bottomNavigationBar: const _BottomNav(index: 1),
    );
  }
}

class _CartItem extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final int qty;
  final ValueChanged<int> onQtyChanged;

  const _CartItem({
    required this.title,
    required this.price,
    required this.image,
    required this.qty,
    required this.onQtyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.bg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(imageUrl: image, width: 48, height: 48, fit: BoxFit.cover),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text('${price}'.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.'),
                    style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          QuantityStepper(
            value: qty,
            onAdd: () => onQtyChanged(qty + 1),
            onRemove: () => onQtyChanged(qty > 1 ? qty - 1 : 1),
          ),
        ],
      ),
    );
  }
}

class _DeliveryTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
      child: const Row(
        children: [
          Icon(Icons.delivery_dining, size: 28),
          SizedBox(width: 12),
          Text('Delivery', style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  final int total;
  const _TotalRow({required this.total});

  @override
  Widget build(BuildContext context) {
    final formatted = 'COP ${total}'
        .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total', style: TextStyle(fontWeight: FontWeight.w600)),
        Text(formatted, style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.w800)),
      ],
    );
  }
}

class _TextBox extends StatelessWidget {
  final String label;
  final int maxLines;
  const _TextBox({required this.label, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
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
