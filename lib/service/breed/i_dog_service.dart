import '../../model/api_wrapper.dart';
import '../../model/breed.dart';

abstract class IDogService {
  Future<ApiWrapper<List<Breed>>> getBreedList();
}
