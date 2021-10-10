import 'package:flutter/material.dart';

class TpTile extends StatelessWidget {
  const TpTile(this.icon, this.title, {this.onTap, this.radius, Key? key})
      : super(key: key);

  final Widget icon;
  final Widget title;
  final Function()? onTap;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: () {
            onTap?.call();
          },
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10.0)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 5.0,
                ),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: icon,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: title,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
