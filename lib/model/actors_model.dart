class ActorModel {
  final String name;
  final String? profilePath;

  ActorModel({
    required this.name,
    this.profilePath
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
    );
  }

 

}

extension ActorModelImage on ActorModel {
  String get fullImageUrl =>
      profilePath != null ? 'https://image.tmdb.org/t/p/w500$profilePath' : '';
  }

