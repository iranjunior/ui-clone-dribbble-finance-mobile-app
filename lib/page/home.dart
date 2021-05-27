import 'package:cards_control/page/widgets/cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:unicons/unicons.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  @override
  void initState() {
    super.initState();
    initStatusBarColor();
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> initStatusBarColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
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
              begin: Alignment(-2.0, -2.0),
              end: Alignment(0, -0.8),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            elevation: 0,
            title: Column(
              children: [
                Text(
                  'Hi Ghulam',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'),
                  radius: 24.0,
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 3,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Transform.scale(
                        scale: 0.88,
                        child: Transform.translate(
                          offset: const Offset(14, 44),
                          child: Transform.rotate(
                            angle: math.pi / 10,
                            child: CreditCardContainer(
                              primaryColor: Color(0xff15371D),
                              secondyColor: Color(0xff0D2A14),
                            ),
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 0.98,
                        child: Transform.translate(
                          offset: const Offset(20, 20),
                          child: Transform.rotate(
                            angle: math.pi / 20,
                            child: CreditCardContainer(
                              secondyColor: Color(0xff15371D),
                            ),
                          ),
                        ),
                      ),
                      CreditCard(),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Balance',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              '\$ 92,510',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Upcoming payments',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff5EAE73),
                                      Color(0xff2D6337),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    CupertinoIcons.arrow_down,
                                    size: 14.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '5,9%',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 180,
                        width: 160,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Color(0xff000402),
                          ], begin: Alignment(-9, 0), end: Alignment(0, 0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              UniconsLine.bag,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Salary',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Belong Interactive',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '+\$2000',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 160,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Color(0xff000402),
                          ], begin: Alignment(-9, 0), end: Alignment(0, 0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              UniconsLine.paypal,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Paypal',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Freelance payment',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '\$45:00',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(UniconsLine.estate),
                  label: 'home',
                  activeIcon: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff5EAE73),
                            Color(0xff2D6337),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle),
                    padding: const EdgeInsets.all(16),
                    child: const Center(child: Icon(CupertinoIcons.house)),
                  )),
              BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.bolt),
                  label: 'balance',
                  activeIcon: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff5EAE73),
                            Color(0xff2D6337),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle),
                    padding: const EdgeInsets.all(16),
                    child: const Center(child: Icon(CupertinoIcons.bolt_fill)),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(UniconsLine.user),
                  label: 'account',
                  activeIcon: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff5EAE73),
                            Color(0xff2D6337),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        shape: BoxShape.circle),
                    padding: const EdgeInsets.all(16),
                    child: const Center(child: Icon(UniconsLine.user)),
                  )),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bell),
                label: 'notifications',
                activeIcon: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff5EAE73),
                          Color(0xff2D6337),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      shape: BoxShape.circle),
                  padding: const EdgeInsets.all(16),
                  child: const Center(
                    child: Icon(CupertinoIcons.bell_fill),
                  ),
                ),
              ),
            ],
            currentIndex: _currentIndex,
            backgroundColor: Color(0xff000402),
            elevation: 0.0,
            onTap: onTap,
            showSelectedLabels: false,
            selectedIconTheme: IconThemeData(color: Colors.white, size: 32),
            unselectedIconTheme:
                IconThemeData(color: Color(0xff555455), size: 32),
          ),
        ),
      ],
    );
  }
}
