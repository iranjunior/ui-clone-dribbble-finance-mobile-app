import 'package:cards_control/pages/details_screen/details.dart';
import 'package:cards_control/pages/home_screen/widgets/creditCard.dart';
import 'package:cards_control/widgets/base_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> _animationPrincipalCard;
  late Animation<double> _animationCard1;
  late Animation<double> _animationCard2;
  late Animation<double> _animationScaleCard1;
  late Animation<double> _animationScaleCard2;
  late Animation<double> _offsetXCard1;
  late Animation<double> _offsetXCard2;
  late Animation<double> _offsetYCard1;
  late Animation<double> _offsetYCard2;
  late AnimationController _controllerPrincipalCard;
  late AnimationController _controllerCard1;
  late AnimationController _controllerCard2;

  @override
  void initState() {
    super.initState();
    initiSatusBarColor();
    _controllerCard1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controllerCard2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controllerPrincipalCard = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _offsetXCard1 = Tween(
      begin: 0.0,
      end: 14.0,
    ).animate(_controllerCard1);
    _offsetXCard2 = Tween(
      begin: 0.0,
      end: 20.0,
    ).animate(_controllerCard2);
    _offsetYCard1 = Tween(
      begin: 0.0,
      end: 44.0,
    ).animate(_controllerCard1);
    _offsetYCard2 = Tween(
      begin: 0.0,
      end: 20.0,
    ).animate(_controllerCard2);

    _animationCard1 = Tween(
      begin: -math.pi / 20,
      end: math.pi / 10,
    ).animate(CurvedAnimation(
      parent: _controllerCard1,
      curve: Curves.linear,
    )..addListener(() {
        setState(() {});
      }));
    _animationCard2 = Tween(
      begin: -math.pi / 30,
      end: math.pi / 20,
    ).animate(CurvedAnimation(
      parent: _controllerCard2,
      curve: Curves.linear,
    )..addListener(() {
        setState(() {});
      }))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllerCard1.forward();
        }
      });

    _animationScaleCard1 = Tween(
      begin: 0.65,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: _controllerCard1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
    _animationScaleCard2 = Tween(
      begin: 0.65,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: _controllerCard2, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
    _animationPrincipalCard = Tween(
      end: 0.0,
      begin: 1.0,
    ).animate(_controllerPrincipalCard)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllerCard2.forward();
        }
      });

    _controllerPrincipalCard.forward();
  }

  @override
  void dispose() {
    _controllerCard1.dispose();
    _controllerCard2.dispose();
    _controllerPrincipalCard.dispose();
    super.dispose();
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
              '${AppLocalizations.of(context).greetingUser} Ghaulam',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 8,
            ),
            Text(AppLocalizations.of(context).greeting, style: Theme.of(context).textTheme.subtitle1),
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
                Opacity(
                  opacity: _controllerCard1.value,
                  child: Transform.scale(
                    scale: _animationScaleCard1.value * 0.86,
                    child: Transform.translate(
                      offset: Offset(_offsetXCard1.value, _offsetYCard1.value),
                      child: Transform.rotate(
                        angle: _animationCard1.value,
                        child: CreditCardContainer(),
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: _controllerCard2.value,
                  child: Transform.scale(
                    scale: _animationScaleCard2.value * 0.94,
                    child: Transform.translate(
                      offset: Offset(_offsetXCard2.value, _offsetYCard2.value),
                      child: Transform.rotate(
                        angle: _animationCard2.value,
                        child: CreditCardContainer(),
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: _controllerPrincipalCard.value,
                  child: Transform.translate(
                    offset: Offset(0.0, _animationPrincipalCard.value * 30),
                    child: CreditCard(),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Opacity(
              opacity: _controllerPrincipalCard.value,
              child: Transform.translate(
                offset: Offset(0.0, _animationPrincipalCard.value * 30),
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
                            AppLocalizations.of(context).titleBalance,
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
                            AppLocalizations.of(context).descriptionBalance,
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
                                MaterialPageRoute(
                                    builder: (_) => DetailsPage()),
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
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
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
            ),
          ),
          Flexible(
            flex: 2,
            child: Opacity(
              opacity: _controllerPrincipalCard.value,
              child: Transform.translate(
                offset: Offset(0.0, _animationPrincipalCard.value * 30),
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
                            AppLocalizations.of(context).paymentPrincipal,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            AppLocalizations.of(context).paymentPrincipalDescription,
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
                            AppLocalizations.of(context).paymentSecondary,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            AppLocalizations.of(context).paymentSecondaryDescription,
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
            ),
          ),
        ],
      ),
      hideBottomNavigationBar: false,
    );
  }
}
