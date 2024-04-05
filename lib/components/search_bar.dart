import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Search Bar and its widgets -> Main Bar, Prefix Icon and Suffix Icon
class TopSearchBar extends StatelessWidget {
  final GestureTapCallback onTap;
  final TextEditingController textEditing;
  const TopSearchBar({
    super.key,
    required this.onTap,
    required this.textEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 20, spreadRadius: 0.0)]),
      child: TextField(
        controller: textEditing,
        decoration: InputDecoration(
            filled: true,
            hintText: 'Search City',
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: const _SearchPrefixIcon(),
            suffixIcon: _FilterSuffixIcon(onTap: onTap),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}

class _SearchPrefixIcon extends StatelessWidget {
  const _SearchPrefixIcon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SvgPicture.asset('assets/icons/Search.svg'),
    );
  }
}

class _FilterSuffixIcon extends StatelessWidget {
  final GestureTapCallback onTap;
  const _FilterSuffixIcon({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const VerticalDivider(
              // color: Color(0xffDDDADA),
              color: Colors.black,
              indent: 10,
              endIndent: 10,
              thickness: 0.1,
            ),
            GestureDetector(
              onTap: onTap,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                // child: SvgPicture.asset('assets/icons/Filter.svg'),
                child: Icon(Icons.arrow_circle_right_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
