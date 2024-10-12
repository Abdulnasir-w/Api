import 'package:api/Models/product_model.dart';
import 'package:api/Services/product_services.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  ProductServices productServices = ProductServices();

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await productServices.fetchProducts();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to Load Products';
    }

    _isLoading = false;
    notifyListeners();
  }
}
