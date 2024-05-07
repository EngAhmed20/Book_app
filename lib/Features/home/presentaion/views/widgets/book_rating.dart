import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/sized_box.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
   BookRating({super.key, this.mainAxisAlignment=  MainAxisAlignment.start, required this.rating, required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final num count;


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(FontAwesomeIcons.solidStar,color: Color(0xffffdd4f),size: 18,),
        mySizedBoxWidth(width: 7),
        Text(rating.toString(),style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),),
        mySizedBoxWidth(width: 6),
        Text('(${count})',style: Styles.textStyle16.copyWith(color: Color(0xff707070)),),

      ],
    );
  }
}
