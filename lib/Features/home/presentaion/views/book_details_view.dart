
import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly_app/Features/home/presentaion/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/books_details_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDetailsView extends StatefulWidget {
  const BooksDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BooksDetailsView> createState() => _BooksDetailsViewState();
}

class _BooksDetailsViewState extends State<BooksDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).getSimilarBooks(category:widget.bookModel.volumeInfo!.categories![0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsViewBody(bookModel:widget.bookModel,)),
    );
  }
}
