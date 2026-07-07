import 'package:ecommerce/models/cart_item_model.dart';
import 'package:ecommerce/providers/cart_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartContent extends StatefulWidget {
  const CartContent({super.key});

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  late CartStateNotifier _cartState;
  List<CartItemModel> _items = [];

  @override
  void initState() {
    super.initState();

    _cartState = Provider.of<CartStateNotifier>(context, listen: false);
    _initializeItems();
  }

  void _initializeItems() {
    setState(() {
      _items = _cartState.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap:
                true, // <--- Tells ListView to only take up the space of its 3 items
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  child: ListTile(
                    title: Text(
                      item.product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Displaying the base price in the subtitle
                    subtitle: Text(
                      '\$${item.product.price.toStringAsFixed(2)} each',
                    ),

                    // Trailing widget handles the inline price and counter controls
                    trailing: Row(
                      mainAxisSize: MainAxisSize
                          .min, // Prevents Row from taking infinite width
                      children: [
                        // Total calculated price for this item
                        Text(
                          '\$${item.getTotal().toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Quantity Control Block
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              // Decrease Button
                              IconButton(
                                icon: const Icon(Icons.remove, size: 18),
                                onPressed: () {
                                  setState(() {
                                    if (item.quantity > 1) {
                                      item.quantity--;
                                    }
                                  });
                                },
                              ),
                              // Current Quantity Text
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Increase Button
                              IconButton(
                                icon: const Icon(Icons.add, size: 18),
                                onPressed: () {
                                  setState(() {
                                    item.quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
