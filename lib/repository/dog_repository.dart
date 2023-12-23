import 'package:dog_app/model/api_wrapper.dart';

import '../model/breed.dart';
import '../service/breed/i_dog_service.dart';

final class DogRepository {
  const DogRepository(this.dogService);
  final IDogService dogService;
  static ApiWrapper<List<Breed>>? allBreeds;

  Future<ApiWrapper<List<Breed>>> getBreeds() async {
    if (allBreeds != null) return allBreeds!;
    return allBreeds = await dogService.getBreedList();
  }
}
