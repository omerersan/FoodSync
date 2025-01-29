import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/bottom_menu.dart';

class PlaningScreen extends StatefulWidget {
  const PlaningScreen({super.key});

  @override
  State<PlaningScreen> createState() => _PlaningScreenState();
}

class _PlaningScreenState extends State<PlaningScreen> {
  final List<Map<String, String>> weeklyMealPlan = [
    {'day': 'Pazartesi', 'meal': 'Tavuklu Salata'},
    {'day': 'Salı', 'meal': 'Makarna & Sos'},
    {'day': 'Çarşamba', 'meal': 'Izgara Somon'},
    {'day': 'Perşembe', 'meal': 'Karnıbahar Kızartması'},
    {'day': 'Cuma', 'meal': 'Pizza'},
    {'day': 'Cumartesi', 'meal': 'Etli Tacos'},
    {'day': 'Pazar', 'meal': 'Sebzeli Börek'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planlama Sayfası'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Haftalık Yemek Planı',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 3),
                ),
                itemCount: weeklyMealPlan.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailScreen(
                              meal: weeklyMealPlan[index]['meal']!),
                        ),
                      );
                    },
                    child: Card(
                      color: const Color(0xFF81C784),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weeklyMealPlan[index]['day']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                weeklyMealPlan[index]['meal']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class MealDetailScreen extends StatelessWidget {
  final String meal;
  const MealDetailScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(meal), backgroundColor: const Color(0xFF4CAF50)),
      body: Center(
        child: Text(
          '$meal tarifi yakında eklenecek.',
          style: const TextStyle(fontSize: 18, color: Color(0xFFFF7043)),
        ),
      ),
    );
  }
}
