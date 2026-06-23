import 'package:ecommerce/extensions/widget_padding.dart';
import 'package:ecommerce/services/product_service.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late ProductService _productService;
  final PageController _pageController = PageController(viewportFraction: 0.7);
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    super.initState();

    _productService = ProductService();

    _callLatestProducts();
  }

  void _callLatestProducts() async {
    final res = await _productService.getLatestProducts();
    List<Map<String, dynamic>> products = [];
    for (final product in res) {
      products.add(Map<String, dynamic>.from(product));
    }

    setState(() {
      _products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Latest Products', style: TextStyle(fontSize: 20.0)),
        SizedBox(
          // Fixed height for the carousel area
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _products.length,
            padEnds:
                false, // Ensures the first item aligns to the left edge of the screen
            physics:
                const BouncingScrollPhysics(), // Clean, native-feeling snap physics
            itemBuilder: (context, index) {
              final product = _products[index];
              return Padding(
                // Adds horizontal padding between cards so they don't touch
                padding: const EdgeInsets.only(right: 16.0, left: 4.0),
                child: ProductCard(
                  title: product['name'],
                  description: product['shortDes'],
                  imageUrl: product['imageUrl'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior:
          Clip.antiAlias, // Clips the image to fit the card's rounded corners
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper section: Image with floating Favorite Button
          Image.network(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            // Fallback placeholder while image loads
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 150,
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) => Container(
              height: 150,
              color: Colors.grey[300],
              child: const Icon(
                Icons.broken_image,
                size: 50,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ).padOnly(top: 12.0, left: 12.0),
          const SizedBox(height: 6),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.3,
            ),
          ).padOnly(left: 12.0),
        ],
      ),
    );
  }
}
