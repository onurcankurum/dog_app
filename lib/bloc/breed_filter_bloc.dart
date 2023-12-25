import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/breed.dart';

class FilterEvent {
  const FilterEvent({required this.filterText});
  final String filterText;
}

class BreedFilterBloc extends Bloc<FilterEvent, List<Breed>> {
  BreedFilterBloc({required this.allBreeds}) : super(allBreeds) {
    on<FilterEvent>(_filterBreed);
  }

  final List<Breed> allBreeds;

  void _filterBreed(FilterEvent event, Emitter<List<Breed>> emit) {
    emit(allBreeds
        .where((element) => element.breedName.contains(event.filterText))
        .toList());
  }
}
