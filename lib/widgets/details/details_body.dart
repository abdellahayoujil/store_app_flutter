import 'package:flutter/material.dart';
import 'package:store/constants.dart';
import 'package:store/models/product.dart';
import 'package:store/widgets/details/color_dot.dart';
import 'package:store/widgets/details/product_image.dart';

class DetailsBody extends StatefulWidget {
  final Product? product;

  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  Color selectedColor = kTextLightColor; 

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
                        onTap: () {
                          setState(() {
                            selectedColor = kTextLightColor;
                          });
                        },
                        child: ColorDot(
                          fillColor: kTextLightColor,
                          isSelected: selectedColor == kTextLightColor, // Highlight selected color
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.blue;
                          });
                        },
                        child: ColorDot(
                          fillColor: Colors.blue,
                          isSelected: selectedColor == Colors.blue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = Colors.red;
                          });
                        },
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
