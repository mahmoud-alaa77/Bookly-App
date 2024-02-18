
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_books_list_view_item.dart';

class NewestListView extends StatefulWidget {
  const NewestListView({super.key});

  @override
  State<NewestListView> createState() => _NewestListViewState();
}

class _NewestListViewState extends State<NewestListView> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<NewBooksCubit>(context).fetchNewestBooks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBooksCubit,NewBookState>(
      builder: (context, state) {
        if(state is NewestBooksSuccess){
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                 bookModel:  state.books[index],
                ),
              );
            },
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          );
        }else if(state is NewestBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else{
          return const CustomLoadingWidget();
        }
      },
    );
  }
}