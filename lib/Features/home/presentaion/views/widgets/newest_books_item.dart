import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/cutom_book_img.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/constants.dart';
import '../../../../../core/utils/sized_box.dart';
import '../../../../../core/utils/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.KBooksDetailsView,extra: bookModel);
      },
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            CustomBookImg(imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail??'https://books.google.com/books/content?id=yQ9LAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'),
            mySizedBoxWidth(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child:  Text(bookModel.volumeInfo!.title!
                      ,style: Styles.textStyle20.copyWith(fontFamily:appConst.KGTSectraFine)
                      ,maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                  mySizedBoxWidth(width: 3),
                  Text(bookModel.volumeInfo!.authors!.join(',')??''
                    ,style: Styles.textStyle14,maxLines: 3,overflow: TextOverflow.ellipsis,),
                 mySizedBoxWidth(width: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Free'
                        ,style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),),
                      BookRating(rating:bookModel.volumeInfo!.ratingsCount??0 ,count:
                      bookModel.volumeInfo!.averageRating??0
                      ),

                    ],
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
