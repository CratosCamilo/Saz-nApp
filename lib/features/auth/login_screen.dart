import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
              'https://images.unsplash.com/photo-1512058564366-18510be2db19?q=80&w=1200',
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
                  Text('Iniciar sesión', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
                  const SizedBox(height: 24),
                  AppTextField(hint: 'Correo electrónico', icon: Icons.mail_outline, controller: _email),
                  const SizedBox(height: 12),
                  AppTextField(hint: 'Contraseña', icon: Icons.lock_outline, obscure: true, controller: _pass),
                  const SizedBox(height: 16),
                  AppButton(label: 'Iniciar sesión', onPressed: () {}),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('¿Olvidaste tu contraseña?', style: TextStyle(color: Colors.white.withOpacity(.9))),
                  ),
                  const Spacer(),
                  AppButton(
                    label: 'Iniciar sesión con huella',
                    filled: false,
                    icon: Icons.fingerprint,
                    onPressed: () {},
                  ),
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
