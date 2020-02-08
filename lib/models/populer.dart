class Popular {
  String duration;
  String steps;
  String subTitile;
  String title;
  String image;

  Popular(
    this.duration,
    this.steps,
    this.subTitile,
    this.title,
      this.image
  );

  Popular.data(Map<String, dynamic> map, String id) {
    this.duration = map['duration'];
    this.steps = map['steps'];
    this.subTitile = map['subTitle'];
    this.title = map['title'];
    this.image = map['image'];
  }
}
