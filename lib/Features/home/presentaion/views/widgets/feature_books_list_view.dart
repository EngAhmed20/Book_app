import 'package:bookly_app/Features/home/presentaion/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Feature_list_view.dart';


class FeaturedBooksTap extends StatelessWidget {
  const FeaturedBooksTap({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Column(
          children: [

            TabBar(
                labelColor: Theme.of(context).tabBarTheme.labelColor,
                unselectedLabelColor:
                Theme.of(context).tabBarTheme.unselectedLabelColor,
                indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                onTap: (value) {
                  switch (value) {
                    case 0:
                      BlocProvider.of<FeaturedBooksCubit>(context)
                          .fetchFuturedBooks(type: 'novels');
                    case 1:
                      BlocProvider.of<FeaturedBooksCubit>(context)
                          .fetchFuturedBooks(type: 'computer_science');
                    case 2:
                      BlocProvider.of<FeaturedBooksCubit>(context)
                          .fetchFuturedBooks(type: 'science');
                    case 3:
                      BlocProvider.of<FeaturedBooksCubit>(context)
                          .fetchFuturedBooks(type: 'romance');
                    case 4:
                      BlocProvider.of<FeaturedBooksCubit>(context)
                          .fetchFuturedBooks(type: 'crime');
                  }
                },
                tabs: const [
                  Tab(
                    child: Text('Novel'),
                  ),
                  Tab(
                    child: Text('computer science'),
                  ),
                  Tab(
                    child: Text('Science'),
                  ),
                  Tab(
                    child: Text('Romantic'),
                  ),
                  Tab(
                    child: Text('Crime'),
                  ),
                ]),
            FeaturedBooksList(),




          ],
        ),
      );

  }
}

