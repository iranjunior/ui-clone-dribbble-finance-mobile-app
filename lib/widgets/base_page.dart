import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

// ignore: must_be_immutable
class BasePage extends StatefulWidget {
  Widget page;
  PreferredSizeWidget? appBar;
  bool? hideBottomNavigationBar;
  bool? invertGradient;

  BasePage({
    Key? key,
    required this.page,
    this.appBar,
    this.hideBottomNavigationBar = true,
    this.invertGradient = false,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  void onTap(index) {
    setState(() {
      _currentIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff479162),
                Color(0xff000402),
              ],
              begin: this.widget.invertGradient == true
                  ? Alignment(2.0, -2.0)
                  : Alignment(-2.0, -2.0),
              end: Alignment(0, -0.8),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: this.widget.appBar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: this.widget.page,
          ),
          bottomNavigationBar: this.widget.hideBottomNavigationBar == null ||
                  this.widget.hideBottomNavigationBar == false
              ? BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(UniconsLine.estate),
                      label: 'home',
                      activeIcon: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff5eae73), Color(0xff2D6337)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            shape: BoxShape.circle),
                        child: const Center(child: Icon(CupertinoIcons.house)),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(UniconsLine.bolt),
                      label: 'balance',
                      activeIcon: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff5eae73), Color(0xff2D6337)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            shape: BoxShape.circle),
                        child:
                            const Center(child: Icon(CupertinoIcons.bolt_fill)),
                      ),
                    ),
                    BottomNavigationBarItem(
                        icon: const Icon(UniconsLine.user),
                        label: 'account',
                        activeIcon: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff5eae73), Color(0xff2D6337)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              shape: BoxShape.circle),
                          child: const Center(child: Icon(UniconsLine.user)),
                        )),
                    BottomNavigationBarItem(
                      icon: const Icon(CupertinoIcons.bell),
                      label: 'notifications',
                      activeIcon: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff5eae73), Color(0xff2D6337)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            shape: BoxShape.circle),
                        child:
                            const Center(child: Icon(CupertinoIcons.bell_fill)),
                      ),
                    ),
                  ],
                  currentIndex: _currentIndex,
                  backgroundColor: Color(0xff000402),
                  elevation: 0.0,
                  onTap: onTap,
                  showSelectedLabels: false,
                  selectedIconTheme:
                      IconThemeData(color: Colors.white, size: 32),
                  unselectedIconTheme:
                      IconThemeData(color: Color(0xff555455), size: 32),
                )
              : null,
        )
      ],
    );
  }
}
