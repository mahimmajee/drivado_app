import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/Users.dart';
import '../view/UserScreen.dart';

class UserListTile extends StatefulWidget {
  String? title;
  UserModel? userModel;
  String? icon;

  UserListTile({
    this.title,
    this.userModel,
    this.icon,
    super.key,
  });

  @override
  State<UserListTile> createState() => _UserListTileState();
}

class _UserListTileState extends State<UserListTile> {
  bool isTapped = false;

  void _handleTap() {
    setState(() {
      isTapped = true;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          isTapped = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset(
              widget.icon ?? 'lib/assets/images/Person.png',
              width: 14,
              height: 14,
              color: isTapped ? Colors.red : Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.title!,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isTapped ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _handleTap();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserScreen(
                userModel: widget.userModel,
              ),
            ));
      },
      tileColor: const Color(0xFFFFFFFF),
    );
  }
}
