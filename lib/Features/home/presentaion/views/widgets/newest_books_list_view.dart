import 'package:bookly_app/Features/home/presentaion/manager/newest_book_cubit/newest_books_cubit.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'newest_books_item.dart';
class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(builder:(context,state){
      if(state is NewestBooksSucess)
        {
          return ListView.builder(itemCount: state.books.length,padding: EdgeInsets.zero,shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 24),
                  child: BookListViewItem(bookModel: state.books[index],),
                );
              }
          );
        }else if(state is NewestBooksFailure)
          {
            CustomErrorMsg(errMsg: state.message,);
          }
        return Center(child: CircularProgressIndicator(),);

    });

  }

}
