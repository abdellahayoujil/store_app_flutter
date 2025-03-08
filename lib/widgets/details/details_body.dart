import 'package:flutter/material.dart';
import 'package:store/constants.dart';
import 'package:store/models/product.dart';
import 'package:store/widgets/details/color_dot.dart';
import 'package:store/widgets/details/product_image.dart';

class Order {
  final Product product;
  final int quantity;
  final Color selectedColor;
  final double totalPrice;

  Order({
    required this.product,
    required this.quantity,
    required this.selectedColor,
    required this.totalPrice,
  });
}

class OrderManager {
  static final OrderManager _instance = OrderManager._internal();
  factory OrderManager() => _instance;
  OrderManager._internal();

  List<Order> orders = [];
}

class DetailsBody extends StatefulWidget {
  final Product? product;

   DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  int quantity = 1;
  Color selectedColor = kTextLightColor;

  void _addToOrders() {
    final newOrder = Order(
      product: widget.product!,
      quantity: quantity,
      selectedColor: selectedColor,
      totalPrice: widget.product!.price * quantity,
    );
    
    OrderManager().orders.add(newOrder);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تمت إضافة ${quantity} عنصر إلى الطلبات'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
            decoration: const BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProductImage(
                    size: size,
                    image: widget.product!.image!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => selectedColor = kTextLightColor),
                        child: ColorDot(
                          fillColor: kTextLightColor,
                          isSelected: selectedColor == kTextLightColor, 
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => selectedColor = Colors.blue),
                        child: ColorDot(
                          fillColor: Colors.blue,
                          isSelected: selectedColor == Colors.blue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => selectedColor = Colors.red),
                        child: ColorDot(
                          fillColor: Colors.red,
                          isSelected: selectedColor == Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: Text(
                    widget.product!.title!,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Text(
                  'السعر: \$${widget.product!.price}',
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('الكمية:', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => setState(() => quantity > 1 ? quantity-- : null),
                    ),
                    Text('$quantity', style: const TextStyle(fontSize: 24)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => setState(() => quantity++),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding),
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.add_shopping_cart , color: kBackgroundColor,),
                    label: Text(
                      'إضافة إلى الطلبات (\$${(widget.product!.price * quantity).toStringAsFixed(2)})',
                      style: const TextStyle(fontSize: 18, color: kBackgroundColor , fontWeight: FontWeight.bold ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: _addToOrders,
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5,
              vertical: kDefaultPadding / 2,
            ),
            child: Text(
              widget.product!.description!,
              style: const TextStyle(color: Colors.white, fontSize: 19.0),
            ),
          ),
        ],
      ),
    );
  }
}