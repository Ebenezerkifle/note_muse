// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:note_muse/view/01_onboarding_view/signin_view.dart' as _i3;
import 'package:note_muse/view/01_onboarding_view/signup_view.dart' as _i4;
import 'package:note_muse/view/02_home_view/home_view.dart' as _i2;
import 'package:note_muse/view/03_workspace_view/edit_workspace_view.dart'
    as _i1;
import 'package:note_muse/view/03_workspace_view/workspace_view.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    EditWorkspaceRoute.name: (routeData) {
      final args = routeData.argsAs<EditWorkspaceRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.EditWorkspaceView(
          key: args.key,
          title: args.title,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignInView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
      );
    },
    WorkspaceRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.WorkspaceView(),
      );
    },
  };
}

/// generated route for
/// [_i1.EditWorkspaceView]
class EditWorkspaceRoute extends _i6.PageRouteInfo<EditWorkspaceRouteArgs> {
  EditWorkspaceRoute({
    _i7.Key? key,
    required String title,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          EditWorkspaceRoute.name,
          args: EditWorkspaceRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'EditWorkspaceRoute';

  static const _i6.PageInfo<EditWorkspaceRouteArgs> page =
      _i6.PageInfo<EditWorkspaceRouteArgs>(name);
}

class EditWorkspaceRouteArgs {
  const EditWorkspaceRouteArgs({
    this.key,
    required this.title,
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'EditWorkspaceRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WorkspaceView]
class WorkspaceRoute extends _i6.PageRouteInfo<void> {
  const WorkspaceRoute({List<_i6.PageRouteInfo>? children})
      : super(
          WorkspaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkspaceRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
