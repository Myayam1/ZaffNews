class NewsModel {
  String channelImagePath;
  String channelName;
  String headline;
  String timeUploaded;
  String newsImagePath;
  bool isSaved;

  NewsModel({
    required this.channelImagePath,
    required this.channelName,
    required this.headline,
    required this.timeUploaded,
    required this.newsImagePath,
    this.isSaved = false,
  });

  // Convert a NewsModel into a Map
  Map<String, dynamic> toMap() {
    return {
      'channelImagePath' : channelImagePath,
      'channelName': channelName,
      'headline': headline,
      'timeUploaded': timeUploaded,
      'newsImagePath': newsImagePath,
    };
  }

  // Create a NewsModel from a Map
  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      channelImagePath: map['channelImagePath'] ?? '',
      channelName: map['channelName'],
      headline: map['headline'],
      timeUploaded: map['timeUploaded'],
      newsImagePath: map['newsImagePath'],
    );
  }
}
