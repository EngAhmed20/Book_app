import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly_app/Features/search/presentation/manager/Search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_books_list_view.dart';
import 'package:bookly_app/core/utils/sized_box.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentaion/views/widgets/newest_books_item.dart';
import '../../../../home/presentaion/views/widgets/newest_books_list_view.dart';
import 'custom_search_text_filed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder: (context,state){
        var cubit =BlocProvider.of<SearchCubit>(context);
        return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSearchTextField(),
                    mySizedBoxHeight(height: 20),
                    Text('Search Result',style: Styles.textStyle18,),
                    if(state is SearchSucess)
                      Text('${state.books.length}',style: Styles.textStyle14,),

                    mySizedBoxHeight(height: 30),
                    Expanded(child: SearchBooksListView()),



                  ],
                ),
              );

      },

    );
  }
}

