import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreditCardContainer(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 28,
                  width: 36,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/chip-white.png'),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                    ),
                  ),
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
                )
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'CARD HOLDER',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 16,
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
                            Container(
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/mastercard.png'),
                                      fit: BoxFit.cover),
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Mastercard',
                              style: Theme.of(context).textTheme.overline,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CreditCardContainer extends StatelessWidget {
  final height = 220.0;
  final width = 380.0;
  final Widget? child;
  final Color? secondyColor;
  final Color? primaryColor;
  const CreditCardContainer({this.child, this.secondyColor, this.primaryColor});

  @override
  Widget build(BuildContext context) {
    if (this.child != null) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.primaryColor ?? Color(0xff5EAE73),
              this.secondyColor ?? Color(0xff2D6337),
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
    }
    return Container(
      height: height,
      width: width - 40.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            this.primaryColor ?? Color(0xff5EAE73),
            this.secondyColor ?? Color(0xff2D6337),
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
  }
}
