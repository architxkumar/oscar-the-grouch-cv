import 'package:cv/text_style.dart';
import 'package:cv/widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

final logger = Logger();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const blocks = [
      TitleBlock(),
      AddressBlock(),
      SkillBlock(),
      EducationBlock(),
      WorkExperienceBlock(),
      ContactBlock(),
    ];
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 56, horizontal: 104),
        itemCount: 6,
        itemBuilder: (context, index) {
          return blocks[index];
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    );
  }
}

class TitleBlock extends StatelessWidget {
  const TitleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      '🗑️ OSCAR THE GROUCH 🗑️',
      style: titleStyle,
    );
  }
}

class AddressBlock extends StatelessWidget {
  const AddressBlock({super.key});

  Future<void> _launchEmail(BuildContext context) async {
    final mailtoLink = Mailto(to: ['beat_it@trashcan.grr']);
    try {
      await launchUrl(Uri.parse(mailtoLink.toString()));
      logger.i('Redirection to email client success');
    } catch (e, s) {
      logger.e('Redirection to email client failed', error: e, stackTrace: s);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the email client.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          'Professional Trash Enthusiast & Grump Specialist',
          style: sectionTitleStyle,
        ),
        SizedBox(height: 16),
        SelectableText(
          '123 Trash Can Lane\nSesame Street, NY 10001\n(555) SCRAM-NOW',
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Text(
              'beat_it@trashcan.grr',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onTap: () async {
              await _launchEmail(context);
            },
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SelectableText(
          '"I LOVE being miserable! It makes me so HAPPY!"',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

class SkillBlock extends StatelessWidget {
  const SkillBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.0,
      children: [
        SelectableText('💀 GROUCHY SKILLS 💀', style: sectionTitleStyle),
        SelectableText(
          'Complaining, Arguing, Sardine & Anchovy Cuisine, Advanced Messiness, Professional Pessimism, Trash Collection & Curation, Worm Ranching, Grouch Philosophy, Door Slamming, Being Disagreeable',
        ),
      ],
    );
  }
}

class EducationBlock extends StatelessWidget {
  const EducationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectableText(
          '🎓 EDUCATION (UGH!)',
          style: sectionTitleStyle,
        ),
        SizedBox(
          height: 16,
        ),
        SelectableText(
          'University of Misery, Grouchland - Bachelor of Grumpiness\nFall 19XX to Spring 19XX (Had to finish, unfortunately)',
        ),
        SizedBox(
          height: 8,
        ),
        SelectableText('Exciting things I did at university:'),
        SizedBox(
          height: 8,
        ),
        BulletPoint('Failed every happiness course on purpose'),
        BulletPoint('Started the "Anti-Sunshine Club"'),
        BulletPoint('Wrote my thesis on "Why Everything is TERRIBLE!"'),
        BulletPoint(
          'Got kicked out of the library for being too loud (SUCCESS!)',
        ),
      ],
    );
  }
}

class WorkExperienceBlock extends StatelessWidget {
  const WorkExperienceBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '💼 TERRIBLE WORK EXPERIENCE 💼',
          style: sectionTitleStyle,
        ),
        SizedBox(height: 16),
        IndividualWorkExperienceBlock(
          title:
              'Sesame Street Trash Management, Sesame Street - Chief Grouch Officer',
          time: '19XX to Present (Still stuck here, BLECH!)',
          bulletPoints: [
            BulletPoint('Failed every happiness course on purpose'),
            BulletPoint('Started the "Anti-Sunshine Club"'),
            BulletPoint('Wrote my thesis on "Why Everything is TERRIBLE!"'),
            BulletPoint(
              'Got kicked out of the library for being too loud (SUCCESS!)',
            ),
          ],
          gainedSkills:
              'Advanced Grumpiness, Trash Sorting, Worm Management, Cookie Monster Tolerance',
        ),
        SizedBox(
          height: 12.0,
        ),
        IndividualWorkExperienceBlock(
          title:
              'Department of Awful Things, Grouchland - Senior Misery Consultant',
          time: '19XX to 19XX (Left because they were too nice)',
          bulletPoints: [
            BulletPoint('Designed the most uncomfortable furniture ever made'),
            BulletPoint('Created 50+ new ways to be annoyed daily'),
            BulletPoint('Established the "Everything is Yucky" initiative'),
            BulletPoint('Reduced workplace happiness to record lows'),
            BulletPoint('Won "Grouchiest Employee" award 5 years running'),
          ],
          gainedSkills:
              'Professional Pessimism, Advanced Whining, Trash Can Architecture',
        ),
      ],
    );
  }
}

class IndividualWorkExperienceBlock extends StatelessWidget {
  final String title;
  final String time;
  final List<BulletPoint> bulletPoints;
  final String gainedSkills;

  const IndividualWorkExperienceBlock({
    super.key,
    required this.title,
    required this.time,
    required this.bulletPoints,
    required this.gainedSkills,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SelectableText(time),
        SizedBox(height: 8),
        ...bulletPoints,
        SizedBox(height: 8),
        SelectableText('Gained Skills: $gainedSkills'),
      ],
    );
  }
}

class ContactBlock extends StatelessWidget {
  const ContactBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          '🌐 ACROSS THE INTERNET (YUCK!)',
          style: sectionTitleStyle,
        ),
        SelectableText(
          '''LinkedIn: Don't have one (GOOD!)\nGitHub: @TrashCode_IsWorst\nPortfolio: Why would I show off? SCRAM!''',
        ),
      ],
    );
  }
}
