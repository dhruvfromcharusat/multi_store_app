import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_store_app/costomer_screens/customer_oreders.dart';
import 'package:multi_store_app/costomer_screens/customer_whishlist.dart';
import 'package:multi_store_app/widgets/appbar_widgets.dart';

import '../widgets/alert_dialog.dart';
import 'cart.dart';

class ProfileScreen extends StatefulWidget {
  final String documentId;
  const ProfileScreen({Key? key, required this.documentId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CollectionReference customers =
      FirebaseFirestore.instance.collection('Customers');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: customers.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return /*Text("Full Name: ${data['full_name']} ${data['last_name']}");*/

              Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: Stack(
              children: [
                Container(
                  height: 205,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.yellow, Colors.brown])),
                ),
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      centerTitle: true,
                      elevation: 0,
                      backgroundColor: Colors.white,
                      expandedHeight: 140,
                      flexibleSpace:
                          LayoutBuilder(builder: (context, constraints) {
                        return FlexibleSpaceBar(
                          title: AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: constraints.biggest.height <= 120 ? 1 : 0,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: Text(
                                'Account',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          background: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.yellow, Colors.brown])),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25, left: 25),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        NetworkImage(data['profileimage']),
                                  ),
                                  /*const CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage('images/inapp/guest.jpg'),
                                  ),*/
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Text(
                                      data['name'] == ''
                                          ? 'Guest'.toUpperCase()
                                          : data['name'].toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30)),
                                  ),
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: const Center(
                                        child: Text(
                                          'Cart',
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CartScreen(
                                            back: backbutton(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  color: Colors.yellow,
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: const Center(
                                        child: Text(
                                          'Orders',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CustomerOrder(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30)),
                                  ),
                                  child: TextButton(
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: const Center(
                                        child: Text(
                                          'WishList',
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WishlistScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey.shade300,
                            child: Column(children: [
                              const SizedBox(
                                height: 150,
                                child: Image(
                                    image: AssetImage('images/inapp/logo.jpg')),
                              ),

                              const ProfileHeaderLable(
                                  headerlable: ' Account Info. '),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 260,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    children: [
                                      RepetedListTile(
                                        title: 'Email Address',
                                        subTitle: data['email'],
                                        icon: Icons.email,
                                      ),
                                      const YellowDivider(),
                                      RepetedListTile(
                                        title: 'Phone Number',
                                        subTitle: data['phone'],
                                        icon: Icons.phone,
                                      ),
                                      const YellowDivider(),
                                      RepetedListTile(
                                        title: 'Address',
                                        subTitle: data['address'],
                                        icon: Icons.location_pin,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //account setting card
                              const ProfileHeaderLable(
                                  headerlable: ' Account Settings '),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 260,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    children: [
                                      RepetedListTile(
                                        title: 'Edit profile',
                                        subTitle: '',
                                        icon: Icons.edit,
                                        onpressed: () {},
                                      ),
                                      const YellowDivider(),
                                      RepetedListTile(
                                        title: 'change password',
                                        subTitle: '',
                                        icon: Icons.lock,
                                        onpressed: () {},
                                      ),
                                      const YellowDivider(),
                                      RepetedListTile(
                                        title: 'log out',
                                        subTitle: '',
                                        icon: Icons.logout,
                                        onpressed: () async {
                                          MyAlertDialog.showMyDialog(
                                            context: context,
                                            title: 'Log Out',
                                            content:
                                                'Are you sure you want to log out?',
                                            tabNo: () {
                                              Navigator.pop(context);
                                            },
                                            tabYes: () async {
                                              await FirebaseAuth.instance
                                                  .signOut();
                                              Navigator.pop(context);
                                              Navigator.pushReplacementNamed(
                                                  context, '/welcome_screen');
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        );
      },
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepetedListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onpressed;
  const RepetedListTile(
      {Key? key,
      required this.title,
      this.subTitle = '',
      required this.icon,
      this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLable extends StatelessWidget {
  final String headerlable;
  const ProfileHeaderLable({Key? key, required this.headerlable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
              width: 50,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            Text(
              headerlable,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 40,
              width: 50,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ));
  }
}
