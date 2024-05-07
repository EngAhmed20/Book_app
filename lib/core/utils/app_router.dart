import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/manager/Search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/serch_view.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Features/home/presentaion/views/book_details_view.dart';
import '../../Features/home/presentaion/views/home_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
abstract class AppRouter{
  static const KHomeView='/homeView';
  static const KBooksDetailsView='/BooksDetailsView';
  static const KSearchView='/SearchView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return  SplashView();
        },


      ),
      GoRoute(
        path: KHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return  HomeView();
        },
      ),
      GoRoute(
        path: KBooksDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return  BlocProvider(
              create: (BuildContext context)=>SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
              child: BooksDetailsView(bookModel: state.extra as BookModel,));
        },
      ),
      GoRoute(
        path: KSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return  BlocProvider(create: (BuildContext context)=>SearchCubit(getIt.get<SearchRepoImpl>()),
              child: SearchView());
        },
      ),


    ],
  );
}
