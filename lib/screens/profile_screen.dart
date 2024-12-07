import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: const Color.fromARGB(255, 105, 181, 120),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://www.example.com/profil_resmi.jpg',
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Ömer Ersan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sağlık Hedefleri:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Kilo kaybı, haftada 3 gün egzersiz yapmak.',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 51, 51, 51),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Favori Tarifler:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Tavuklu Salata'),
              leading:
                  Icon(Icons.favorite, color: Color.fromARGB(255, 255, 165, 0)),
            ),
            ListTile(
              title: Text('Makarna & Sos'),
              leading:
                  Icon(Icons.favorite, color: Color.fromARGB(255, 255, 165, 0)),
            ),
            ListTile(
              title: Text('Izgara Somon'),
              leading:
                  Icon(Icons.favorite, color: Color.fromARGB(255, 255, 165, 0)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
