import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';
import '../core/themes.dart';
import '../widgets/bottom_menu.dart';
import '../widgets/suggested_action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('FoodSync', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.moon),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  CupertinoIcons.person_circle,
                  size: 50,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              accountName: Text("Hoşgeldin, Ömer"),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.search),
              title: Text('Arama Geçmişi'),
              onTap: () => context.push("/search"),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text('Profil'),
              onTap: () => context.push("/profile"),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings),
              title: Text('Ayarlar'),
              onTap: () => context.push("/settings"),
            ),
            Spacer(),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Çıkış Yap'),
              onTap: () => context.go("/login"),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Günlük Yemek Önerileri",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildFoodSuggestionCard(
                              "assets/images/spaghetti.jpg", "Spagetti"),
                          _buildFoodSuggestionCard(
                              "assets/images/salad.jpg", "Tavuklu Salata"),
                          _buildFoodSuggestionCard(
                              "assets/images/köfte.jpg", "İnegöl Köfte"),
                          _buildFoodSuggestionCard(
                              "assets/images/pizza.jpg", "İtalyan Pizza"),
                          _buildFoodSuggestionCard(
                              "assets/images/sushi.jpg", "Sushi"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView(
                  padding: EdgeInsets.all(24),
                  children: [
                    SuggestedActionCard(
                      icon: Icons.chat,
                      title: "Sohbet Başlat",
                      subtitle: "Yapay zeka ile sohbet edin",
                      onTap: () => context.push("/voice"),
                    ),
                    SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.history,
                      title: "Son Aramalar",
                      subtitle: "Geçmiş aramalarınızı görüntüleyin",
                      onTap: () => context.push("/search"),
                    ),
                    SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: Icons.settings,
                      title: "Ayarlar",
                      subtitle: "Uygulama ayarlarını özelleştirin",
                      onTap: () => context.push("/settings"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }

  Widget _buildFoodSuggestionCard(String imagePath, String title) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath,
                height: 150, width: 200, fit: BoxFit.cover),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
