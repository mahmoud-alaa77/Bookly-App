
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/models/book_model.dart';

class HomeRepoImplement implements HomeRepo{
  final ApiService apiServices;
HomeRepoImplement(this.apiServices);
  @override


  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
    try{

      var data=await apiServices.get(endPoint: "volumes?startIndex=5&maxResults=30&Filtering=free-ebooks&q=subject:Programming");

      List<BookModel> books=[];

      for(int i=0 ;i<data.length ;i++){
        BookModel model=BookModel.fromJson(data[i]);
        books.add(model);
      }
      return right(books);
    }catch(e){
      return left(ServerFailure("Please try again"));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks()async {

    try{
      var data=await apiServices.get(endPoint: "volumes?startIndex=10&maxResults=30&Filtering=free-ebooks&Sorting=newest&q=subject:Programming");
      List<BookModel> books=[];

      for(int i=0 ;i<data.length ;i++){
        BookModel model=BookModel.fromJson(data[i]);
        books.add(model);
      }
      return right(books);
    }catch(e){

      return left(ServerFailure("Please try again"));
    }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try{

      var data=await apiServices.get(endPoint: "volumes?startIndex=10&Filtering=free-ebooks&Sorting=relevance&q=subject:$category");
      List<BookModel> books=[];

      for(int i=0 ;i<data.length ;i++){
        BookModel model=BookModel.fromJson(data[i]);
        books.add(model);
      }
      return right(books);
    }catch(e){
      return left(ServerFailure("Please try again"));
    }

  }

}