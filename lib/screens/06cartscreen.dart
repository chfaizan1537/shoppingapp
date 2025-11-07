import 'package:flutter/material.dart';
import 'package:shoppingapp/model/cartmodel.dart';
import 'package:shoppingapp/screens/02homescreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  double getTotalPrice() {
    double total = 0.0;
    for (var item in CartModel.getCartItems()) {
      // handle null and ensure a double
      total += (item.price ?? 0).toDouble();
    }
    return total;
  }


  @override
  Widget build(BuildContext context) {
    final cartItems = CartModel.getCartItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('🛒 Your cart is empty!'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      '${item.thumbnail}',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text('${item.title}'),
                    subtitle: Text('\$${item.price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          CartModel.removeFromCart(item);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          // 🧾 Total Price Section
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.greenAccent.withOpacity(0.2),
              border: Border(
                top: BorderSide(color: Colors.greenAccent, width: 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${getTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              padding:
              EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Proceeding to checkout (not implemented yet)!')));
            },
            child: Text('Checkout',
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.transparent,
        color: Colors.greenAccent,
        height: 60,
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.shopping_cart, size: 30),

        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => homescreen()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => cartscreen()));
          }
        },
      ),
    );
  }
}
