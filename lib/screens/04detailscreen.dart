import 'package:flutter/material.dart';
import 'package:shoppingapp/model/productmodel.dart';
import 'package:shoppingapp/model/cartmodel.dart';

class detail extends StatefulWidget {
  final Products products;
  detail({super.key, required this.products});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Detail Screen '),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.grey.shade300,
                  elevation: 5,

                  child: Image(
                    image: NetworkImage('${widget.products.thumbnail}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${widget.products.title}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(),
            Row(
              children: [
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text('${widget.products.category}'),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text('${widget.products.stock} Pieces left'),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Text('${widget.products.shippingInformation}'),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Text(
                '${widget.products.description}',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 20,),
            Row(

              children: [

                SizedBox(width: 10),
                Text(
                  'Price',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 30,),
                Text('Minimum Order',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)


              ],
            ),
            Row(children: [
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: Colors.grey.shade300

                ),

                child: Padding(
                  padding: EdgeInsetsGeometry.all(10),
                  child: Text(
                    '\$${widget.products.price}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),),
              SizedBox(width: 20,),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      color: Colors.grey.shade300

                  ),
                  child: Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: Text('${widget.products.minimumOrderQuantity} Pieces',style: TextStyle(fontSize: 16),)))

            ],),
            Divider(),
            SizedBox(height: 10),
            Row(children: [
              SizedBox(width: 10,),
              Text('Created At ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ],),
            SizedBox(height: 10,),
            Row(children: [
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: Colors.grey.shade300

                ),
                  child: Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: Text('${widget.products.meta!.createdAt}',style: TextStyle(fontSize: 18),))),

            ],),
            SizedBox(height: 10),
            Row(children: [
              SizedBox(width: 10,),
              Text('Last Updated',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ],),
            SizedBox(height: 10,),
            Row(children: [
              SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: Colors.grey.shade300

                ),
                  child: Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: Text('${widget.products.meta!.updatedAt}',style: TextStyle(fontSize: 18),))),

            ],),

            SizedBox(height: 30),
            Row(children: [SizedBox(width: 10,),
            Text('Scan Me', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ],),
            Image(image: NetworkImage('${widget.products.meta!.qrCode}')),
            Text('${widget.products.meta!.barcode}',style: TextStyle(fontSize: 17),),

            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Reviews',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: SizedBox(
                height: 200,
                width: 400,
                child: PageView.builder(
                  itemCount: widget.products.reviewsList!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                '${widget.products.reviewsList![index].reviewerName}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                '${widget.products.reviewsList![index].reviewerEmail}',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Row(
                            children: [
                              Text(
                                '${widget.products.reviewsList![index].comment}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: List.generate(
                              widget.products.reviewsList![index].rating!
                                  .toInt(),
                              (i) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                CartModel.addToCart(widget.products);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.products.title} added to cart!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 40,)


          ],
        ),
      ),
    );
  }
}
