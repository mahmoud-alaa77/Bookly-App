import 'package:bookly_app/features/home/data/models/list_price.dart';
import 'package:bookly_app/features/home/data/models/retail_price.dart';

class Offers {

  final int finskyOfferType;
  final ListPrice listPrice;
  final RetailPrice retailPrice;

	Offers.fromJsonMap(Map<String, dynamic> map): 
		finskyOfferType = map["finskyOfferType"],
		listPrice = ListPrice.fromJsonMap(map["listPrice"]),
		retailPrice = RetailPrice.fromJsonMap(map["retailPrice"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['finskyOfferType'] = finskyOfferType;
		data['listPrice'] = listPrice == null ? null : listPrice.toJson();
		data['retailPrice'] = retailPrice == null ? null : retailPrice.toJson();
		return data;
	}
}
