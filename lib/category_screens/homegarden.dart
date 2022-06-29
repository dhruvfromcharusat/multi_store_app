import 'package:flutter/material.dart';
import '../utilities/categ_list.dart';
import '../widgets/catog_widgets.dart';

class HomeGradenCategory extends StatelessWidget {
  const HomeGradenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeaderLabel(headerlabel: 'Home and Graden'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3,
                      children:
                          List.generate(homeandgarden.length - 1, (index) {
                        return subcategmodel(
                          maincategName: 'Home and Garden',
                          subcategName: homeandgarden[index + 1],
                          assetname: 'images/homegarden/home$index.jpg',
                          subcategLabel: homeandgarden[index + 1],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
              bottom: 0,
              right: 0,
              child: SliderBar(maincategname: 'Home and Garden')),
        ],
      ),
    );
  }
}
