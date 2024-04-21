import 'package:bookly/Features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setup() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));
  getit.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getit.get<ApiService>(),
    ),
  );
}
