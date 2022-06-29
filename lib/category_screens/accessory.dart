import 'package:flutter/material.dart';
import '../utilities/categ_list.dart';
import '../widgets/catog_widgets.dart';

class AccCategory extends StatelessWidget {
  const AccCategory({Key? key}) : super(key: key);

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
                  const CategHeaderLabel(headerlabel: 'Accessories'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3,
                      children: List.generate(accessories.length - 1, (index) {
                        return subcategmodel(
                          maincategName: 'ACCESSORIES',
                          subcategName: accessories[index + 1],
                          assetname: 'images/accessories/accessories$index.jpg',
                          subcategLabel: accessories[index + 1],
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
              child: SliderBar(maincategname: 'ACCESSORIES')),
        ],
      ),
    );
  }
}
