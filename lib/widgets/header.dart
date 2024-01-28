import 'package:flutter/material.dart';
import 'package:outmarket_app/size_utils.dart';
import 'package:outmarket_app/widgets/widgets.dart';

class Header extends StatelessWidget {
  final String profilePhoto;
  final String name;
  const Header({super.key, required this.profilePhoto, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 70, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                child: Row(
              children: [
                Image.asset(
                  "assets/icons/extra.png",
                  width: 24.0,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Search(
                  width: 400,
                  radius: 20,
                ),
              ],
            )),
            SizedBox(
              width: 0.22.wp,
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  const Icon(Icons.notifications_outlined),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(
                    width: 4,
                  ),
                  Avatar(url: profilePhoto, radius: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
