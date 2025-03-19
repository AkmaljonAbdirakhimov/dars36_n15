import 'package:flutter/material.dart';

class MyProduct extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Function() delete;
  final Function() edit;

  const MyProduct({
    required this.title,
    required this.price,
    required this.image,
    required this.delete,
    required this.edit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.7),
                blurRadius: 20,
                spreadRadius: -10,
                offset: Offset(0, 10),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: delete,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: edit,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withValues(
                      alpha: 0.3,
                    ),
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          "$title \$$price",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
