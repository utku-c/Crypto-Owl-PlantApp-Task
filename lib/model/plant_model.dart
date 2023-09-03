class PlantModel {
  String? plantName;
  String? description;
  int? frequencyOfWatering;
  String? category;
  String? sunlight;
  String? imageUrl;

  PlantModel(
      {this.plantName,
      this.description,
      this.frequencyOfWatering,
      this.category,
      this.sunlight,
      this.imageUrl});

  PlantModel.fromJson(Map<String, dynamic> json) {
    plantName = json['plantName'];
    description = json['description'];
    frequencyOfWatering = json['frequencyOfWatering'];
    category = json['category'];
    sunlight = json['sunlight'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plantName'] = plantName;
    data['description'] = description;
    data['frequencyOfWatering'] = frequencyOfWatering;
    data['category'] = category;
    data['sunlight'] = sunlight;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
