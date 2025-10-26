import 'package:flutter/material.dart';
import '../../app/theme.dart';

class QuantityStepper extends StatelessWidget {
  final int value;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const QuantityStepper({
    super.key,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: onRemove, icon: const Icon(Icons.remove), splashRadius: 18),
          Text('$value', style: const TextStyle(fontWeight: FontWeight.w600)),
          IconButton(onPressed: onAdd, icon: const Icon(Icons.add), splashRadius: 18),
        ],
      ),
    );
  }
}
