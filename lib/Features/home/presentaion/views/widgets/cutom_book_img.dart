import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CustomBookImg extends StatelessWidget {
  const CustomBookImg({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 2.6/4,
          child: CachedNetworkImage(imageUrl: imageUrl,fit:   BoxFit.cover,
          errorWidget: (context,url,error)=>const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
