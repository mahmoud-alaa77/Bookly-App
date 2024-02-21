import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'featured_list_book_item.dart';

class HorizontalBooksListView extends StatefulWidget {
  const HorizontalBooksListView({super.key});

  @override
  State<HorizontalBooksListView> createState() => _HorizontalBooksListViewState();
}

class _HorizontalBooksListViewState extends State<HorizontalBooksListView> {
  @override
  void initState() {
BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccess){
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .25,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: FeaturedListBookItem(
                    image: state.books[index].imageUrl,
                    bookModel:state.books[index],
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kBookDetailsView , extra: state.books[index]);
                    },
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
            ),
          );
        }else if(state is FeaturedBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else{
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
