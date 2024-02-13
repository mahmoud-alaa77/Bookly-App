
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/BookModel.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplement implements HomeRepo{
  final ApiService apiServices;
HomeRepoImplement(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks()async {

try{

  var data=await apiServices.get(endPoint: "volumes?Filtering=free-ebooks&q=programming&Sorting=newest");
  List<BookModel> books=[];

  for(int i=0 ;i<=data.length ;i++){
    BookModel model= data["items"]?[i] as BookModel;
    books.add(model);
  }
  return right(books);
}catch(e){
  return left(ServerFailure(e.toString()));
}
  
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
    try{

      var data=await apiServices.get(endPoint: "volumes?Filtering=free-ebooks&q=programming");
      List<BookModel> books=[];

      for(int i=0 ;i<=data.length ;i++){
        BookModel model= data["items"]?[i] as BookModel;
        books.add(model);
      }
      return right(books);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

}