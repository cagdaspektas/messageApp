/* import 'dart:convert';

Post postFromMap(String str) => Post.fromMap(json.decode(str));

String postToMap(Post data) => json.encode(data.toMap());

class Post {
  //isntance of sort geliyordu görmek için  alt satıra yazıldı
   @override toString() => 'id:$id,email:$email,firstName:$firstName,lastName:$lastName,avatar:$avatar';
  Post({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
 */
// To parse this JSON data, do
//
//     final post = postFromMap(jsonString);

import 'dart:convert';

Post postFromMap(String str) => Post.fromMap(json.decode(str));

String postToMap(Post data) => json.encode(data.toMap());

class Post {
     @override toString() => 'id:$id,author:$author,url:$url,downloadUrl:$downloadUrl';

    Post({
        this.id,
        this.author,
        this.width,
        this.height,
        this.url,
        this.downloadUrl,
    });

    String? id;
    String? author;
    int? width;
    int? height;
    String? url;
    String? downloadUrl;

    factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
    };
}
