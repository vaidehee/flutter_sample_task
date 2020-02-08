class Practice {
  String image;
  String subTitile;
  String title;
  bool isFavorited;
  String time;

  Practice(
      this.image,
      this.subTitile,
      this.title,
      this.isFavorited,
      this.time,
      );

  Practice.data(Map<String, dynamic> map, String id) {
    this.image = map['image'];
    this.subTitile = map['subTitle'];
    this.title = map['title'];
    this.isFavorited = map['isFavorited'];
    this.time = map['time'];
  }
}
