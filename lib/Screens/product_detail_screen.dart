import 'package:api/Models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.thumbnail),
              SizedBox(height: 16),
              Text(
                product.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "\$${product.price}  (${product.discountPercentage}% OFF)",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              SizedBox(height: 8),
              Text(
                product.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Stock: ${product.stock}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Text(
                "Brand: ${product.brand}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Text(
                "Reviews:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: product.reviews.length,
                itemBuilder: (context, index) {
                  final review = product.reviews[index];
                  return ListTile(
                    title: Text(review.reviewerName),
                    subtitle: Text(review.comment),
                    trailing: Text("${review.rating}/5"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
