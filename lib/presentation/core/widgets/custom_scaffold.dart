import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget body;
  final Widget? floatingActionButton;
  final bool isScrolling;
  final BottomNavigationBar? bottomNavigationBar;
  final List<Widget> actions;
  final String? title;
  final bool showBackButton ;
  const CustomScaffold({
    Key? key,
    required this.body,
    this.floatingActionButton,
    this.padding,
    this.bottomNavigationBar,
    this.actions = const [],
    this.isScrolling = false, this.title, this.showBackButton=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: title==null?null:AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title!,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: showBackButton,
          leading: showBackButton? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_backspace_outlined),
            color: Colors.black,
          ):null,
          actions: actions,
          elevation: 0,
          backgroundColor: Colors.grey[50],
        ),
        body: ScrollConfiguration(
          behavior: NoGlowNoScrollbarScrollBehavior().copyWith(scrollbars: false),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: isScrolling
                ? SingleChildScrollView(

                    child: body,
                  )
                : body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

}
class NoGlowNoScrollbarScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return ClampingScrollPhysics();
  }
}