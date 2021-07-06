import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cards_control/models/models.dart';

class CardCreditSelected extends StatefulWidget {
  const CardCreditSelected({
    Key? key,
    required this.currentCreditCard,
  }) : super(key: key);
  final CreditCardModel currentCreditCard;

  @override
  _CardCreditSelectedState createState() => _CardCreditSelectedState();
}

class _CardCreditSelectedState extends State<CardCreditSelected>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  late Animation<double> card1;
  late Animation<double> card2;

  @override
  void initState() {
    super.initState();
    _controllerAnimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    card2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerAnimation,
        curve: Interval(0.0, 0.5),
      ),
    )..addListener(() {
        setState(() {});
      });
    card1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerAnimation,
        curve: Interval(0.51, 1),
      ),
    )..addListener(() {
        setState(() {});
      });
    _controllerAnimation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Transform.scale(
          scale: 0.86,
          child: Transform.translate(
            offset: Offset(
              card1.value * 14.0,
              card1.value * 44.0,
            ),
            child: Transform.rotate(
              angle: card1.value * (math.pi / 8),
              child: CreditCardContainer(),
            ),
          ),
        ),
        Transform.scale(
          scale: 0.94,
          child: Transform.translate(
            offset: Offset(
              card2.value * 20.0,
              card2.value * 20.0,
            ),
            child: Transform.rotate(
              angle: card2.value * (math.pi / 18),
              child: CreditCardContainer(),
            ),
          ),
        ),
        CreditCard(
          creditCard: widget.currentCreditCard,
        ),
      ],
    );
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.creditCard,
  }) : super(key: key);

  final CreditCardModel creditCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CreditCardContainer(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/chip-white.png',
                    fit: BoxFit.cover,
                    height: 28,
                    width: 36,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    this.creditCard.number,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CARD HOLDER',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                this.creditCard.holder,
                                style: Theme.of(context).textTheme.overline,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/mastercard.png',
                                height: 35,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                this.creditCard.brand,
                                style: Theme.of(context).textTheme.overline,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreditCardContainer extends StatelessWidget {
  final height = 220.0;
  final width = 380.0;
  final Widget? child;
  final Color? primaryColor;
  final Color? secondaryColor;

  const CreditCardContainer(
      {this.child, this.primaryColor, this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    if (this.child != null) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.primaryColor ?? Color(0xff5eae73),
              this.secondaryColor ?? Color(0xff2D6337)
            ],
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, -1.0),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        child: this.child,
      );
    } else {
      return Container(
        height: height,
        width: width - 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
          gradient: LinearGradient(
            colors: [
              this.primaryColor ?? Color(0xff5eae73),
              this.secondaryColor ?? Color(0xff2D6337)
            ],
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, -1.0),
          ),
        ),
      );
    }
  }
}
