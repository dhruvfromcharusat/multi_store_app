import 'package:flutter/material.dart';

import '../minor_screens/subcategory.dart';

class SliderBar extends StatelessWidget {
  final String maincategname;
  const SliderBar({Key? key, required this.maincategname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.05,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50)),
            child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  maincategname == 'beauty'.toUpperCase()
                      ? const Text('')
                      : const Text(
                          '<<',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 10),
                        ),
                  Text(
                    maincategname,
                    style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 10),
                  ),
                  maincategname == 'men'.toUpperCase()
                      ? const Text('')
                      : const Text(
                          '>>',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 10),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}

// ignore: camel_case_types
class subcategmodel extends StatelessWidget {
  final String maincategName;
  final String subcategName;
  final String assetname;
  final String subcategLabel;
  const subcategmodel(
      {Key? key,
      required this.assetname,
      required this.maincategName,
      required this.subcategLabel,
      required this.subcategName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategProducts(
                      maincategname: maincategName,
                      subcategname: subcategName,
                    )));
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(image: AssetImage(assetname)),
          ),
          Text(
            subcategLabel,
            style: const TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}

class CategHeaderLabel extends StatelessWidget {
  final String headerlabel;
  const CategHeaderLabel({Key? key, required this.headerlabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        headerlabel,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }
}
