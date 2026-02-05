import 'package:flutter/material.dart';

import 'exposed_controls/exposed_controls.dart';
import 'profile_scene_collection/profile_scene_collection.dart';
import 'scene_buttons/scene_buttons.dart';
import 'scene_preview/scene_preview.dart';
import 'studio_mode_checkbox.dart';
import 'studio_mode_transition_button.dart';
import 'transition_controls.dart';

class DashboardHorizontalSection extends StatelessWidget {
  const DashboardHorizontalSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileSceneCollection(),
              ExposedControls(),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StudioModeCheckbox(),
                  SizedBox(width: 24.0),
                ],
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 32.0,
                    left: 18.0,
                    right: 18.0,
                  ),
                  child: SceneButtons(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 24.0),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StudioModeTransitionButton(),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TransitionControls(),
                  SizedBox(width: 24.0),
                ],
              ),
              SizedBox(height: 24.0),
              ScenePreview(),
            ],
          ),
        ),
      ],
    );
  }
}
