import 'package:flutter/material.dart';

class CreateVideoScreen extends StatefulWidget {
  const CreateVideoScreen({super.key});

  @override
  State<CreateVideoScreen> createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {
  bool _isRecording = false;
  int _selectedTab = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Cámara (simulada)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[900],
            child: Center(
              child: Icon(
                Icons.camera_alt,
                size: 100,
                color: Colors.grey[700],
              ),
            ),
          ),
          
          // Controles superiores
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.music_note),
                        color: Colors.white,
                        onPressed: () {
                          // Mostrar selector de música
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.speed),
                        color: Colors.white,
                        onPressed: () {
                          // Mostrar selector de velocidad
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.filter),
                        color: Colors.white,
                        onPressed: () {
                          // Mostrar filtros
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Controles inferiores
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Pestañas de duración
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDurationTab(0, '15s'),
                      _buildDurationTab(1, '60s'),
                      _buildDurationTab(2, '3m'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Botón de grabación
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.image),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          // Abrir galería
                        },
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isRecording = !_isRecording;
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                          child: Center(
                            child: _isRecording
                                ? Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.white,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.flip_camera_ios),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          // Cambiar cámara
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Texto de efectos
                  const Text(
                    'Efectos',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Carrusel de efectos
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 70,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.auto_fix_high,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDurationTab(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: _selectedTab == index ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _selectedTab == index ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

