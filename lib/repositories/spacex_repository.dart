import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_app/models/launch.dart';
import 'package:spacex_app/data/queries.dart';

class SpaceXRepository {
  final GraphQLClient client;

  SpaceXRepository(this.client);

  Future<List<Launch>> getLaunches() async {
    final result = await client.query(
      QueryOptions(
        document: gql(getLaunchesQuery),
      ),
    );

    // Логирование результата запроса
    print(result.data);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List launches = result.data?['launchesPast'] ?? [];
    return launches.map((launch) => Launch.fromJson(launch)).toList();
  }
}
