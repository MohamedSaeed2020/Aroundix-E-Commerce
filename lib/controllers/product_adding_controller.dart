import 'dart:developer';
import 'dart:io';
import 'package:e_commerce/controllers/user_info_controller.dart';
import 'package:e_commerce/core/helpers/ui_helpers.dart';
import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/core/shared/widgets/custom_alert_dialog.dart';
import 'package:e_commerce/core/shared/widgets/custom_button.dart';
import 'package:e_commerce/core/shared/widgets/custom_labeled_form_field.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/data_layer/models/product_models/product_colors_model.dart';
import 'package:e_commerce/data_layer/models/product_models/product_variants_attributes_model.dart';
import 'package:e_commerce/data_layer/repositories/product_adding_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';

class ProductAddingController extends GetxController {
  ProductAddingController(this.productAddingRepository);

  var sizesFormKey = GlobalKey<FormState>();
  var colorsFormKey = GlobalKey<FormState>();
  bool isLoadingData = false;
  final ProductAddingRepository productAddingRepository;
  final UserInfoController userInfoController = Get.find<UserInfoController>();
  List<String> productSizes = [];
  final TextEditingController productSizeEditingController =
      TextEditingController();
  List<ProductColorsModel> productColorsModel = [];
  List<VariantsAttributes> modelAttributes = [];
  List<File> productColorsImages = [];
  var picker = ImagePicker();
  final TextEditingController productColorEditingController =
      TextEditingController();
  String selectedSize = '';
  ProductColorsModel? selectedProductColorModel;

  ///Methods

  void changeModelSize(String size) {
    selectedSize = size;
    update();
  }

  void changeModelColor(ProductColorsModel colorModel) {
    selectedProductColorModel = colorModel;
    update();
  }

  void addToProductSizesList(String product) {
    productSizes.add(product);
    update();
  }

  void removeProductFromSizesList() {
    if (productSizes.isNotEmpty) {
      productSizes.removeLast();
    }
    update();
  }

  void showAddingProductSizesDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return CustomAlertDialog(
          widget: Form(
            key: sizesFormKey,
            child: CustomLabeledFormField(
              textInputType: TextInputType.number,
              controller: productSizeEditingController,
              labelText: 'Product Size',
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Please Enter Product Size';
                }
                return null;
              },
            ),
          ),
          title: 'Add Product Size',
          pressed: () {
            if (sizesFormKey.currentState!.validate()) {
              bool isAddedBefore = false;
              for (var element in productSizes) {
                isAddedBefore = element == productSizeEditingController.text;
              }
              if (isAddedBefore) {
                UiHelpers.showSnackBar(
                    'You Added This Size Before, Choose Another Size', 'error');
              } else {
                addToProductSizesList(
                  productSizeEditingController.text,
                );
                productSizeEditingController.clear();
                Get.back();
              }
            }
          },
        );
      },
    );
  }

  void addToProductColorsNamesList(ProductColorsModel model) {
    productColorsModel.add(model);
    update();
  }

  void removeProductFromColorsNamesList() {
    if (productColorsModel.isNotEmpty) {
      productColorsModel.removeLast();
    }
    update();
  }

  Future<void> chooseImage() async {
    productColorsImages.clear();
    try {
      final pickedFiles = await picker.pickMultiImage(
        imageQuality: 50,
      );
      if (pickedFiles != null) {
        for (var pickedFile in pickedFiles) {
          productColorsImages.add(File(pickedFile.path));
        }
        //log('Picking Image Successfully');
      } else {
        log('Error In Picking The Image');
      }
    } catch (error) {
      log('Exception In Picking The Image: $error');
    }
  }

  void showAddingProductImagesColorsDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return imagesColorsDialogBuilder(
            buildContext, animation, secondaryAnimation);
      },
    );
  }

  Widget imagesColorsDialogBuilder(BuildContext buildContext,
      Animation animation, Animation secondaryAnimation) {
    return CustomAlertDialog(
      widget: Column(
        children: [
          Form(
            key: colorsFormKey,
            child: CustomLabeledFormField(
              textInputType: TextInputType.name,
              controller: productColorEditingController,
              labelText: 'Product Color',
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Please Enter Product Color';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          CustomButton(
            pressed: () async {
              await chooseImage();
            },
            text: 'Choose From Gallery',
            backgroundColor: AppColors.primaryColor,
            buttonColor: AppColors.whiteColor,
          ),
        ],
      ),
      title: 'Add Product Color',
      pressed: () {
        addingProductImages();
      },
    );
  }

  void addingProductImages() {
    //log('path: ${ List.of(productAddingController.productColorsImages).hashCode}');
    if (colorsFormKey.currentState!.validate()) {
      bool isAddedBefore = false;
      for (var element in productColorsModel) {
        isAddedBefore = element.colorName.toUpperCase() ==
            productColorEditingController.text.toUpperCase();
      }
      if (isAddedBefore) {
        UiHelpers.showSnackBar(
            'You Added This Color Before, Choose Another Color', 'error');
      } else {
        if (productColorsImages.isEmpty) {
          UiHelpers.showSnackBar(
              'You Should Choose At Least One Image', 'error');
        } else {
          addToProductColorsNamesList(
            ProductColorsModel(
              colorImagesFiles: List.of(
                productColorsImages,
              ),
              colorName: productColorEditingController.text,
            ),
          );
          productColorEditingController.clear();
          productColorsImages.clear();
          Get.back();
        }
      }
    }
  }

  Future<void> addProduct({required String productName}) async {
    isLoadingData = true;
    update();
    productAddingRepository
        .addProduct(
      productName: productName,
      productColorsModel: productColorsModel,
      productSizes: productSizes,
      productVariantsAttributes: modelAttributes,
    )
        .then((value) {
      isLoadingData = false;
      update();
      UiHelpers.showSnackBar(
        'Product added successfully',
        'success',
      );

      //to update the products
      userInfoController.getUserInfo();
      Get.toNamed(AppRoutes.homeScreen);
    }).catchError((error) {
      isLoadingData = false;
      modelAttributes.clear();
      update();
      log('Error In Adding Product: ${error.toString()}');
      UiHelpers.showSnackBar(
        'An Error Occurred While Adding The Product',
        'error',
      );
    });
  }

  void addModels(VariantsAttributes attributes) {
    modelAttributes.add(attributes);
    update();
  }

  @override
  void onClose() {
    productSizeEditingController.dispose();
    productColorEditingController.dispose();
    super.onClose();
  }
}