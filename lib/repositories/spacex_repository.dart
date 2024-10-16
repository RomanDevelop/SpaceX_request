import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_app/models/launch.dart';
import 'package:spacex_app/data/queries.dart'; // Импортируйте файл с запросами

class SpaceXRepository {
  final GraphQLClient client;

  SpaceXRepository(this.client);

  Future<List<Launch>> getLaunches() async {
    final result = await client.query(
      QueryOptions(
        document: gql(getLaunchesQuery), // Убедитесь, что это строка запроса
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List launches = result.data?['launchesPast'] ?? [];
    return launches.map((launch) => Launch.fromJson(launch)).toList();
  }
}
