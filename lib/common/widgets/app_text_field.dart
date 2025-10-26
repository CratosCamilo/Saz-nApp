import 'package:flutter/material.dart';
import '../../app/theme.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final bool obscure;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.hint,
    this.icon,
    this.obscure = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon, color: AppColors.text) : null,
      ),
    );
  }
}
