import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/Users.dart';
import '../view/UserScreen.dart';

class SubCompanyListTile extends StatefulWidget {
  String? icon;
  String? title;
  String? pushScreen;
  UserModel? userModel;

  SubCompanyListTile({
    this.icon,
    this.title,
    this.pushScreen,
    this.userModel,
    super.key,
  });

  @override
  State<SubCompanyListTile> createState() => _SubCompanyListTileState();
}

class _SubCompanyListTileState extends State<SubCompanyListTile> {
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
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        title: Row(
          children: [
            Image.asset(
              widget.icon ?? 'lib/assets/images/AddPerson.png',
              width: 14,
              height: 14,
              color: isTapped ? Colors.red : Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.title ?? "Add user",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isTapped ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
        tileColor: const Color(0xFFFFFFFF),
        onTap: () {
          _handleTap();
          if (widget.pushScreen == "User") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserScreen(
                    userModel: widget.userModel,
                  ),
                ));
          }
        },
      ),
    );
  }
}
