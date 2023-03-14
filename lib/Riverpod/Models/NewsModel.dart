// ignore_for_file: file_names

class NewsModel {
  NewsModel({
    required this.date,
    required this.desc,
    required this.image,
    required this.index,
    required this.timestamp,
    required this.title,
    required this.titleLink,
    required this.uid,
    required this.url,
    required this.urlUid,
  });

  String date;
  String desc;
  String image;
  int index;
  int timestamp;
  String title;
  String titleLink;
  String uid;
  String url;
  String urlUid;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        date: json["date"],
        desc: json["desc"],
        image: json["image"],
        index: json["index"],
        timestamp: json["timestamp"],
        title: json["title"],
        titleLink: json["title_link"],
        uid: json["uid"],
        url: json["url"],
        urlUid: json["url_uid"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "desc": desc,
        "image": image,
        "index": index,
        "timestamp": timestamp,
        "title": title,
        "title_link": titleLink,
        "uid": uid,
        "url": url,
        "url_uid": urlUid,
      };
}
