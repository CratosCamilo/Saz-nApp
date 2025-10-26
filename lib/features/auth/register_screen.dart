import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _name = TextEditingController();
  final _last = TextEditingController();
  final _email = TextEditingController();
  final _pass  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: .35,
            child: Image.network(
              'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?q=80&w=1200',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text('Crear cuenta', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
                  const SizedBox(height: 24),
                  AppTextField(hint: 'Nombre', controller: _name),
                  const SizedBox(height: 12),
                  AppTextField(hint: 'Apellido', controller: _last),
                  const SizedBox(height: 12),
                  AppTextField(hint: 'Correo electrónico', icon: Icons.mail_outline, controller: _email),
                  const SizedBox(height: 12),
                  AppTextField(hint: 'Contraseña', icon: Icons.lock_outline, obscure: true, controller: _pass),
                  const SizedBox(height: 16),
                  AppButton(label: 'Crear cuenta', onPressed: () {}),
                  const Spacer(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
