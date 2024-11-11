import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class ProductGrid extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      "name": "Smartphone",
      "imageUrl":
          "https://c8.alamy.com/comp/DH80YG/iphone-5-smartphone-DH80YG.jpg",
      "price": "₹29,000"
    },
    {
      "name": "Laptop",
      "imageUrl":
          "https://media.istockphoto.com/id/1394988455/photo/laptop-with-a-blank-screen-on-a-white-background.jpg?b=1&s=612x612&w=0&k=20&c=VCCVeK25QpSCdGjiDgeviwz2pJfikLyclwhX-MQblhg=",
      "price": "₹50,000"
    },
    {
      "name": "Headphones",
      "imageUrl":
          "https://t4.ftcdn.net/jpg/05/24/48/71/360_F_524487156_zlY3rVr6PaU7GRLtvjGd0jDk31u4zrC5.jpg",
      "price": "₹5,000"
    },
    {
      "name": "Smart Watch",
      "imageUrl": "https://m.media-amazon.com/images/I/61icsCcbdKL.jpg",
      "price": "₹2,500"
    },
    {
      "name": "TV",
      "imageUrl":
          "https://media.istockphoto.com/id/518012149/photo/modern-tv.jpg?s=612x612&w=0&k=20&c=Bw5TV3I4UYgRZqpeGu2UCDQlUlqTNmrHtHGJBlpN2h8=",
      "price": "₹35,000"
    },
    {
      "name": "Refrigerator",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb0l3zRD4kbwKUw51p7T1k3LQ1ivB21ini_iqujKmbsee2gUBEAgsbmmnsf4mknaM17io&usqp=CAU",
      "price": "₹30,000"
    },
  ];

  ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => ProductDetailScreen(
                  name: product['name']!,
                  imageUrl: product['imageUrl']!,
                  price: product['price']!,
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    product['imageUrl']!,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product['price']!,
                    style: const TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
