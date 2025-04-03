import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('@usuario'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Perfil del usuario
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Foto de perfil
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                ),
                const SizedBox(height: 16),
                
                // Nombre de usuario
                const Text(
                  '@usuario',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Estadísticas
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatColumn('Siguiendo', '120'),
                    Container(
                      height: 24,
                      width: 1,
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    _buildStatColumn('Seguidores', '1.2K'),
                    Container(
                      height: 24,
                      width: 1,
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    _buildStatColumn('Me gusta', '15.4K'),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Botón de editar perfil
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                    ),
                    child: const Text('Editar perfil'),
                  ),
                ),
              ],
            ),
          ),
          
          // Pestañas de videos
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on)),
                      Tab(icon: Icon(Icons.favorite_border)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Videos del usuario
                        GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey[900],
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      'https://picsum.photos/200/300?random=$index',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 5,
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '1.2K',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        
                        // Videos que le gustan al usuario
                        GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey[900],
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      'https://picsum.photos/200/300?random=${index + 100}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 5,
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '3.4K',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

