import 'package:flutter/material.dart';
import 'package:flutter_app/screens/search_screen.dart';
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
    final List<Map<String, String>> recipes = [
      {
        'title': 'Tavuklu Salata',
        'ingredients':
            'Tavuk Göğsü, Marul, Domates, Salatalık, Limon, Zeytinyağı, Tuz',
        'cookTime': '20 dk',
        'steps': '1. Tavuk göğsünü haşlayın ve ince ince dilimleyin. \n'
            '2. Marul, domates ve salatalığı doğrayarak bir salata kasesine alın. \n'
            '3. Tavuk dilimlerini üzerine ekleyin. \n'
            '4. Limon suyu, zeytinyağı ve tuz ile sos hazırlayıp salatanın üzerine dökün. \n'
            '5. Karıştırıp servis edin.'
      },
      {
        'title': 'Makarna & Sos',
        'ingredients':
            'Makarna, Domates Sosu, Sarımsak, Zeytinyağı, Tuz, Parmesan Peyniri',
        'cookTime': '15 dk',
        'steps': '1. Makarnayı tuzlu kaynar suda paket talimatlarına göre haşlayın. \n'
            '2. Zeytinyağını bir tavada ısıtın, ince doğranmış sarımsağı ekleyip hafifçe kavurun. \n'
            '3. Domates sosunu ekleyip birkaç dakika pişirin. \n'
            '4. Haşlanmış makarnayı süzüp tavaya alın, sosla iyice karıştırın. \n'
            '5. Üzerine parmesan serpip servis edin.'
      },
      {
        'title': 'Izgara Somon',
        'ingredients':
            'Somon Fileto, Zeytinyağı, Limon, Sarımsak, Karabiber, Tuz',
        'cookTime': '25 dk',
        'steps':
            '1. Somon filetolarını zeytinyağı, limon suyu, dövülmüş sarımsak, tuz ve karabiber ile marine edin. \n'
                '2. Filetoları 10 dakika marine olmaya bırakın. \n'
                '3. Izgarayı ısıtın ve somonları her iki tarafını 3-4 dakika pişirin. \n'
                '4. Yanına limon dilimleri ile servis yapın.'
      },
      {
        'title': 'Karnıbahar Kızartması',
        'ingredients':
            'Karnabahar, Un, Yumurta, Galeta Unu, Tuz, Karabiber, Kızartma Yağı',
        'cookTime': '30 dk',
        'steps': '1. Karnabaharı çiçeklere ayırın ve tuzlu suda hafif yumuşayana kadar haşlayın. \n'
            '2. Karnabaharları önce una, sonra çırpılmış yumurtaya, ardından galeta ununa bulayın. \n'
            '3. Yağı bir tavada ısıtın ve karnabaharları altın rengini alana kadar kızartın. \n'
            '4. Havlu kağıt üzerinde fazla yağı süzdürüp servis edin.'
      },
      {
        'title': 'Pizza',
        'ingredients':
            'Pizza Hamuru, Domates Sosu, Mozzarella, Sucuk, Mantar, Zeytin',
        'cookTime': '20 dk',
        'steps':
            '1. Pizza hamurunu tepsiye yayın ve üzerine domates sosunu sürün. \n'
                '2. Mozzarella peyniri, sucuk, mantar ve zeytin dilimlerini üzerine yerleştirin. \n'
                '3. Önceden ısıtılmış 200°C fırında 15-20 dakika pişirin. \n'
                '4. Dilimleyerek servis edin.'
      },
      {
        'title': 'Etli Tacos',
        'ingredients':
            'Taco Kabukları, Kıyma, Soğan, Sarımsak, Baharatlar, Marul, Domates, Cheddar Peyniri',
        'cookTime': '30 dk',
        'steps': '1. Kıymayı ince doğranmış soğan ve sarımsakla tavada kavurun. \n'
            '2. Baharatları ekleyin (tuz, karabiber, kimyon, pul biber). \n'
            '3. Tacos kabuklarını fırında hafif ısıtın. \n'
            '4. Marul, domates ve kıymayı tacos kabuklarının içine doldurun. \n'
            '5. Üzerine rendelenmiş cheddar serpin ve servis edin.'
      },
      {
        'title': 'Sebzeli Börek',
        'ingredients':
            'Yufka, Ispanak, Beyaz Peynir, Soğan, Süt, Yumurta, Zeytinyağı',
        'cookTime': '40 dk',
        'steps': '1. Ispanakları yıkayın ve doğrayın, soğanı ince ince doğrayarak kavurun. \n'
            '2. Kavrulmuş soğana ıspanak ve beyaz peyniri ekleyip karıştırın. \n'
            '3. Yufkaları serin, süt ve yumurtayla hazırlanan karışımı üzerine sürün. \n'
            '4. İç harcı yufkaya yerleştirip rulo şeklinde sarın. \n'
            '5. Önceden ısıtılmış 180°C fırında üzeri kızarana kadar pişirin.'
      }
    ];

    final recipe = recipes.firstWhere(
      (r) => r['title'] == meal,
      orElse: () => {},
    );

    return Scaffold(
      body: recipe.isNotEmpty
          ? RecipeDetailScreen(recipe: recipe)
          : Center(
              child: Text(
                '$meal tarifi yakında eklenecek.',
                style: const TextStyle(fontSize: 18, color: Color(0xFFFF7043)),
              ),
            ),
    );
  }
}
