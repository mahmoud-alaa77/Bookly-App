


class BookModel {

final String id;
final String title;
final String imageUrl;
final String author;
final int? averageRating;
final int? ratingsCount;
final String category;
final String previewLink;
BookModel(   {
  required this.title,
  required this.id,
  required this.imageUrl,
  required this.author,
  required this.averageRating,
  required this.ratingsCount,
  required this.category,
  required this.previewLink,
});


factory BookModel.fromJson(json){
  return BookModel(
      id: json["id"],
      title:json["volumeInfo"]["title"],
    imageUrl: json["volumeInfo"]["imageLinks"]["thumbnail"],
    author: json["volumeInfo"]["authors"][0],
    averageRating:  json["volumeInfo"]["averageRating"],
    ratingsCount: json["volumeInfo"]["ratingsCount"],
category: json["volumeInfo"]["categories"][0],
    previewLink: json["volumeInfo"]["previewLink"]
  );
}

}