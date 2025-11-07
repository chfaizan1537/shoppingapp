import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoppingapp/model/categoriesmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/screens/03categoryscreen.dart';
import 'package:shoppingapp/model/productmodel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shoppingapp/screens/04detailscreen.dart';
import 'package:shoppingapp/screens/06cartscreen.dart';
class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<CategoryModel> allcategories = [];
  Future<List<CategoryModel>> fetchcategories() async {
    allcategories.clear();
    var url = 'https://dummyjson.com/products/categories';
    var response = await http.get(Uri.parse(url));
    var body = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in body) {
        allcategories.add(CategoryModel.fromJson(i));
      }
      return allcategories;
    } else {
      throw Exception('Error');
    }
  }
  Future<Productmodel> fetchTrendingProducts() async {
    var url = 'https://dummyjson.com/products?limit=10';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Productmodel.fromJson(data);
    } else {
      throw Exception('Failed to load trending products');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.greenAccent,
        height: 60,
        items: [
          Icon(Icons.home, size: 30),

          Icon(Icons.shopping_cart, size: 30),
        ],
        onTap: (index) {
          if(index==0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => homescreen(),));
          }
          else if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context) => cartscreen(),));

          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Shopifty'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'All Categories ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            //category container
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),

            SizedBox(
              height: 60,
              child: FutureBuilder(
                future: fetchcategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No categories found'));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => categoryscreen(categoryname: snapshot.data![index].name)
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black),
                              color: Colors.grey.shade300,
                            ),
                            child: Padding(
                              padding: EdgeInsetsGeometry.all(10),
                              child: Text('${snapshot.data![index].name}'),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),

            SizedBox(height: 30,),
            Row(children: [
              SizedBox(width: 20,),
              Text('Buy with Shopifty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

            ],),
            SizedBox(height: 30,),
            // banner container
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // banner 1
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/banner4.jpg',
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // banner 2
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/banner2.jpg',
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // banner 3
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/banner3.jpg',
                        width: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            // Trending Products Section
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Trending Products',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: 20),

            FutureBuilder(
              future: fetchTrendingProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return Center(child: Text('No products found'));
                }

                final products = snapshot.data!.productsList!;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {

                      },
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:  (context) => detail(products: products[index]),));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                  '${products[index].thumbnail}',
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10),
                                // 🧾 Title
                                Text(
                                  '${products[index].title}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 5),

                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$${products[index].price}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 17
                                      ),
                                    ),
                                    // Icon(Icons.add_shopping_cart_outlined, size: 18),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),



          ],
        ),
      ),
    );
  }
}
