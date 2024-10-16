import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/repositories/spacex_repository.dart';
import 'package:spacex_app/models/launch.dart';

class SpaceXCubit extends Cubit<List<Launch>> {
  final SpaceXRepository repository;

  SpaceXCubit(this.repository) : super([]);

  Future<void> fetchLaunches() async {
    try {
      final launches = await repository.getLaunches();
      print('Fetched launches: $launches');
      emit(launches);
    } catch (e) {
      emit([]); // Эмитируем пустой список в случае ошибки
      print('Error fetching launches: $e'); // Логирование ошибки
    }
  }
}
