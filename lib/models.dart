class Post {
  String metode;
  String result;
  String akurasi;
  String waktu;

  Post({
    required this.metode,
    required this.result,
    required this.akurasi,
    required this.waktu,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        metode: json["metode"],
        result: json["result"],
        akurasi: json["akurasi"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "metode": metode,
        "result": result,
        "akurasi": akurasi,
        "waktu": waktu,
      };
}
