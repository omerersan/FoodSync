import 'package:flutter/material.dart';

class PlaningScreen extends StatelessWidget {
  PlaningScreen({super.key});

  final List<String> weeklyMealPlan = [
    'Pazartesi - Tavuklu Salata',
    'Salı - Makarna & Sos',
    'Çarşamba - Izgara Somon',
    'Perşembe - Karnıbahar Kızartması',
    'Cuma - Pizza',
    'Cumartesi - Etli Tacos',
    'Pazar - Sebzeli Börek',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planlama Sayfası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Haftalık Yemek Planı',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2,
              ),
              itemCount: weeklyMealPlan.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 223, 247, 223),
                  child: Center(
                    child: Text(
                      weeklyMealPlan[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
