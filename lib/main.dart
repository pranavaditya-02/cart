import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: MyCartPage(),
    );
  }
}

class MyCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('My Cart'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {

              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(product: products[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal:', style: TextStyle(fontSize: 16.0)),
                          Text('\$${calculateSubtotal().toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery:', style: TextStyle(fontSize: 16.0)),
                          Text('Free', style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tax Fee:', style: TextStyle(fontSize: 16.0)),
                          Text('\$25.00', style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ),
                    Divider(height: 32.0, thickness: 2.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          Text('\$${calculateTotal().toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Proceed to Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateSubtotal() {
    double subtotal = 0.0;
    for (var product in products) {
      subtotal += (product.price * product.quantity);
    }
    return subtotal;
  }

  double calculateTotal() {
    double total = calculateSubtotal() + 25.0; 
    return total;
  }
}

class CartItemWidget extends StatelessWidget {
  final Product product;

  CartItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Container(
          height: 400, 
          width: 100, 
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                product.name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color: ${product.color}',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Size: ${product.size}',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity: ${product.quantity}',
                  style: TextStyle(fontSize: 14.0),
                ),
                Text(
                  '\$${(product.price * product.quantity).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(height: 8.0), 
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String color;
  final String size;
  final int quantity;
  final double price;
  final String imageUrl;

  Product(
      {required this.name,
      required this.color,
      required this.size,
      required this.quantity,
      required this.price,
      required this.imageUrl});
}

List<Product> products = [
  Product(
      name: 'Navy Pullover Hoodie',
      color: 'Blue',
      size: 'M',
      quantity: 1,
      price: 50.0,
      imageUrl:
          'https://fullyfilmy.in/cdn/shop/files/Navy_7e4fa346-a1b8-4e65-8f99-acfddb84731b.jpg?v=1700722858'),
  Product(
      name: 'Black T-Shirt',
      color: 'Black',
      size: 'L',
      quantity: 2,
      price: 25.0,
      imageUrl:
          'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3JvYl9yYXdwaXhlbF9ibGFua19kYXJrX3RzaGlydF90c2hpcnRfbW9ja18tX3VwX3RzaGlydF90ZWNoXy1fcF9mMmFmNGZjMS1kOGZhLTRhODEtOWFjMy03YmY1M2FhODA2NDkuanBn.jpg'),
  Product(
      name: 'White Sneakers',
      color: 'White',
      size: 'XL',
      quantity: 1,
      price: 75.0,
      imageUrl:
          'https://shoewarehouse.com.au/cdn/shop/articles/White_Sneaker_Blog_Thumbnail.jpg?v=1693455706'),
  Product(
      name: 'Nike Socks Pack of 3',
      color: 'Multi-Color',
      size: 'One Size',
      quantity: 1,
      price: 20.0,
      imageUrl:
          'https://3.imimg.com/data3/IQ/YX/MY-20772541/nike-socks-pack-of-3-sdl463685284-1-59fea-500x500.jpg'),
];
