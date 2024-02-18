import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implmentation.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_router.dart';
import 'core/utils/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturedBooksCubit(HomeRepoImplement(ApiService(Dio(),),),),),
        BlocProvider(create: (context) => NewBooksCubit(HomeRepoImplement(ApiService(Dio(),),),),),

      ],
      child: MaterialApp.router(
        routerConfig:AppRouter.router ,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          brightness: Brightness.dark,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),

      ),
    );
  }
}
