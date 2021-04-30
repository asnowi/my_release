import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_release/common/utils/utils.dart';

class ImageLoader {
  static Widget load({required String url}){
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Image.asset(AssetsProvider.imagePath('img_error')),
    );
  }
}