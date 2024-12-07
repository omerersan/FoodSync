import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: const Icon(
              CupertinoIcons.home,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/search");
            },
            icon: const Icon(
              CupertinoIcons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/planing");
            },
            icon: const Icon(Icons.calendar_today),
          ),
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: const Icon(
              CupertinoIcons.person,
            ),
          ),
        ],
      ),
    );
  }
}
