import 'package:flutter/material.dart';

class NeoButton extends StatelessWidget {
  final double ? width;
  final double ? height;
  final Widget child;
  const NeoButton(
      {super.key,
       this.width,
       this.height,
      required this.child,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                     boxShadow: [
                   const BoxShadow(
                      offset:  Offset(3, 3),
                      color: Colors.black,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      offset: const Offset(-3, -3),
                      color: Colors.grey.shade700,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                  ),
                  child:  Center(
                    child: child,
                  ),
                );
  }
}
