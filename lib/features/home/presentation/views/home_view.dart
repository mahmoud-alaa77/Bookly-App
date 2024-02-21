import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: CustomRefreshIndicator(

            onRefresh:  () {
              BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
              BlocProvider.of<NewBooksCubit>(context).fetchNewestBooks();
              return Future.delayed(const Duration(seconds: 3));
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
            child: const HomeViewBody()),
      ),
    );
  }
}
