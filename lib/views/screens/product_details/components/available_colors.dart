import 'package:e_commerce/core/shared/widgets/title_text.dart';
import 'package:e_commerce/data_layer/models/product_models/product_colors_model.dart';
import 'package:e_commerce/views/screens/product_details/components/available_colors_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvailableColors extends StatelessWidget {
  final List<ProductColorsModel> productColors;

  const AvailableColors({Key? key, required this.productColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: TitleText(
        text: "Available Colors",
        fontSize: 14.sp,
      ),
      children: [
        SizedBox(
          height: 8.h,

          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: productColors.length,
            itemBuilder: (context, index) {
              return AvailableColorsItem(
                color: productColors[index].colorName,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 2.w,
              );
            },
          ),
        )
      ],
    );
  }
}
