class Launch {
  final String missionName;
  final String rocketName;
  final String siteName;
  final String siteNameLong;
  final String launchDate;
  final String details;
  final String videoLink;
  final String articleLink;

  Launch({
    required this.missionName,
    required this.rocketName,
    required this.siteName,
    required this.siteNameLong,
    required this.launchDate,
    required this.details,
    required this.videoLink,
    required this.articleLink,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      missionName: json['mission_name'] ?? '',
      rocketName: json['rocket']['rocket_name'] ?? '',
      siteName: json['launch_site'] != null
          ? json['launch_site']['site_name'] ?? ''
          : 'Unknown Site',
      siteNameLong: json['launch_site'] != null
          ? json['launch_site']['site_name_long'] ?? ''
          : 'Unknown Site Long Name',
      launchDate: json['launch_date_utc'] ?? '',
      details: json['details'] ?? 'No details available',
      videoLink: json['links'] != null ? json['links']['video_link'] ?? '' : '',
      articleLink:
          json['links'] != null ? json['links']['article_link'] ?? '' : '',
    );
  }
}
