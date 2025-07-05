import 'package:flutter/material.dart';
import 'package:post_app/data/constants.dart';
import 'package:post_app/data/notifiers.dart';
import 'package:post_app/pages/setting_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text('설정'),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text('화면 모드', style: settingTextStyle),
                  buildSettingSection([
                    buildRadioTile(
                      title: '라이트 모드',
                      selected: !isDarkModeNotifier.value,
                      onTap: () async {
                        isDarkModeNotifier.value = false;
                        final SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setBool(
                          KConstants.themeModeKey,
                          isDarkModeNotifier.value,
                        );
                      },
                    ),
                    buildRadioTile(
                      title: '다크 모드',
                      selected: isDarkModeNotifier.value,
                      onTap: () async {
                        isDarkModeNotifier.value = true;
                        final SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setBool(
                          KConstants.themeModeKey,
                          isDarkModeNotifier.value,
                        );
                      },
                    ),
                  ]),
                  SizedBox(height: 20),
                  Text('타이틀 선택', style: settingTextStyle),
                  buildSettingSection([
                    buildRadioTile(
                      title: '라이트 모드',
                      selected: !isDarkModeNotifier.value,
                      onTap: () async {
                        isDarkModeNotifier.value = false;
                        final SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setBool(
                          KConstants.themeModeKey,
                          isDarkModeNotifier.value,
                        );
                      },
                    ),
                    inputSettingTile(title: '커스텀', context: context),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
