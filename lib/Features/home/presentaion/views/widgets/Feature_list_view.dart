import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:bookly_app/Features/home/presentaion/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_router.dart';
import 'cutom_book_img.dart';
import 'package:go_router/go_router.dart';
class FeaturedBooksList extends StatelessWidget {
  const FeaturedBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
        builder: (context,state){
          if(state is FeaturedBooksSuccess)
            {
              return SizedBox(
                height: MediaQuery.of(context).size.height *.3,
                child: ListView.builder(scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: state.books.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return GestureDetector(
                          onTap: (){
                            GoRouter.of(context).push(AppRouter.KBooksDetailsView,extra: state.books[index]);
                          },
                          child: CustomBookImg(imageUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail!));
                    }
                ),
              );

            }
          else if(state is FeaturedBooksFailure)
            {
              return CustomErrorMsg(errMsg: state.message);
            }
          else{
            return Center(child: CircularProgressIndicator());

          }
        }

    );
  }
}
