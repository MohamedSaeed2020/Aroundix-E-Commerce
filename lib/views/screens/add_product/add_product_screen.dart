import 'package:e_commerce/controllers/product_adding_controller.dart';
import 'package:e_commerce/core/shared/widgets/custom_button.dart';
import 'package:e_commerce/core/shared/widgets/custom_labeled_form_field.dart';
import 'package:e_commerce/core/shared/widgets/traditional_app_bar.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/views/screens/add_product/components/colors_card.dart';
import 'package:e_commerce/views/screens/add_product/components/product_models/models_card.dart';
import 'package:e_commerce/views/screens/add_product/components/sizes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController productNameEditingController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();
  final _controller=ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: TraditionalAppBar(
          title: 'Add New Product',
        ),
      ),
      body: SingleChildScrollView(
        controller:_controller ,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: CustomLabeledFormField(
                  textInputType: TextInputType.name,
                  controller: productNameEditingController,
                  labelText: 'Product Name',
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Product Name';
                    }
                    return null;
                  },
                ),
              ),
              const SizesCard(),
              const ColorsCard(),
              GetBuilder<ProductAddingController>(builder: (controller) {
                return controller.productSizes.length *
                            controller.productColorsModel.length >
                        0
                    ? const ProductModelsCard()
                    : const SizedBox.shrink();
              }),
              GetBuilder<ProductAddingController>(builder: (controller) {
                return controller.isLoadingData
                    ? const Center(
                  child: SpinKitFadingCircle(
                    color: AppColors.primaryColor,
                    size: 50.0,
                  ),
                )
                    : Visibility(
                        visible: controller.modelAttributes.isNotEmpty,
                        child: CustomButton(
                          pressed: () async {
                            if (formKey.currentState!.validate()) {
                              controller.addProduct(
                                  productName:
                                      productNameEditingController.text);
                              productNameEditingController.clear();

                            }else{
                              _controller.jumpTo(0);
                            }
                          },
                          text: 'Add The Product',
                          backgroundColor: AppColors.lightGreen,
                          buttonColor: AppColors.whiteColor,
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    productNameEditingController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
