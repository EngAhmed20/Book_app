import 'package:bookly_app/Features/home/presentaion/views/widgets/books_details_list_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/sized_box.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/utils/functions/lunch_url.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../data/models/book_model/Book_model.dart';
import 'appbar_book_details.dart';
import 'book_rating.dart';
import 'cutom_book_img.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;

  const BookDetailsViewBody({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                CustomAppBarBookDetails(),
                mySizedBoxHeight(height: 10),
                SizedBox(height: height * 0.30, child: CustomBookImg(imageUrl:bookModel.volumeInfo!.imageLinks?.thumbnail??'')),
                mySizedBoxHeight(height: 43),
                Text(bookModel.volumeInfo!.title!, style: Styles.textStyle30,textAlign: TextAlign.center,),
                mySizedBoxHeight(height: 6),
                 Opacity(opacity: .7,
                    child: Text(bookModel.volumeInfo!.authors?.join(',')??'', style: Styles.textStyle18,)),
                mySizedBoxHeight(height: 18),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Description :',style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: appConst.KGTSectraFine,
                  ),),
                ),
                mySizedBoxHeight(height: 10),
                Card(child: Text(bookModel.volumeInfo!.description??''),elevation: 0,),
                BookRating(mainAxisAlignment: MainAxisAlignment.center,rating:bookModel.volumeInfo!.averageRating??0
                  ,count: bookModel.volumeInfo!.ratingsCount??0,),
                mySizedBoxHeight(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(child: CustomButton(
                        text: 'Download ',
                        textColor: Colors.black,
                        onPressed: () async {
                          if(bookModel.accessInfo!.pdf!.acsTokenLink!=null)
                            {
                              lunchCustomUrl(context,bookModel.accessInfo!.pdf!.acsTokenLink!.replaceFirst('http', 'https'));

                            }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('cant launch url')));
                          }

                        },
                        backgroundColor: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),)),
                      Expanded(child: CustomButton(text: 'Free Preview',
                        textColor: Colors.white,
                        onPressed: () async {
                          lunchCustomUrl(context,bookModel.volumeInfo!.previewLink!);

                        },
                        backgroundColor: Color(0xffef8262),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),)),
                    ],
                  ),
                ),
                Expanded(child: mySizedBoxHeight(height: 35)),
                Align(alignment: Alignment.centerLeft,
                    child: Text('You can also Like',
                      style: Styles.textStyle14.copyWith(
                          fontWeight: FontWeight.w700),)),
                mySizedBoxHeight(height: 10),
                SimilarBooksListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


