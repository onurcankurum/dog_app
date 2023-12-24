import 'package:dog_app/model/api_wrapper.dart';
import 'package:dog_app/model/sub_breed.dart';

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
      final List<SubBreed> breedTypes = [];
      if (entry.value is List) {
        for (final type in entry.value) {
          breedTypes.add(SubBreed(subBreedName: type.toString()));
        }
      }

      return Breed(
        breedName: entry.key,
        subBreeds: breedTypes,
      );
    }).toList();

    breedsListModel =
        ApiWrapper(data: breedList, isSuccess: true, message: 'success');

    return breedsListModel;
  }

  @override
  Future<ApiWrapper<String>> getRandomBreedImage(String breedName) async {
    final response = await Client().request(
      path: '/breed/$breedName/images/random',
      httpMethod: HttpMethods.get,
    );

    if (response == null) return ApiWrapper.error();
    if (response.statusCode != 200) {
      return ApiWrapper.error(message: 'http error: ${response.statusCode}');
    }
    if (response.data!! is Map<String, List<String>>) return ApiWrapper.error();

    if ((response.data as Map<String, dynamic>)['message'] is! String) {
      return ApiWrapper.error();
    }
    return ApiWrapper(
        data: (response.data as Map<String, dynamic>)['message'] as String,
        isSuccess: true,
        message: 'success');
  }
}
