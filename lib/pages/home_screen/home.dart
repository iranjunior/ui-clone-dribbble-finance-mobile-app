import 'package:cards_control/pages/details_screen/details.dart';
import 'package:cards_control/pages/home_screen/widgets/creditCard.dart';
import 'package:cards_control/widgets/base_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'dart:math' as math;

import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initiSatusBarColor();
  }

  Future<void> initiSatusBarColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Ghaulam',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 8,
            ),
            Text('Welcome Back', style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
              radius: 24.0,
            ),
          ),
        ],
      ),
      page: Flex(
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
                      child: CreditCardContainer(),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 0.98,
                  child: Transform.translate(
                    offset: const Offset(20, 20),
                    child: Transform.rotate(
                      angle: math.pi / 20,
                      child: CreditCardContainer(),
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => DetailsPage()),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.arrow_down,
                                size: 14,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '5,9%',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
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
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color(0xff000402),
                        ],
                        begin: Alignment(-9.0, 0),
                        end: Alignment(0, 0),
                      ),
                      borderRadius: BorderRadius.circular(40)),
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
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Color(0xff000402),
                        ],
                        begin: Alignment(-9.0, 0),
                        end: Alignment(0, 0),
                      ),
                      borderRadius: BorderRadius.circular(40)),
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
    );
  }
}
