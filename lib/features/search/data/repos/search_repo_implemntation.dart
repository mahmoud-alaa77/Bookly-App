

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/api_services.dart';

class SearchRepoImplement implements SearchRepo{

  final ApiService apiServices;

  SearchRepoImplement(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchResultBooks({required String searchText}) async {
    try{

      var data=await apiServices.get(endPoint:"volumes?q=intitle:$searchText");

      List<BookModel> books=[];

      for(int i=0 ;i<data.length ;i++){
        BookModel model=BookModel.fromJson(data[i]);
        books.add(model);
      }
      return right(books);
    }catch(e){
      return left(ServerFailure("!!!!!!!"));
    }
  }



}
