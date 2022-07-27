class Welcome {
  Welcome({
    required this.message,
    required this.posts,
  });

  String message;
  List<Post> posts;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    message: json["message"],
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );
}

class Post {
  Post({
    required this.id,
    required this.categoryId,
    required this.nama,
    required this.tampil,
    required this.body,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int categoryId;
  String nama;
  String tampil;
  String body;
  String img;
  DateTime createdAt;
  DateTime updatedAt;

  factory Post.fromJson(Map<String, dynamic> json) =>
      Post(
        id: json["id"],
        categoryId: json["category_id"],
        nama: json["nama"],
        tampil: json["tampil"],
        body: json["body"],
        img: json["img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
