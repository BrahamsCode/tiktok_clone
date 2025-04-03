import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _selectImage() {
    // Implementar selección de imagen
  }

  void _signup() {
    setState(() {
      _isLoading = true;
    });

    // Simulación de registro
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      
      // Navegar a la pantalla principal
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              
              // Foto de perfil
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
                    backgroundColor: Colors.grey,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: _selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              
              // Campo de nombre de usuario
              CustomTextField(
                controller: _usernameController,
                hintText: 'Nombre de usuario',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24),
              
              // Campo de correo electrónico
              CustomTextField(
                controller: _emailController,
                hintText: 'Correo electrónico',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              
              // Campo de contraseña
              CustomTextField(
                controller: _passwordController,
                hintText: 'Contraseña',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),
              
              // Campo de confirmación de contraseña
              CustomTextField(
                controller: _confirmPasswordController,
                hintText: 'Confirmar contraseña',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),
              
              // Botón de registro
              InkWell(
                onTap: _signup,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.red,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Registrarse',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              
              // Enlace para iniciar sesión
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text('¿Ya tienes una cuenta? '),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

