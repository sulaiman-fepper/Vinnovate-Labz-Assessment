import 'package:flutter/material.dart';
import '../data/network/NetworkApiService.dart';
import '../data/response/api_response.dart';
import '../model/products.dart';
import '../res/app_url.dart';

class CoursesViewModel with ChangeNotifier {
  // Initialize variables and setup
  CoursesViewModel() {
    fetchData(); // Fetch initial data
    _scrollController.addListener(_scrollListener); // Add scroll listener
    isStart = true; // Set initial loading state
  }

  List<Product> _data = []; // List of products
  int currentPage = 1; // Current page for pagination
  final ScrollController _scrollController = ScrollController(); // Scroll controller
  bool isLoading = false; // Loading state
  bool isStart = false; // Initial loading state
  TextEditingController searchParams = TextEditingController(); // Email controller

  // Getters
  ScrollController get scrollController => _scrollController; // Scroll controller
  List<Product> get data => _data; // List of products

  // Listener for scroll events
  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list
      currentPage++; // Increment page for pagination
      fetchData(); // Fetch more data
    }
  }

  // Fetch data from the network
  fetchData() async {
    try {
      isLoading = true; // Set loading state
      notifyListeners(); // Notify listeners about the loading state change

      // Simulating asynchronous data fetching
      await Future.delayed(Duration(seconds: 2));

      // Fetch data from the network
      List<dynamic> rawData = await NetworkApiService().getGetApiResponse("${AppUrl.productUrl}?limit=${currentPage * 8}");

      // Convert raw data to a list of Product objects
      List<Product> products = rawData.map((data) => Product.fromJson(data)).toList();

      // if (currentPage == 1) {
        // Reset data if it's the first page
        _data = products;
      // } else {
      //   // Append data for pagination
      //   _data.addAll(products);
      // }

      isLoading = false; // Reset loading state
      isStart = false; // Reset initial loading state
      notifyListeners(); // Notify listeners about the data update
    } catch (e) {
      // Handle any errors that occur during data fetching
      print('Error fetching data: $e');
      rethrow; // Rethrow the error for further handling
    }
  }
}
