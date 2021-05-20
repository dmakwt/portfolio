import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70, bottom: 150, right: 20, left: 20),
            alignment: Alignment.topCenter,
            child: Headers(),
          ),
          AvatarImage(),
          TextBody(),
          Container(
            padding: EdgeInsets.only(top: 100),
            alignment: Alignment.bottomCenter,
            child: Bottom(),
          ),
        ],
      ),
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
        Container(
          padding: EdgeInsets.only(top: 250),
          alignment: Alignment.bottomCenter,
          child: Bottom(),
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
          : const EdgeInsets.only(bottom: 130),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: 'BLOG',
          onPressed: () {
            runUrl('https://medium.com/@dmakwt');
          },
        ),
        CustomButton(
          text: 'PROJECTS',
          onPressed: () {
            Modular.to.pushReplacementNamed('/projects');
          },
        ),
        CustomButton(
          text: 'CV',
          onPressed: () {},
        ),
      ],
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
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.symmetric(horizontal: 30)
          : EdgeInsets.symmetric(horizontal: 5),
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

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 23,
      color: Colors.grey[700],
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(45.0),
          child: SelectableText(
            'I have experience in web and mobile app developments. I spend a lot of time building and teaching how to build apps.',
            style: textStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonIcon(
              icon: FontAwesomeIcons.twitter,
              onPressed: () {
                runUrl('https://twitter.com/DMA_Kw');
              },
            ),
            SizedBox(width: 70),
            CustomButtonIcon(
              icon: FontAwesomeIcons.github,
              onPressed: () {
                runUrl('https://github.com/dmakwt');
              },
            ),
          ],
        )
      ],
    );
  }
}

class CustomButtonIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CustomButtonIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      color: Colors.grey[600],
      icon: FaIcon(
        icon,
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}

void runUrl(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
