// class DropdownItem {
//   final String value;
  
//   DropdownItem({required this.value});

//   factory DropdownItem.fromJson(Map<String, dynamic> json) {
//     return DropdownItem(
//       value: json['value'],
//     );
//   }
// }



import 'dart:convert';

class DropdownItem {
    final int? userId;
    final int? id;
    final String? title;
    final String? body;

    DropdownItem({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory DropdownItem.fromRawJson(String str) => DropdownItem.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DropdownItem.fromJson(Map<String, dynamic> json) => DropdownItem(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
