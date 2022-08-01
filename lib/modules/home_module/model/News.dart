class News {
  News({
      String? category, 
      List<Data>? data, 
      bool? success,}){
    _category = category;
    _data = data;
    _success = success;
}

  News.fromJson(dynamic json) {
    _category = json['category'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _success = json['success'];
  }
  String? _category;
  List<Data>? _data;
  bool? _success;
News copyWith({  String? category,
  List<Data>? data,
  bool? success,
}) => News(  category: category ?? _category,
  data: data ?? _data,
  success: success ?? _success,
);
  String? get category => _category;
  List<Data>? get data => _data;
  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = _category;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    return map;
  }

}

class Data {
  Data({
      String? author, 
      String? content, 
      String? date, 
      String? id, 
      String? imageUrl, 
      String? readMoreUrl, 
      String? time, 
      String? title, 
      String? url,}){
    _author = author;
    _content = content;
    _date = date;
    _id = id;
    _imageUrl = imageUrl;
    _readMoreUrl = readMoreUrl;
    _time = time;
    _title = title;
    _url = url;
}

  Data.fromJson(dynamic json) {
    _author = json['author'];
    _content = json['content'];
    _date = json['date'];
    _id = json['id'];
    _imageUrl = json['imageUrl'];
    _readMoreUrl = json['readMoreUrl'];
    _time = json['time'];
    _title = json['title'];
    _url = json['url'];
  }
  String? _author;
  String? _content;
  String? _date;
  String? _id;
  String? _imageUrl;
  String? _readMoreUrl;
  String? _time;
  String? _title;
  String? _url;
Data copyWith({  String? author,
  String? content,
  String? date,
  String? id,
  String? imageUrl,
  String? readMoreUrl,
  String? time,
  String? title,
  String? url,
}) => Data(  author: author ?? _author,
  content: content ?? _content,
  date: date ?? _date,
  id: id ?? _id,
  imageUrl: imageUrl ?? _imageUrl,
  readMoreUrl: readMoreUrl ?? _readMoreUrl,
  time: time ?? _time,
  title: title ?? _title,
  url: url ?? _url,
);
  String? get author => _author;
  String? get content => _content;
  String? get date => _date;
  String? get id => _id;
  String? get imageUrl => _imageUrl;
  String? get readMoreUrl => _readMoreUrl;
  String? get time => _time;
  String? get title => _title;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = _author;
    map['content'] = _content;
    map['date'] = _date;
    map['id'] = _id;
    map['imageUrl'] = _imageUrl;
    map['readMoreUrl'] = _readMoreUrl;
    map['time'] = _time;
    map['title'] = _title;
    map['url'] = _url;
    return map;
  }

}