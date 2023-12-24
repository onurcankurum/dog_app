import 'sub_breed.dart';

final class Breed {
  Breed({
    required this.breedName,
    required this.subBreeds,
  });

  final String breedName;
  final List<SubBreed> subBreeds;
  String? image;
}
