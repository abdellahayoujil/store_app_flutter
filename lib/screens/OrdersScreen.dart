import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/constants.dart';
import 'package:store/widgets/details/details_body.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  void _updateOrder(int index, int newQuantity) {
    setState(() {
      OrderManager().orders[index] = Order(
        product: OrderManager().orders[index].product,
        quantity: newQuantity,
        selectedColor: OrderManager().orders[index].selectedColor,
        totalPrice: OrderManager().orders[index].product.price * newQuantity,
      );
    });
  }

  void _removeOrder(int index) {
    setState(() {
      OrderManager().orders.removeAt(index);
    });
  }

  void _showEditDialog(Order order, int index) {
    TextEditingController controller = 
      TextEditingController(text: order.quantity.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('تعديل الكمية', style: GoogleFonts.getFont('Almarai')),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'الكمية الجديدة',
            labelStyle: GoogleFonts.getFont('Almarai'),
          ),
        ),
        actions: [
          TextButton(
            child: Text('إلغاء', style: GoogleFonts.getFont('Almarai')),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('حفظ', style: GoogleFonts.getFont('Almarai')),
            onPressed: () {
              final newQuantity = int.tryParse(controller.text) ?? 1;
              if (newQuantity > 0) {
                _updateOrder(index, newQuantity);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orders = OrderManager().orders;
    double total = orders.fold(0, (sum, order) => sum + order.totalPrice);

    return Scaffold(
      appBar: AppBar(
        title: Text('طلباتي', style: GoogleFonts.getFont('Almarai')),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Dismissible(
                  key: Key(order.product.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) => _removeOrder(index),
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('تأكيد الحذف', 
                               style: GoogleFonts.getFont('Almarai')),
                        content: Text('هل أنت متأكد من حذف هذا الطلب؟',
                               style: GoogleFonts.getFont('Almarai')),
                        actions: [
                          TextButton(
                            child: Text('إلغاء',
                                   style: GoogleFonts.getFont('Almarai')),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          TextButton(
                            child: Text('حذف',
                                   style: GoogleFonts.getFont('Almarai')),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag, 
                            color: order.selectedColor),
                    title: Text(order.product.title!,
                            style: GoogleFonts.getFont('Almarai')),
                    subtitle: Text(
                      'الكمية: ${order.quantity}',
                      style: GoogleFonts.getFont('Almarai'),
                    ),
                    trailing: Text(
                      '\$${order.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => _showEditDialog(order, index),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('المجموع الكلي:',
                    style: GoogleFonts.getFont('Almarai',
                        fontSize: 20, color: Colors.white)),
                Text('\$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}