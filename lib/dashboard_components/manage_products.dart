import 'package:flutter/material.dart';

import '../widgets/appbar_widgets.dart';

class ManageProduct extends StatelessWidget {
  const ManageProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: 'Manage products',
        ),
        leading: const backbutton(),
      ),
    );
  }
}
