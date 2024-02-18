
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
       builder: (context, state) {
         if(state is SimilarBooksSuccess){
           return SizedBox(
             height: MediaQuery.of(context).size.height/4.6,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: state.books.length,
               physics: const BouncingScrollPhysics(),
               itemBuilder: (context, index) {
                 return  Padding(
                   padding: const EdgeInsetsDirectional.only(top: 16,bottom: 42,end: 16),
                   child: SizedBox(
                       width: MediaQuery.of(context).size.width/4.5,
                       child:   CustomBookItem(
                         image: state.books[index].imageUrl,
                         bookModel: state.books[index],
                         onTap: (){
                           GoRouter.of(context).push(AppRouter.kBookDetailsView , extra: state.books[index]);
                         },
                       )),
                 );
               },
             ),
           );
         }else if(state is SimilarBooksFailure){
           return CustomErrorWidget(errorMessage: state.errorMessage);
         }else{
           return const CustomLoadingWidget();
         }
       },
    );
  }
}
