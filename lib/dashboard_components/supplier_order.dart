import 'package:flutter/material.dart';

import '../widgets/appbar_widgets.dart';

class SupplierOrder extends StatelessWidget {
  const SupplierOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(
          title: 'Supplier Orders',
        ),
        leading: const backbutton(),
      ),
    );
  }
}
