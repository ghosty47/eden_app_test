import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.title,
    this.systemOverlayStyle = SystemUiOverlayStyle.dark,
    this.backgroundColor = Colors.transparent,
    this.onBack,
    this.actions,
    this.bottom = false,
    this.centerTitle = true,
    this.style,
    this.automaticallyImplyLeading = true,
    this.titleWidget,
    this.margin,
    this.preferredSize = const Size.fromHeight(60),
    this.bottomPreferredSize = const Size.fromHeight(4.0),
    this.bottomText,
  }) : super(key: key);

  final String? title;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final bool? bottom;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;
  final Widget? titleWidget;
  @override
  final Size preferredSize;
  final Size bottomPreferredSize;
  final VoidCallback? onBack;
  final EdgeInsets? margin;
  final TextStyle? style;
  final String? bottomText;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: backgroundColor,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: automaticallyImplyLeading
            ? BackButton(
                color: Theme.of(context).appBarTheme.backgroundColor!.withOpacity(0.8),
                onPressed: onBack,
              )
            : null,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        systemOverlayStyle: systemOverlayStyle,
        centerTitle: centerTitle,
        title: centerTitle == true
            ? title == null
                ? const SizedBox()
                : Text(
                    title!,
                    style: style ??
                        TextStyle(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                  )
            : titleWidget ??
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    title!,
                    style: style ??
                        TextStyle(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
        bottom: PreferredSize(
          preferredSize: bottomPreferredSize,
          child: bottom!
              ? Container(
                  width: 335,
                  height: 1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffe1e1e1),
                      width: 1,
                    ),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
