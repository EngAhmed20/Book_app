import 'package:bookly_app/Features/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
final getIt= GetIt.instance;
void setUpServiceLocator(){
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(ApiService(Dio(),),),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(ApiService(Dio(),),),
  );
}