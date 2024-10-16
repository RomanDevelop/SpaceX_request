import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/blocs/spacex_cubit.dart';
import 'package:spacex_app/models/launch.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Launches'),
      ),
      body: BlocBuilder<SpaceXCubit, List<Launch>>(
        builder: (context, launches) {
          if (launches.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: launches.length,
            itemBuilder: (context, index) {
              final launch = launches[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        launch.missionName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Rocket: ${launch.rocketName}'),
                      Text('Launch Site: ${launch.siteName}'),
                      Text('Launch Date: ${launch.launchDate}'),
                      SizedBox(height: 10),
                      Text('Details: ${launch.details}'),
                      SizedBox(height: 10),
                      if (launch.videoLink.isNotEmpty)
                        TextButton(
                          onPressed: () => _launchURL(launch.videoLink),
                          child: Text('Watch Video'),
                        ),
                      if (launch.articleLink.isNotEmpty)
                        TextButton(
                          onPressed: () => _launchURL(launch.articleLink),
                          child: Text('Read Article'),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
