import 'package:dars36_n15/widgets/my_product.dart';
import 'package:flutter/material.dart';

class OnlineShopScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnlineShopScreenState();
  }
}

class _OnlineShopScreenState extends State<OnlineShopScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();

  final List<Map<String, dynamic>> products = [
    {
      "title": "Olma",
      "price": 10.5,
      "image":
          "https://organicmandya.com/cdn/shop/files/Apples_bf998dd2-0ee8-4880-9726-0723c6fbcff3.jpg?v=1721368465&width=1000",
    },
    {
      "title": "Behi",
      "price": 19.5,
      "image":
          "https://organicmandya.com/cdn/shop/files/Apples_bf998dd2-0ee8-4880-9726-0723c6fbcff3.jpg?v=1721368465&width=1000",
    },
    {
      "title": "Anor",
      "price": 2.5,
      "image":
          "https://organicmandya.com/cdn/shop/files/Apples_bf998dd2-0ee8-4880-9726-0723c6fbcff3.jpg?v=1721368465&width=1000",
    },
  ];

  void addProduct() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text("Mahsulot qo'shish"),
          content: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              //! TextField = foydalanuvchi matn kiritishi uchun ishlatiladigan widget
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Nomi",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Narxi",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  labelText: "Rasmi uchun havola",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Bekor qilish"),
            ),
            TextButton(
              onPressed: () {
                //? Birinchi ma'lumotlarni olib keyin qo'shamiz

                final name = nameController.text;
                final price = priceController.text;
                final image = imageController.text;

                products.add({
                  "title": name,
                  "price": double.parse(price),
                  "image": image,
                });
                setState(() {});

                nameController.clear();
                priceController.clear();
                imageController.clear();
                Navigator.pop(context);
              },
              child: Text("Juda Okay"),
            ),
          ],
        );
      },
    );
  }

  void editProduct(int index) {
    Map<String, dynamic> oldProduct = products[index];

    // nameController.text = oldProduct["title"];
    // showDialog(context: context, builder: builder)

    oldProduct["title"] = "New Apple";
    oldProduct["price"] = 90.9;
    // oldProduct["image"] = "";
    setState(() {});
  }

  void deleteProduct(int index) {
    products.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "ONLINE SHOP",
        ),
        actions: [
          IconButton(
            onPressed: addProduct,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            for (var i = 0; i < products.length; i++)
              MyProduct(
                title: products[i]['title'],
                price: products[i]['price'],
                image: products[i]['image'],
                delete: () {
                  deleteProduct(i);
                },
                edit: () {
                  print("Qalamcha bosildi");
                  editProduct(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}
