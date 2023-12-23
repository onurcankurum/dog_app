import 'package:dog_app/model/api_wrapper.dart';

import '../../core/network/client.dart';
import '../../model/breed.dart';
import 'i_dog_service.dart';

final class DogService implements IDogService {
  DogService();

  @override
  Future<ApiWrapper<List<Breed>>> getBreedList() async {
    final response = await Client().request(
      path: '/breeds/list/all',
      httpMethod: HttpMethods.get,
    );

    ApiWrapper<List<Breed>>? breedsListModel;

    if (response == null) return ApiWrapper.error();
    if (response.statusCode != 200) {
      return ApiWrapper.error(message: 'http error: ${response.statusCode}');
    }
    if (response.data!! is Map<String, List<String>>) return ApiWrapper.error();

    late final Map<String, dynamic> rawData;
    if ((response.data as Map<String, dynamic>)['message']!
        is! Map<String, dynamic>) {
      return ApiWrapper.error();
    }

    rawData = (response.data as Map<String, dynamic>)['message']
        as Map<String, dynamic>;

    final breedList = rawData.entries.map((entry) {
      final List<String> breedTypes = [];
      if (entry.value is List) {
        for (final type in entry.value) {
          breedTypes.add(type.toString());
        }
      }

      return Breed(breedName: entry.key, subBreeds: breedTypes);
    }).toList();

    breedsListModel =
        ApiWrapper(data: breedList, isSuccess: true, message: 'success');

    return breedsListModel;
  }
}
