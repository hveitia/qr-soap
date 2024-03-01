import 'dart:convert';

QRItem qrItemFromJson(String str) {
  final jsonData = json.decode(str);
  return QRItem.fromJson(jsonData);
}

class QRItem {
  final String date;
  final String time;
  final String url;
  final String status;

  QRItem({
    required this.date,
    required this.time,
    required this.url,
    required this.status,
  });

  factory QRItem.fromJson(Map<String, dynamic> json) => QRItem(
    date: json["date"].toString(),
    time: json["time"].toString(),
    url: json["url"].toString(),
    status: json["status"].toString(),
  );


}