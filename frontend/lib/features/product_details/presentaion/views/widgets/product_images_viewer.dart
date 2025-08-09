import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/components/data/models/product/product_model.dart';

class ProductImagesViewer extends StatelessWidget {
  const ProductImagesViewer({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    CarouselOptions options = CarouselOptions(
      height: 400,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
    );
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(5),
      child: CarouselSlider(
        items: List.generate(productModel.images.length, (index) {
          // String tag = (productModel.images[index] == productModel.poster)
          //     ? "${productModel.id}_main"
          //     : "${productModel.id}_img_$index";

          return Image.asset(
            productModel.images[index],
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          );
        }),
        options: options,
      ),
    );
  }
}
