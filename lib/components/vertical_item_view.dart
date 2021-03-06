import 'package:disler_new/components/item_empty.dart';
import 'package:disler_new/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_view_vertical.dart';

class VerticalView extends StatefulWidget {
  final List<ProductModel> productModel;
  final int duration;
  VerticalView({this.productModel, this.duration});

  @override
  _VerticalViewState createState() => _VerticalViewState();
}

class _VerticalViewState extends State<VerticalView> {
  bool loading = true;
  @override
  void initState() {
    Future.delayed(Duration(seconds: widget.duration), () {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: widget.productModel.length /
            2 *
            (MediaQuery.of(context).size.height / 3 + 20),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (2 / 2.75),
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: loading
              ? List.generate(10, (index) {
                  return ItemEmpty();
                })
              : List.generate(widget.productModel.length, (index) {
                  return ItemViewVertical(
                    productModel: widget.productModel[index],
                    showQuantity: true,
                  );
                }),
        ),
      ),
    );
  }
}
