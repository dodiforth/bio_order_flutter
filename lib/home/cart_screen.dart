import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carts"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Product Name"),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                              Text("€ Product Price"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove_circle_outline),
                                  ),
                                  Text("32"),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, _) => Divider(),
              itemCount: 10,
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "€ 300.00",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
          ),
          Container(
            height: 72,
            decoration: BoxDecoration(
              color: Colors.red[100],
            ),
            child: Center(
              child: Text(
                "CHECKOUT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
