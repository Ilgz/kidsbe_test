import 'package:flutter/material.dart';

class ProfileSectionWidget extends StatelessWidget {
  const ProfileSectionWidget(
      {Key? key,
      required this.name,
      required this.onPressed,
      this.trailingWidget})
      : super(key: key);
  final String name;
  final Function onPressed;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onPressed(),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
            color: Color(0xfff3f4f6), borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Color(0xff6f7494),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              trailingWidget ??
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xff6f7494),
                    size: 16,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
