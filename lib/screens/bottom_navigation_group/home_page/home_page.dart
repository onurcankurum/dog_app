import 'package:dog_app/core/navigation/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';

import '../../mixin/base_view.dart';

final class HomePage extends StatefulWidget implements BaseView {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  NavigationConstant get navigationConstant => NavigationConstant.homePage;
}

final class _HomePageState extends State<HomePage> {
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
          GridView.count(
            crossAxisCount: 2,
            children: List.generate(100, (index) {
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }),
          ),
          const Positioned(
              bottom: 0, left: 0, right: 0, child: _ExpandableTextField())
        ],
      ),
    );
  }
}

final class _ExpandableTextField extends StatefulWidget {
  const _ExpandableTextField();

  @override
  State<_ExpandableTextField> createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<_ExpandableTextField>
    with BaseStateMixin {
  final TextEditingController _textEditingController = TextEditingController();
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
                focusNode: _focusNode,
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
