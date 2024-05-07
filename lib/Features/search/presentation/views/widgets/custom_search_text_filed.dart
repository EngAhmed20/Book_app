import 'package:bookly_app/Features/search/presentation/manager/Search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomSearchTextField extends StatelessWidget {
   CustomSearchTextField({super.key});
  TextEditingController text=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(builder:(context,state){
      var cubit =BlocProvider.of<SearchCubit>(context);
      return TextField(
        controller: cubit.searchController,
        onChanged: (val){
          if(cubit.searchController.text.isNotEmpty)
            {
              cubit.featchSearchBooks(title: val);
            }
        },
        decoration: InputDecoration(
            enabledBorder: cubit.buildOutlineInputBorder(),
            focusedBorder: cubit.buildOutlineInputBorder(),

            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: (){
                cubit.featchSearchBooks(title: text.text);
              },
              icon: Opacity(opacity: 0.5,
                  child: Icon(FontAwesomeIcons.magnifyingGlass,size: 18,)),
            )
        ),
      );
    }
    );
  }
}
