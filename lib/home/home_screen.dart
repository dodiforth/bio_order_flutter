import 'package:e_product_order_flutter/common/theme/custom_colors.dart';
import 'package:e_product_order_flutter/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Bio Order",
            style: TextStyle(fontSize: 22, fontFamily: "RentStrike")),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _menuIndex,
        children: [
          HomeWidget(),
          Container(color: Colors.indigo,),
        ],
      ),
      floatingActionButton: switch(_menuIndex){
        0 => FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        1 => FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.add),
        ),
        _ => Container(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex: _menuIndex,
        onDestinationSelected: (idx) {
          setState(() {
            _menuIndex = idx;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
              icon: Icon(Icons.store_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.storefront), label: 'Seller'),
        ],
      ),
    );
  }
}
