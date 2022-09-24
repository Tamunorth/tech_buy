import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:tech_buy/common/keys.dart';
import 'package:tech_buy/data/network/app_config.dart';
import 'package:tech_buy/data/network/network_service.dart';
import 'package:tech_buy/features/admin/models/add_product/add_product_res.dart';

import '../../../utils/di.dart';
import '../models/add_product/add_product_req.dart';
import '../models/get_products_res.dart';

class AdminService {
  final networkService = sl<NetworkService>();
  Future<AddProductRes> uploadProduct(AdminProductReq product) async {
    try {
      logger.i("Uploading files to cloudinary");
      final cloudinary =
          CloudinaryPublic(CLOUNDINARY_CLOUD_NAME, CLOUNDINARY_UPLOAD_PRESET);

      List<String> imageUrls = [];

      for (File image in product.imageFiles!) {
        CloudinaryResponse res = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(image.path, folder: product.name));

        imageUrls.add(res.secureUrl);
      }

      logger.i(imageUrls);

      final result = await networkService.call(
          AppConfig.addProduct, RequestMethod.post,
          data: product.copyWith(images: imageUrls).toJson());

      return AddProductRes.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetProductsRes> getAllProducts() async {
    try {
      final result = await networkService.call(
        AppConfig.getProducts,
        RequestMethod.get,
      );

      return GetProductsRes.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteProduct(String productId) async {
    try {
      final result = await networkService.call(
        AppConfig.deleteProduct,
        RequestMethod.post,
        data: jsonEncode(
          {"id": productId},
        ),
      );

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
