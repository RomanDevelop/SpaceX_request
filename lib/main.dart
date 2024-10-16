import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_app/repositories/spacex_repository.dart';
import 'package:spacex_app/ui/screens/home.dart';
import 'package:spacex_app/blocs/spacex_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter(); // Необходим для кеширования
  final HttpLink httpLink =
      HttpLink('https://spacex-production.up.railway.app/');
  final GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: HiveStore()),
  );

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final GraphQLClient client;

  MyApp({required this.client});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SpaceXCubit(SpaceXRepository(client))..fetchLaunches(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
