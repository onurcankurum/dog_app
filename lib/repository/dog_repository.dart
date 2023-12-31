import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/model/api_wrapper.dart';
import 'package:flutter/material.dart';

import '../model/breed.dart';
import '../service/breed/i_dog_service.dart';

final class DogRepository {
  const DogRepository(this.dogService);
  final IDogService dogService;
  static ApiWrapper<List<Breed>>? allBreeds;

  Future<ApiWrapper<List<Breed>>> getBreeds() async {
    if (allBreeds != null) return allBreeds!;
    allBreeds = await dogService.getBreedList();
    return allBreeds!;
  }

  Future<void> getImageForEachBreed() async {
    List<Future<ApiWrapper<String>>> tasks = [];
    if (allBreeds?.data != null) {
      for (final breed in allBreeds!.data!) {
        tasks.add(dogService.getRandomBreedImage(breed.breedName).then((value) {
          breed.image = value.data ?? '';
          return value;
        }));
      }
    }
    final responses = await Future.wait(tasks);
    for (final url in responses) {
      allBreeds!.data!
          .firstWhere((element) => element.breedName == url.data)
          .image = url.data;
    }
  }

  Future<void> cacheImageForEachBreed(BuildContext context) async {
    if (allBreeds?.data != null) {
      for (final breed in allBreeds!.data!) {
        if (breed.image != null) {
          await precacheImage(
              CachedNetworkImageProvider(
                breed.image!,
              ),
              context);
        }
      }
    }
  }

  Future<String?> randomImage(String breedName) async {
    final response = await dogService.getRandomBreedImage(breedName);
    return response.data;
  }
}
