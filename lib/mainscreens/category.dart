import 'package:flutter/material.dart';
import 'package:multi_store_app/category_screens/accessory.dart';
import 'package:multi_store_app/category_screens/bags_categ.dart';
import 'package:multi_store_app/category_screens/beauty.dart';
import 'package:multi_store_app/category_screens/electronic_categ.dart';
import 'package:multi_store_app/category_screens/homegarden.dart';
import 'package:multi_store_app/category_screens/kids.dart';
import 'package:multi_store_app/category_screens/men_category.dart';
import 'package:multi_store_app/category_screens/shoes_categ.dart';
import 'package:multi_store_app/category_screens/women_category.dart';
import 'package:multi_store_app/widgets/fake_search.dart';

List<ItemsData> items = [
  ItemsData(label: 'men'),
  ItemsData(label: 'women'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'bags'),
  ItemsData(label: 'electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'home and garden'),
  ItemsData(label: 'kids'),
  ItemsData(label: 'beauty')
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  @override
  // ignore: must_call_super
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Fakesearch(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
          Positioned(bottom: 0, right: 0, child: catagView(size)),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      //color: Colors.grey.shade300,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut);
                /*for (var element in items) {
                  element.isSelected = false;
                }
                setState(() {
                  items[index].isSelected = true;
                });*/
              },
              child: Container(
                  color: items[index].isSelected == true
                      ? Colors.white
                      : Colors.grey.shade300,
                  height: 100,
                  child: Center(child: Text(items[index].label))),
            );
          }),
    );
  }

  Widget catagView(Size size) {
    return Container(
        height: size.height * 0.8,
        width: size.width * 0.8,
        color: Colors.white,
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            for (var element in items) {
              element.isSelected = false;
            }
            setState(() {
              items[value].isSelected = true;
            });
          },
          scrollDirection: Axis.vertical,
          children: const [
            MenCategory(),
            WomenCategory(),
            ShoesCategory(),
            BagsCategory(),
            EleCategory(),
            AccCategory(),
            HomeGradenCategory(),
            KidCategory(),
            BeautyCategory(),
          ],
        ));
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}
