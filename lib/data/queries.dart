const String getLaunchesQuery = """
query {
  launchesPast(limit: 5) {
    mission_name
    launch_date_utc
    details
    rocket {
      rocket_name
    }
    launch_site {
      site_name
      site_name_long
    }
    links {
      video_link
      article_link
    }
  }
}
""";
