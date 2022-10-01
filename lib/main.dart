import 'package:e_commerce/core/helpers/ui_helpers.dart';
import 'package:e_commerce/core/network/local/cache_helper.dart';
import 'package:e_commerce/core/network/remote/dio_helper.dart';
import 'package:e_commerce/core/shared/widgets/app_material_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  UiHelpers.makeAppInPortraitModeOnly();
  runApp(const ApplicationMainWidget());
}
