import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard();

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
                    '5505 0671 4553 2642',
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
                                'Ghulam',
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
                                'Mastercard',
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
