import 'package:dog_app/bloc/breed_filter_bloc.dart';
import 'package:dog_app/core/extension/theme_extension.dart';
import 'package:dog_app/core/navigation/navigation/navigation_constants.dart';
import 'package:dog_app/repository/dog_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/breed.dart';
import '../../../widget/atom/my_breed_category_item.dart';
import '../../../widget/mixin/open_dialog.dart';
import '../../../widget/molecul/breed_detail_dialog_widget.dart';
import '../../mixin/base_view.dart';

final class HomePage extends StatefulWidget
    with OpenDialog
    implements BaseView {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  NavigationConstant get navigationConstant => NavigationConstant.homePage;
}

final class _HomePageState extends State<HomePage> with BaseStateMixin {
  late final BreedFilterBloc _breedFilterBloc;
  @override
  void initState() {
    _breedFilterBloc =
        BreedFilterBloc(allBreeds: DogRepository.allBreeds?.data ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dog App'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocBuilder<BreedFilterBloc, List<Breed>>(
                bloc: _breedFilterBloc,
                builder: (context, state) {
                  if (state.isEmpty) {
                    return const _NoResultFoundWidget();
                  }
                  return GridView.count(
                    padding: const EdgeInsets.only(bottom: 100),
                    crossAxisCount: 2,
                    children: List.generate(state.length, (index) {
                      return MyBreedCategoryItem(
                        imageUrl: state[index].image ?? '',
                        text: state[index].breedName,
                        onTap: () {
                          widget.showMyDialog(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: BreedDetailDialogWidget(
                                subBreedNames: state[index]
                                    .subBreeds
                                    .map((e) => e.subBreedName)
                                    .toList(),
                                breedName: state[index].breedName,
                                imageUrl: state[index].image ?? '',
                              ),
                              capturePageContext: () => context);
                        },
                      );
                    }),
                  );
                }),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _ExpandableTextField(
                onChanged: (value) =>
                    _breedFilterBloc.add(FilterEvent(filterText: value)),
              ))
        ],
      ),
    );
  }
}

class _NoResultFoundWidget extends StatelessWidget {
  const _NoResultFoundWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No results found',
            style: context.themeData.textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Try searching with another word')
        ],
      ),
    );
  }
}

final class _ExpandableTextField extends StatefulWidget {
  const _ExpandableTextField({
    required this.onChanged,
  });
  final Function(String) onChanged;
  @override
  State<_ExpandableTextField> createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<_ExpandableTextField>
    with BaseStateMixin {
  final FocusNode _focusNode = FocusNode();
  int minLines = 1;
  bool _isExpanded = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          minLines = 3;
        });
      } else {
        if (_isExpanded) return;
        setState(() {
          minLines = 1;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 0) {
          // Aşağı doğru kaydırma (kapama)
          setState(() {
            if (!_focusNode.hasFocus) minLines = 1;

            _isExpanded = false;
          });
        } else if (details.delta.dy < 0) {
          // Yukarı doğru kaydırma (açma)
          if (!_focusNode.hasFocus) return;
          setState(() {
            _isExpanded = true;
          });
        }
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: _isExpanded ? double.infinity : null,
              constraints: BoxConstraints(
                minHeight: 58,
                maxHeight: dynamicHeight(0.5),
              ),
              margin: _focusNode.hasFocus
                  ? EdgeInsets.zero
                  : const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                  bottomLeft: _focusNode.hasFocus
                      ? Radius.zero
                      : const Radius.circular(8),
                  bottomRight: _focusNode.hasFocus
                      ? Radius.zero
                      : const Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              width: double.infinity,
              child: TextField(
                onChanged: widget.onChanged,
                focusNode: _focusNode,
                style: context.themeData.textTheme.headlineMedium,
                minLines: minLines,
                maxLines: 99,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              )),
          if (_focusNode.hasFocus || _isExpanded)
            Positioned(
              top: 8,
              child: Container(
                height: 3,
                width: 24,
                decoration: BoxDecoration(
                  color: themeData.dividerTheme.color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
