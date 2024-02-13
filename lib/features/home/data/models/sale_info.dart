import 'package:bookly_app/features/home/data/models/list_price.dart';
import 'package:bookly_app/features/home/data/models/retail_price.dart';
import 'package:bookly_app/features/home/data/models/offers.dart';

class SaleInfo {

  final String country;
  final String saleability;
  final bool isEbook;
  final ListPrice listPrice;
  final RetailPrice retailPrice;
  final String buyLink;
  final List<Offers> offers;

	SaleInfo.fromJsonMap(Map<String, dynamic> map): 
		country = map["country"],
		saleability = map["saleability"],
		isEbook = map["isEbook"],
		listPrice = ListPrice.fromJsonMap(map["listPrice"]),
		retailPrice = RetailPrice.fromJsonMap(map["retailPrice"]),
		buyLink = map["buyLink"],
		offers = List<Offers>.from(map["offers"].map((it) => Offers.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['country'] = country;
		data['saleability'] = saleability;
		data['isEbook'] = isEbook;
		data['listPrice'] = listPrice == null ? null : listPrice.toJson();
		data['retailPrice'] = retailPrice == null ? null : retailPrice.toJson();
		data['buyLink'] = buyLink;
		data['offers'] = offers != null ? 
			this.offers.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
