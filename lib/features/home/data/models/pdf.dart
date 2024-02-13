
class Pdf {

  final bool isAvailable;

	Pdf.fromJsonMap(Map<String, dynamic> map): 
		isAvailable = map["isAvailable"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isAvailable'] = isAvailable;
		return data;
	}
}
