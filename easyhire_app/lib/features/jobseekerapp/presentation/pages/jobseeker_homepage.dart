import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class JobseekerHomepage extends StatelessWidget {
  const JobseekerHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(child: Text("Jobseeker Homepage")),
    );
  }
}
