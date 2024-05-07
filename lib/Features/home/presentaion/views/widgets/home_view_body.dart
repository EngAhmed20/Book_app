import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/utils/sized_box.dart';
import 'newest_books_item.dart';
import 'custom_app_bar.dart';
import 'cutom_book_img.dart';
import 'feature_books_list_view.dart';
import 'newest_books_list_view.dart';

class HomeViewBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
      SliverToBoxAdapter(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomAppBar(),
          ),
          //feature list view
          FeaturedBooksTap(),

          mySizedBoxHeight(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Text('New Arrivals',style: Styles.textStyle18,),
          ),
          mySizedBoxHeight(height: 20),
          ]
        ),
      ),
        SliverToBoxAdapter(
         child: NewestBooksListView(),

        ),


      ],

    );

  }

}



