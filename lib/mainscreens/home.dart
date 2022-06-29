import 'package:flutter/material.dart';
import 'package:multi_store_app/gallery/accessories_gallery.dart';
import 'package:multi_store_app/gallery/bags_gallery.dart';
import 'package:multi_store_app/gallery/beauty_gallery.dart';
import 'package:multi_store_app/gallery/electronics_gallery.dart';
import 'package:multi_store_app/gallery/homesandgarden_gallery.dart';
import 'package:multi_store_app/gallery/kids_gallery.dart';
import 'package:multi_store_app/gallery/men_gallery.dart';
import 'package:multi_store_app/gallery/shoes_gallery.dart';
import 'package:multi_store_app/gallery/women_gallery.dart';

//import '../minor_screens/search.dart';
import '../widgets/fake_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade300.withOpacity(0.5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Fakesearch(),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 8,
            tabs: [
              RepetedTab(label: 'MEN'),
              RepetedTab(label: 'WOMEN'),
              RepetedTab(label: 'SHOES'),
              RepetedTab(label: 'BAGS'),
              RepetedTab(label: 'Electronics'),
              RepetedTab(label: 'Accessories'),
              RepetedTab(label: 'Home & Garden'),
              RepetedTab(label: 'KIDs'),
              RepetedTab(label: 'Beauty'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          MenGalleryScreen(),
          WomenGalleryScreen(),
          ShoesGalleryScreen(),
          BagsGalleryScreen(),
          ElectronicsGalleryScreen(),
          AccessoriesGalleryScreen(),
          HomesAndGardenGalleryScreen(),
          KidsGalleryScreen(),
          BeautyGalleryScreen(),
        ]),
      ),
    );
  }
}

class RepetedTab extends StatelessWidget {
  final String label;
  const RepetedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(label, style: TextStyle(color: Colors.grey.shade600)),
    );
  }
}
