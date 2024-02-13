import 'package:bookly_app/features/home/data/models/epub.dart';
import 'package:bookly_app/features/home/data/models/pdf.dart';

class AccessInfo {

  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final Epub epub;
  final Pdf pdf;
  final String webReaderLink;
  final String accessViewStatus;
  final bool quoteSharingAllowed;

	AccessInfo.fromJsonMap(Map<String, dynamic> map): 
		country = map["country"],
		viewability = map["viewability"],
		embeddable = map["embeddable"],
		publicDomain = map["publicDomain"],
		textToSpeechPermission = map["textToSpeechPermission"],
		epub = Epub.fromJsonMap(map["epub"]),
		pdf = Pdf.fromJsonMap(map["pdf"]),
		webReaderLink = map["webReaderLink"],
		accessViewStatus = map["accessViewStatus"],
		quoteSharingAllowed = map["quoteSharingAllowed"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['country'] = country;
		data['viewability'] = viewability;
		data['embeddable'] = embeddable;
		data['publicDomain'] = publicDomain;
		data['textToSpeechPermission'] = textToSpeechPermission;
		data['epub'] = epub == null ? null : epub.toJson();
		data['pdf'] = pdf == null ? null : pdf.toJson();
		data['webReaderLink'] = webReaderLink;
		data['accessViewStatus'] = accessViewStatus;
		data['quoteSharingAllowed'] = quoteSharingAllowed;
		return data;
	}
}
