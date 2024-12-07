import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanRengim,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 167, 69),
        title: const Text('FoodSync'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.app),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 167, 220, 168),
        elevation: 0,
        child: Column(
          children: [
            const SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('Arama'),
              onTap: () {
                context.go("/search");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profile'),
              onTap: () {
                context.go("/profile");
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Günlük Yemek Önerileri',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(scrollDirection: Axis.horizontal, children: [
                _buildFoodCard('Spagetti', 'Lezzetli İtalyan Makarnası',
                    'assets/images/spaghetti.jpg'),
                _buildFoodCard('Tavuklu Salata', 'Sağlıklı ve Lezzetli',
                    'assets/images/salad.jpg'),
                _buildFoodCard(
                    'Lazanya', 'İtalyan Mutfağı', 'assets/images/lasagna.jpg'),
                _buildFoodCard('Sushi', 'Japon Mutfağının En Ünlü Bireyi',
                    'assets/images/sushi.jpg'),
                _buildFoodCard('Köfte', 'Türk Mutfağının Vazgeçilmezi',
                    'assets/images/köfte.jpg'),
                _buildFoodCard('Pizza', 'İtalyanların Vazgeçilmezi',
                    'assets/images/pizza.jpg'),
              ]),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kısa Rota',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.shopping_cart, 'Alışverişe Başla'),
                _buildActionButton(Icons.restaurant, 'Yemek Pişir'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  Widget _buildFoodCard(String foodName, String description, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 120,
              width: 160,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            foodName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 40, 167, 69),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      icon: Icon(
        icon,
        size: 30,
      ),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      onPressed: () {
        if (kDebugMode) {
          print('$label butonuna tıklandı');
        }
      },
    );
  }
}
