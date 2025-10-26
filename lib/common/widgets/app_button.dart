import 'package:flutter/material.dart';
import '../../app/theme.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.filled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18, color: filled ? Colors.white : AppColors.text),
          const SizedBox(width: 8),
        ],
        Text(label, style: TextStyle(
          color: filled ? Colors.white : AppColors.text,
          fontWeight: FontWeight.w600,
        )),
      ],
    );

    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? AppColors.accent : AppColors.primary,
          foregroundColor: filled ? Colors.white : AppColors.text,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
