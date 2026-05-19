import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WishlistPage(),
    );
  }
}

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {

  List<Map<String, dynamic>> products = [

    {
      "name": "Smart Watch",
      "price": "\ ₹299",
      "liked": false,
    },

    {
      "name": "Headphones",
      "price": "\ ₹199",
      "liked": false,
    },

    {
      "name": "Laptop",
      "price": "\ ₹999",
      "liked": false,
    },

    {
      "name": "Mobile Phone",
      "price": "\ ₹799",
      "liked": false,
    },
  ];

  @override
  void initState() {
    super.initState();
    print("Wishlist Page Initialized");
  }

  @override
  void dispose() {
    print("Wishlist Page Disposed");
    super.dispose();
  }

  void toggleWishlist(int index) {

    setState(() {

      products[index]["liked"] =
          !products[index]["liked"];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Wishlist Toggle"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),


      body: ListView.builder(
        itemCount: products.length,

        itemBuilder: (context, index) {

          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Text(
                  products[index]["name"][0],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              title: Text(
                products[index]["name"],
              ),

              subtitle: Text(
                products[index]["price"],
              ),

              trailing: IconButton(

                onPressed: () {
                  toggleWishlist(index);
                },

                icon: Icon(

                  products[index]["liked"]
                      ? Icons.favorite
                      : Icons.favorite_border,

                  color:
                  products[index]["liked"]
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}