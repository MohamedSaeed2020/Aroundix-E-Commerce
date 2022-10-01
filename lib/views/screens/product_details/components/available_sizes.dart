import 'package:e_commerce/core/shared/widgets/title_text.dart';
import 'package:e_commerce/views/screens/product_details/components/available_sizes_item.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AvailableSizes extends StatelessWidget {
  final List<String> productSizes;
  const AvailableSizes({Key? key, required this.productSizes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title:  TitleText(
        text: "Available Size",
        fontSize: 14.sp,
      ),
      children: [
        SizedBox(
          height: 8.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: productSizes.length,
            itemBuilder: (context, index) {
              return AvailableSizesItem(
                size: productSizes[index],
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
