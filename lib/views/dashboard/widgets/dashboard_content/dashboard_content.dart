import 'package:flutter/material.dart';

import '../../../../shared/general/base/divider.dart';
import '../../../../shared/general/custom_sliver_list.dart';
import '../../../../shared/general/hive_builder.dart';
import '../../../../shared/general/responsive_widget_wrapper.dart';
import '../../../../types/enums/hive_keys.dart';
import '../../../../types/enums/settings_keys.dart';
import '../obs_widgets/obs_widgets.dart';
import '../obs_widgets/obs_widgets_mobile.dart';
import 'dashboard_horizontal_section.dart';
import 'exposed_controls/exposed_controls.dart';
import 'profile_scene_collection/profile_scene_collection.dart';
import 'scene_buttons/scene_buttons.dart';
import 'scene_content/scene_content.dart';
import 'scene_content/scene_content_mobile.dart';
import 'scene_preview/scene_preview.dart';
import 'studio_mode_checkbox.dart';
import 'studio_mode_transition_button.dart';
import 'transition_controls.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSliverList(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 24.0),
          child: Column(
            children: [
              ResponsiveWidgetWrapper(
                mobileWidget: const _DashboardVerticalTopSection(),
                tabletWidget: HiveBuilder<dynamic>(
                  hiveKey: HiveKeys.Settings,
                  rebuildKeys: const [SettingsKeys.TabletHorizontalLayout],
                  builder: (context, settingsBox, child) =>
                      settingsBox.get(
                                SettingsKeys.TabletHorizontalLayout.name,
                                defaultValue: false,
                              )
                          ? const DashboardHorizontalSection()
                          : const _DashboardVerticalTopSection(),
                ),
              ),
              const SizedBox(height: 24.0),
              ResponsiveWidgetWrapper(
                mobileWidget: SceneContentMobile(),
                tabletWidget: SceneContent(),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Widgets',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const ResponsiveWidgetWrapper(
          mobileWidget: Column(
            children: [
              SizedBox(height: 8.0),
              OBSWidgetsMobile(),
            ],
          ),
          tabletWidget: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: BaseDivider(),
              ),
              OBSWidgets(),
            ],
          ),
        ),
      ],
    );
  }
}

class _DashboardVerticalTopSection extends StatelessWidget {
  const _DashboardVerticalTopSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
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
        SizedBox(height: 24.0),
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
    );
  }
}
