
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../models/book_model.dart';

class HomeRepoImplement implements HomeRepo{
  final ApiService apiServices;
HomeRepoImplement(this.apiServices);
  @override


  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
    try{

      var data=await apiServices.get(endPoint: "volumes?Filtering=free-ebooks&q=subject:Programming");

      List<BookModel> books=[];

      for(int i=0 ;i<data.length ;i++){
        BookModel model=BookModel.fromJson(data[i]);
        books.add(model);
      }
      return right(books);
    }catch(e){
      return left(ServerFailure("Error!!"));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks()async {

    try{

      var data=await apiServices.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=newest &q=computer science");
      List<BookModel> books=[];

      for(int i=0 ;i<data.length ;i++){
        BookModel model=BookModel.fromJson(data[i]);
        books.add(model);
      }
      return right(books);
    }catch(e){
      return left(ServerFailure("Error!!"));
    }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try{

      var data=await apiServices.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming");
      List<BookModel> books=[];

      for(int i=0 ;i<data.length ;i++){
        BookModel model=BookModel.fromJson(data[i]);
        books.add(model);
      }
      return right(books);
    }catch(e){
      return left(ServerFailure("Error!!"));
    }

  }

}