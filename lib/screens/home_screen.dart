import 'package:flutter/material.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: MobileScreen(),
        desktop: DesktopScreen(),
      ),
    );
  }
}

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 270),
          alignment: Alignment.topCenter,
          child: Headers(),
        ),
        AvatarImage(),
        TextBody(),
      ],
    );
  }
}

class DesktopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 330),
          alignment: Alignment.topCenter,
          child: Headers(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBody(),
            AvatarImage(),
          ],
        ),
      ],
    );
  }
}

class TextBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: Responsive.isDesktop(context) ? 60 : 40,
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

class Headers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: 'BLOG',
            onPressed: () async {
              const _url = 'https://medium.com/@dmakwt';

              await canLaunch(_url)
                  ? await launch(_url)
                  : throw 'Could not launch $_url';
            },
          ),
          CustomButton(
            text: 'PROJECTS',
            onPressed: () {},
          ),
          CustomButton(
            text: 'CV',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[700]?.withOpacity(0.8),
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
