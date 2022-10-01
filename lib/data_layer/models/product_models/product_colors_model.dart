import 'dart:io';

import 'package:equatable/equatable.dart';

class ProductColorsModel extends Equatable {
  final List<String>? colorImages;
  final List<File>? colorImagesFiles;
  final String colorName;
  final String? colorId;

  const ProductColorsModel({
    this.colorImages,
    required this.colorName,
    this.colorId,
    this.colorImagesFiles,
  });

  factory ProductColorsModel.fromJson(Map<String, dynamic> json) {
    return ProductColorsModel(
      colorImages: List.of(json['colorImages'])
          .map((colorImage) => colorImage.toString())
          .toList(),
      colorName: json['colorName'],
      colorId: json['_id'],
    );
  }


  @override
  List<Object?> get props =>
      [colorImages, colorImagesFiles, colorName, colorId,];
}
