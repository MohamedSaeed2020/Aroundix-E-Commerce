import 'package:e_commerce/core/network/local/cache_helper.dart';
import 'package:e_commerce/core/network/local/storage_keys.dart';
import 'package:e_commerce/core/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:e_commerce/controllers/bindings.dart';
import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/core/constants.dart';

class ApplicationMainWidget extends StatelessWidget {
  const ApplicationMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
        theme: ThemeData(
          fontFamily: fontFamily,
          primarySwatch: Palette.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          dividerColor: Colors.transparent,
        ),
        initialBinding: Binding(),
        initialRoute: CacheHelper.getData(key: StorageKeys.accessToken) != null
            ? AppRoutes.homeScreen
            : AppRoutes.initialRoute,
        getPages: AppRoutes.routes,
      );
    });
  }
}
