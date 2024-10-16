class Launch {
  final String missionName;
  final String rocketName;
  final String launchDate;
  final String siteName;
  final String details;
  final String videoLink;
  final String articleLink;

  Launch({
    required this.missionName,
    required this.rocketName,
    required this.launchDate,
    required this.siteName,
    required this.details,
    required this.videoLink,
    required this.articleLink,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      missionName: json['mission_name'],
      rocketName: json['rocket']['rocket_name'],
      launchDate: json['launch_date_utc'],
      siteName: json['launch_site']['site_name_long'],
      details: json['details'] ?? 'No details available',
      videoLink: json['links']['video_link'] ?? '',
      articleLink: json['links']['article_link'] ?? '',
    );
  }
}
