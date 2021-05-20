import 'package:flutter/material.dart';
import 'package:portfolio/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(mobile: MobileScreen(), desktop: DesktopScreen()),
    );
  }
}

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AvatarImage(),
        TextBody(),
      ],
    );
  }
}

class DesktopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextBody(),
        AvatarImage(),
      ],
    );
  }
}

class TextBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: Responsive.isDesktop(context) ? 60 : 30,
      color: Colors.grey[700],
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "Hi all, I'm Dhari ",
                style: textStyle,
              ),
              SelectableText(
                '👋',
                style: textStyle,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                'I ',
                style: textStyle,
              ),
              Container(
                color: const Color(0xffF7EFC9).withOpacity(0.8),
                child: SelectableText(
                  'build software.',
                  style: textStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isDesktop(context) ? 230 : 200,
      width: Responsive.isDesktop(context) ? 230 : 200,
      margin: Responsive.isDesktop(context)
          ? const EdgeInsets.only(left: 200)
          : const EdgeInsets.only(bottom: 150),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/images/profile.png'),
      ),
    );
  }
}
