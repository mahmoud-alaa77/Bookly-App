import 'package:bookly_app/core/utils/styles.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/featured_books_cubit/featured_books_cubit.dart';
import '../../manger/newest_books_cubit/newset_books_cubit.dart';
import 'new_books_list_view.dart';
import 'custom_app_bar.dart';
import 'horizontal_books_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(

        onRefresh:  () {
          BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
          BlocProvider.of<NewBooksCubit>(context).fetchNewestBooks();
          return Future.delayed(const Duration(seconds: 2));
        },
        builder: (BuildContext context, Widget child, IndicatorController controller) {

          return Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              if (!controller.isIdle)
                Positioned(
                  top: 35.0 * controller.value,
                  child: const SizedBox(
                    height: 30,
                    width: 30,

                  ),
                ),
              Transform.translate(
                offset: Offset(0, 100.0 * controller.value),
                child: child,
              ),
            ],
          );

        },
        child: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 30,vertical: 16),
                    child: CustomAppBar(),
                  ),
                  HorizontalBooksListView(),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Most Popular",
                      style: Styles.textStyle18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
                child: NewestListView(),
              ),
            ),
          ],






        ));
  }
}
