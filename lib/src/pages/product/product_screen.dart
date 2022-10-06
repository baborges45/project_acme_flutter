import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
    this.name,
    this.image,
    this.description,
  );
  //class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_single_quotes
        title: Text("Detalhes Produto"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(image),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    description,
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
