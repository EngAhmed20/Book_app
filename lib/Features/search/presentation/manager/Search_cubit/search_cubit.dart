import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/book_model/Book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());
  final SearchRepo _searchRepo;
  TextEditingController searchController = TextEditingController();
  Future<void>featchSearchBooks({required String title})async{
    emit(SearchLoading());
    var result=await _searchRepo.featchSearchBooks(title: title);
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (books){
      emit(SearchSucess(books));
    });

  }
  OutlineInputBorder buildOutlineInputBorder(){
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
