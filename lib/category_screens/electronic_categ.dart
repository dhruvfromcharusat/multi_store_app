import 'package:flutter/material.dart';
import '../utilities/categ_list.dart';
import '../widgets/catog_widgets.dart';

class EleCategory extends StatelessWidget {
  const EleCategory({Key? key}) : super(key: key);

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
                  const CategHeaderLabel(headerlabel: 'electronics'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3,
                      children: List.generate(electronics.length - 1, (index) {
                        return subcategmodel(
                          maincategName: 'electronics',
                          subcategName: electronics[index + 1],
                          assetname: 'images/electronics/electronics$index.jpg',
                          subcategLabel: electronics[index + 1],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
              bottom: 0, right: 0, child: SliderBar(maincategname: 'SHOES')),
        ],
      ),
    );
  }
}
