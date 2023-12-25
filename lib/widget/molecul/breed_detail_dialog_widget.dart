import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_app/core/extension/theme_extension.dart';
import 'package:dog_app/repository/dog_repository.dart';
import 'package:dog_app/service/breed/dog_service.dart';
import 'package:dog_app/widget/atom/my_error_widget.dart';
import 'package:dog_app/widget/atom/my_place_holder.dart';
import 'package:dog_app/widget/mixin/open_dialog.dart';
import 'package:flutter/material.dart';

final class BreedDetailDialogWidget extends StatelessWidget with OpenDialog {
  const BreedDetailDialogWidget({
    super.key,
    required this.imageUrl,
    required this.breedName,
    required this.subBreedNames,
  });
  final String imageUrl;
  final String breedName;
  final List<String> subBreedNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageWidget(
              imageUrl,
              343,
              const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Breed',
            style: context.themeData.textTheme.titleMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          const _Divider(),
          const SizedBox(
            height: 8,
          ),
          Text(
            breedName,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          if (subBreedNames.isNotEmpty) ...[
            Text(
              'Sub Breed',
              style: context.themeData.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            const _Divider(),
            const SizedBox(
              height: 4,
            ),
            for (final subBreedName in subBreedNames)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  subBreedName,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
          ],
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: OutlinedButton(
              onPressed: () async {
                final String? randomBreedImageUrl =
                    await DogRepository(DogService()).randomImage(breedName);

                showMyDialog(
                    padding: const EdgeInsets.all(60),
                    // ignore: use_build_context_synchronously
                    child: randomImageDialogWidget(
                        context, randomBreedImageUrl ?? ''),
                    capturePageContext: () => context);
              },
              child: const Text('Generate'),
            ),
          )
        ],
      ),
    );
  }

  Column randomImageDialogWidget(BuildContext context, String url) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imageWidget(
            'https://images.dog.ceo/breeds/australian-shepherd/pepper.jpg',
            256,
            const BorderRadius.all(Radius.circular(12))),
        const SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              color: Colors.white,
              height: 32,
              width: 32,
              child: const Icon(Icons.close)),
        )
      ],
    );
  }

  Widget imageWidget(String url, double height, BorderRadius borderRadius) {
    return CachedNetworkImage(
      height: height,
      width: double.infinity,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const MyPlaceHolder(),
      errorWidget: (context, url, error) {
        return const MyErroridget();
      },
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.myTheme.settingListTileDividerColor,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      height: 2,
      width: double.infinity,
    );
  }
}
