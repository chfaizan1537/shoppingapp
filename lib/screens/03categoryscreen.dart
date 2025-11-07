import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/model/productmodel.dart';
import 'package:shoppingapp/screens/04detailscreen.dart';

class categoryscreen extends StatefulWidget {
  var categoryname;
  categoryscreen({super.key, required this.categoryname});

  @override
  State<categoryscreen> createState() => _categoryscreenState();
}

class _categoryscreenState extends State<categoryscreen> {
  List category = [];
  Future<Productmodel> getcategory() async {
    var url = 'https://dummyjson.com/products/category/${widget.categoryname}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body.toString());
      return Productmodel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryname}'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Expanded(
            child: FutureBuilder(
              future: getcategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                } else {
                  final products = snapshot.data!.productsList!;
                  return Padding(
                    padding: EdgeInsetsGeometry.only(left: 9,right: 9),
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detail(products: products[index]),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.grey.shade300,
                            elevation: 4,
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    '${snapshot.data!.productsList![index].thumbnail}',
                                  ),
                                  height: 130,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${snapshot.data!.productsList![index].title}',
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '\$${snapshot.data!.productsList![index].price}',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
