class ImageUris {
  String small;
  String normal;
  String large;
  String png;
  String artCrop;
  String borderCrop;

  ImageUris(
      {this.small,
      this.normal,
      this.large,
      this.png,
      this.artCrop,
      this.borderCrop});

  ImageUris.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    normal = json['normal'];
    large = json['large'];
    png = json['png'];
    artCrop = json['art_crop'];
    borderCrop = json['border_crop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['normal'] = this.normal;
    data['large'] = this.large;
    data['png'] = this.png;
    data['art_crop'] = this.artCrop;
    data['border_crop'] = this.borderCrop;
    return data;
  }
}
