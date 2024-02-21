import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implmentation.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_implemntation.dart';
import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_book_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/home_view';
  static const kBookDetailsView = '/book_details_view';
  static const kSearchView = '/search_view';

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(

              create: (BuildContext context) {
                return SearchBookCubit(SearchRepoImplement(ApiService(Dio())));
              },
              child: const SearchView());
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (context) =>
                  SimilarBooksCubit(HomeRepoImplement(ApiService(Dio()))),
              child:  BookDetailsView(bookModel: state.extra as BookModel,));
        },
      ),
    ],
  );
}
