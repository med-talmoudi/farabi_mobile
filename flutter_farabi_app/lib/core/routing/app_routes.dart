import 'package:flutter_farabi_app/core/networking/card_network.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/phone_Input_field/phone_input_field_cubit.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/reset_pwd/reset_password_cubit.dart';
import 'package:flutter_farabi_app/features/auth/presentation/views/login_screen.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/complete_register/create_account_cubit.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/verify_otp/opt_verification_cubit.dart';
import 'package:flutter_farabi_app/features/auth/presentation/bloc/pre_register/phone_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_farabi_app/features/card/data/repository/card_repository.dart';
import 'package:flutter_farabi_app/features/card/presentation/bloc/create_e_card/create_e_card_cubit.dart';

import 'package:flutter_farabi_app/features/card/presentation/screens/card_home.dart';

import 'package:flutter_farabi_app/features/jackpot/presentation/bloc/cubit/get_points_cubit.dart';


import 'package:flutter_farabi_app/features/jackpot/presentation/view/jackpot_home.dart';
import 'package:flutter_farabi_app/features/profile/presentation/view/profile_home.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/auth/presentation/bloc/authorization/authorization_cubit.dart';
import '../../features/auth/presentation/bloc/resend_otp/resend_otp_cubit.dart';
import '../../features/auth/presentation/bloc/user_login/user_login_cubit.dart';
import '../../features/auth/presentation/views/reset_password_screen.dart';
import '../../features/card/presentation/bloc/card_details/card_details_cubit.dart';

import '../../features/card/presentation/bloc/get_username/get_username_cubit.dart';
import '../../features/card/presentation/bloc/insert_card/insert_card_cubit.dart';
import '../../features/card/presentation/screens/add_ecard.dart';

import '../../features/card/presentation/screens/insert_card.dart';
import '../../features/onboarding/splash_screen.dart';
import '../../features/onboarding/welcome_screen.dart';

import '../../features/auth/presentation/views/gender_selection.dart';
import '../../features/auth/presentation/views/otp_verification.dart';
import '../../features/auth/presentation/views/account_information.dart';
import '../../features/auth/presentation/views/date_of_birth.dart';

import '../../features/sponsorship/presentation/sponsorship_home.dart';

import '../networking/auth_network.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/presentation/views/phone_number_input.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings, String initialRoute) {
    switch (settings.name) {
      case '/splach':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case '/welcome':
        return PageTransition(
          child: const WelcomeScreen(),
          duration: const Duration(milliseconds: 0),
          type: PageTransitionType.fade,
        );

      case '/accountInformation':
        return PageTransition(
          child: const AccountInformation(),
          duration: const Duration(milliseconds: 0),
          type: PageTransitionType.fade,
        );

      case '/datepicker':
        return PageTransition(
          child: const DateOfBirth(),
          duration: const Duration(milliseconds: 0),
          type: PageTransitionType.fade,
        );

      case '/login':
        return PageTransition(
            type: PageTransitionType.fade,
            child: BlocProvider(
              create: (context) => UserLoginCubit(AuthApi()),
              child: const LoginScreen(),
            ));

      case '/reset':
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (context) => ResetPasswordCubit(AuthRepository(AuthApi())),
            child: const ResetPasswordScreen(),
          ),
        );

      case '/chooseGender':
        return PageTransition(
          duration: const Duration(milliseconds: 0),
          type: PageTransitionType.fade,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CreateAccountCubit(AuthRepository(AuthApi())),
              ),
            ],
            child: const GenderSelection(),
          ),
        );
         case '/sponsorship_home':
        return PageTransition(
          duration: const Duration(milliseconds: 0),
          type: PageTransitionType.fade,
          child: const SponsorshipHome(),
        );

          case '/profile_home':
        return PageTransition(
          duration: const Duration(milliseconds: 0),
          type: PageTransitionType.fade,
          child: const ProfileHome(),
        );

      case '/register':
        return PageTransition(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 0),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      PhoneRegisterCubit(AuthRepository(AuthApi())),
                ),
                BlocProvider(
                  create: (context) => PhoneInputFieldCubit(),
                ),
              ],
              child: const PhoneNumberInput(),
            ),
            settings: settings);

      case '/otp':
        return PageTransition(
            type: PageTransitionType.fade,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 300),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (BuildContext context) =>
                      OptVerificationCubit(AuthRepository(AuthApi())),
                ),
                BlocProvider(
                  create: (BuildContext context) =>
                      ResendOtpCubit(AuthRepository(AuthApi())),
                ),
              ],
              child: const OtpVerification(),
            ),
            settings: settings);

      case '/card':
        return PageTransition(
          type: PageTransitionType.fade,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => CardDetailsCubit(CardApi()),
              ),
              BlocProvider(
                create: (BuildContext context) => AuthorizationCubit(AuthApi()),
              ),
            ],
            child: const CardHome(),
          ),
        );

      case '/jackpot_home':
        return PageTransition(
            type: PageTransitionType.fade,
           duration: const Duration(milliseconds: 300),
            child: BlocProvider(
              create: (context) => GetPointsCubit(CardApi()),
              child: const JackpotHome(),
            ));

      case '/add_card':
        return PageTransition(
            type: PageTransitionType.fade,
            child: BlocProvider(
              create: (context) => CreateECardCubit(CardRepository(CardApi())),
              child: const AddCard(),
            ));

      case '/card_home':
        return PageTransition(
          type: PageTransitionType.fade,
           duration: const Duration(milliseconds: 300),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => CardDetailsCubit(CardApi()),
              ),
              BlocProvider(
                create: (BuildContext context) => AuthorizationCubit(AuthApi()),
              ),
            ],
            child: const CardHome(),
          ),
        );

      case '/insert_card':
        return PageTransition(
            type: PageTransitionType.fade,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      InsertCardCubit(CardRepository(CardApi())),
                ),
                BlocProvider(
                  create: (context) => GetUsernameCubit(CardApi()),
                ),
              ],
              child: const InsertCard(),
            ));

      default:
        return null;
    }
  }
}
