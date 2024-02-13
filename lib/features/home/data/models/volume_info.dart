import 'package:bookly_app/features/home/data/models/industry_identifiers.dart';
import 'package:bookly_app/features/home/data/models/reading_modes.dart';
import 'package:bookly_app/features/home/data/models/panelization_summary.dart';
import 'package:bookly_app/features/home/data/models/image_links.dart';

class VolumeInfo {

  final String title;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final List<IndustryIdentifiers> industryIdentifiers;
  final ReadingModes readingModes;
  final int pageCount;
  final String printType;
  final List<String> categories;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final PanelizationSummary panelizationSummary;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

	VolumeInfo.fromJsonMap(Map<String, dynamic> map): 
		title = map["title"],
		authors = List<String>.from(map["authors"]),
		publisher = map["publisher"],
		publishedDate = map["publishedDate"],
		description = map["description"],
		industryIdentifiers = List<IndustryIdentifiers>.from(map["industryIdentifiers"].map((it) => IndustryIdentifiers.fromJsonMap(it))),
		readingModes = ReadingModes.fromJsonMap(map["readingModes"]),
		pageCount = map["pageCount"],
		printType = map["printType"],
		categories = List<String>.from(map["categories"]),
		maturityRating = map["maturityRating"],
		allowAnonLogging = map["allowAnonLogging"],
		contentVersion = map["contentVersion"],
		panelizationSummary = PanelizationSummary.fromJsonMap(map["panelizationSummary"]),
		imageLinks = ImageLinks.fromJsonMap(map["imageLinks"]),
		language = map["language"],
		previewLink = map["previewLink"],
		infoLink = map["infoLink"],
		canonicalVolumeLink = map["canonicalVolumeLink"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = title;
		data['authors'] = authors;
		data['publisher'] = publisher;
		data['publishedDate'] = publishedDate;
		data['description'] = description;
		data['industryIdentifiers'] = industryIdentifiers != null ? 
			this.industryIdentifiers.map((v) => v.toJson()).toList()
			: null;
		data['readingModes'] = readingModes == null ? null : readingModes.toJson();
		data['pageCount'] = pageCount;
		data['printType'] = printType;
		data['categories'] = categories;
		data['maturityRating'] = maturityRating;
		data['allowAnonLogging'] = allowAnonLogging;
		data['contentVersion'] = contentVersion;
		data['panelizationSummary'] = panelizationSummary == null ? null : panelizationSummary.toJson();
		data['imageLinks'] = imageLinks == null ? null : imageLinks.toJson();
		data['language'] = language;
		data['previewLink'] = previewLink;
		data['infoLink'] = infoLink;
		data['canonicalVolumeLink'] = canonicalVolumeLink;
		return data;
	}
}
