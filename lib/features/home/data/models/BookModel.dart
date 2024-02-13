import 'package:bookly_app/features/home/data/models/volume_info.dart';
import 'package:bookly_app/features/home/data/models/sale_info.dart';
import 'package:bookly_app/features/home/data/models/access_info.dart';
import 'package:bookly_app/features/home/data/models/search_info.dart';

class BookModel {

  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;
  final SearchInfo searchInfo;

	BookModel.fromJsonMap(Map<String, dynamic> map): 
		kind = map["kind"],
		id = map["id"],
		etag = map["etag"],
		selfLink = map["selfLink"],
		volumeInfo = VolumeInfo.fromJsonMap(map["volumeInfo"]),
		saleInfo = SaleInfo.fromJsonMap(map["saleInfo"]),
		accessInfo = AccessInfo.fromJsonMap(map["accessInfo"]),
		searchInfo = SearchInfo.fromJsonMap(map["searchInfo"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['kind'] = kind;
		data['id'] = id;
		data['etag'] = etag;
		data['selfLink'] = selfLink;
		data['volumeInfo'] = volumeInfo == null ? null : volumeInfo.toJson();
		data['saleInfo'] = saleInfo == null ? null : saleInfo.toJson();
		data['accessInfo'] = accessInfo == null ? null : accessInfo.toJson();
		data['searchInfo'] = searchInfo == null ? null : searchInfo.toJson();
		return data;
	}
}
