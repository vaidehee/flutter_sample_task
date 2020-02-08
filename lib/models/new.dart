class New {
  String duration;
  String steps;
  String subTitile;
  String title;
  String image;

  New(
      this.duration,
      this.steps,
      this.subTitile,
      this.title,
      this.image
      );

  New.data(Map<String, dynamic> map, String id) {
    this.duration = map['duration'];
    this.steps = map['steps'];
    this.subTitile = map['subTitle'];
    this.title = map['title'];
    this.image = map['image'];
  }
}
