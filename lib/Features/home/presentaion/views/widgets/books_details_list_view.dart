import 'package:bookly_app/Features/home/presentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_error_widget.dart';
import 'cutom_book_img.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (BuildContext context, state) {
      if(state is SimilarBooksSucess)
        {
          return SizedBox(
            height: MediaQuery.of(context).size.height*.15,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder:(context,index)=>GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.KBooksDetailsView,extra: state.books[index]);

                    },
                    child: CustomBookImg(imageUrl:state.books[index].volumeInfo!.imageLinks?.thumbnail??'',)) ),
          );
        }
      else if(state is SimilarBooksFailure)
        {
          return CustomErrorMsg(errMsg: state.errMsg,);

        }else{
        return Center(child: CircularProgressIndicator(),);
      }
    },
    );
  }
}
