import 'package:advanced_project/app/app_prefs.dart';
import 'package:advanced_project/data/data_source/local_data_source.dart';
import 'package:advanced_project/presentation/resources/assets_manager.dart';
import 'package:advanced_project/presentation/resources/routes_manager.dart';
import 'package:advanced_project/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/di.dart';
import '../../../resources/values_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final LocalDataSource _localDataSource = instance<LocalDataSource>();
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ListView(
        padding:  const EdgeInsets.all(AppPadding.p8),
        children: [
          //change language
          ListTile(
            leading: SvgPicture.asset(ImageAssets.changeLangIc),
            title: Text(AppStrings.changeLanguage, style: Theme.of(context).textTheme.bodyLarge,),
            trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
            onTap: (){
              _changeLanguage();
            },
          ),
          //contact us
          ListTile(
            leading: SvgPicture.asset(ImageAssets.contactUsIc),
            title: Text(AppStrings.contactUs, style: Theme.of(context).textTheme.bodyLarge,),
            trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
            onTap: (){
              _contactUs();
            },
          ),
          //invite friends
          ListTile(
            leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
            title: Text(AppStrings.inviteFriends, style: Theme.of(context).textTheme.bodyLarge,),
            trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
            onTap: (){
              _inviteFriends();
            },
          ),
          //log out
          ListTile(
            leading: SvgPicture.asset(ImageAssets.logoutIc),
            title: Text(AppStrings.logOut, style: Theme.of(context).textTheme.bodyLarge,),
            trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
            onTap: (){
              _logOut();
            },
          ),
        ],
      ),
    );
  }
  _changeLanguage(){
    // will be implemented later
  }

  _contactUs(){
    // task(open any Page using url)
  }

  _inviteFriends(){
    //task(share app name to friends)
  }

  _logOut(){
    // app prefs make that user logged out
    _appPreferences.logout();
    //clear cache
    _localDataSource.clearCache();

    //navigate to login Screen
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
