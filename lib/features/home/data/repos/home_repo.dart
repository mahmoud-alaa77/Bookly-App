
import 'package:bookly_app/features/home/data/models/BookModel.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo{

 Future<Either<Failure,List<BookModel>>> fetchNewsetBooks();
 Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();

}