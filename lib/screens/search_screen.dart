import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

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
      'title': 'Karnabahar Kızartması',
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
      'steps': '1. Pizza hamurunu tepsiye yayın ve üzerine domates sosunu sürün. \n'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarif ve Arama'),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Tarif ara...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFFF7043),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return Card(
                    child: ListTile(
                      title: Text(recipe['title']!),
                      subtitle: Text('Süre: ${recipe['cookTime']}',
                          style: const TextStyle(
                            color: Color(0xFFFFB74D),
                          )),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailScreen(recipe: recipe),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, String> recipe;

  const RecipeDetailScreen({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']!),
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Malzemeler',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFA726),
              ),
            ),
            const SizedBox(height: 10),
            Text(recipe['ingredients']!),
            const SizedBox(height: 20),
            const Text(
              'Adımlar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFA726),
              ),
            ),
            const SizedBox(height: 10),
            Text(recipe['steps']!),
          ],
        ),
      ),
    );
  }
}
