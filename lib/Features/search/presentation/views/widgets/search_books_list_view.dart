import 'package:bookly_app/Features/home/presentaion/manager/newest_book_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/manager/Search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_item.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../home/presentaion/views/widgets/newest_books_item.dart';
class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(builder:(context,state){
      if(state is SearchSucess)
        {
          return ListView.builder(itemCount: state.books.length,padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 24),
                  child: SearchItem(bookModel: state.books[index],),
                );
              }
          );
        }else if(state is SearchFailure)
          {
            return CustomErrorMsg(errMsg: state.ErrMsg,);
          }
      else if(state is SearchLoading)
        {
          return Center(child: CircularProgressIndicator(),);
        }
        return Container();

    });

  }

}
