import 'package:art_space_artist/core/router/animation_transition.dart';
import 'package:art_space_artist/features/auction/data/models/get_auction_details_response.dart';
import 'package:art_space_artist/features/auction/presentation/view_model/auction_cubit.dart';
import 'package:art_space_artist/features/auction/presentation/views/all_auctions_screen.dart';
import 'package:art_space_artist/features/auction/presentation/views/create_auction_screen.dart';
import 'package:art_space_artist/features/auction/presentation/views/view_auction_details_screen.dart';
import 'package:art_space_artist/features/auction/presentation/views/widgets/edit_auction_screen.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/view_model/forget_password_cubit.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/forget_password_screen.dart';
import 'package:art_space_artist/features/auth/forgetPassword/presentation/views/verify_email_otp_screen.dart';
import 'package:art_space_artist/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:art_space_artist/features/auth/login/presentation/views/login_screen.dart';
import 'package:art_space_artist/features/auth/register/presentation/view_model/register_cubit.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/register_screen.dart';
import 'package:art_space_artist/features/auth/register/presentation/views/verify_email_screen.dart';
import 'package:art_space_artist/features/events/data/model/get_event_details_response.dart';
import 'package:art_space_artist/features/events/presentation/view_model/event_cubit.dart';
import 'package:art_space_artist/features/events/presentation/views/create_event_screen.dart';
import 'package:art_space_artist/features/events/presentation/views/event_details_screen.dart';
import 'package:art_space_artist/features/home/presentation/views/home_screen.dart';
import 'package:art_space_artist/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:art_space_artist/features/products/presentation/view_model/product_cubit.dart';
import 'package:art_space_artist/features/products/presentation/views/add_product.dart';
import 'package:art_space_artist/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/forgetPassword/presentation/views/create_new_password.dart';
import '../../features/events/presentation/views/edit_event_screen.dart';
import '../../features/products/data/models/get_product_details_response.dart';
import '../../features/products/presentation/views/edit_product_screen.dart';
import '../../features/products/presentation/views/view_product_details.dart';
import '../../features/products/presentation/views/widgets/edit_product_images.dart';
import '../../features/profile/presentation/views/change_password/change_password.dart';
import '../../features/profile/presentation/views/edit_profile/edit_profile_screen.dart';
import '../di/dependency_injection.dart';
import 'app_router_names.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.onBoarding:
        return SlideRight(page: const OnBoardingScreen());
      // Auth
      case AppRouterNames.login:
        return SlideRight(
            page: BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen()));
      case AppRouterNames.register:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterScreen(),
        ));
      case AppRouterNames.verifyEmail:
        return SlideRight(
            page: BlocProvider.value(
          value: getIt<RegisterCubit>(),
          child: VerifyEmailScreen(email: settings.arguments as String),
        ));
      case AppRouterNames.forgetPassword:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPasswordScreen(),
        ));
      case AppRouterNames.verifyEmailOPT:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: VerifyEmailOTPScreen(email: settings.arguments as String),
        ));
      case AppRouterNames.createNewPassword:
        return SlideRight(
            page: BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: CreateNewPassword(email: settings.arguments as String),
        ));

      // Home
      case AppRouterNames.home:
        return SlideRight(page: const HomeScreen());


        //Profile
      case AppRouterNames.editProfile:
        return SlideRight(
            page: BlocProvider.value(
                value: getIt<ProfileCubit>()..emitGetProfileStates(),
                child: const EditProfileScreen()));
      case AppRouterNames.changePassword:
        return SlideRight(
            page: BlocProvider.value(
                value: getIt<ProfileCubit>(),
                child: const ChangePasswordScreen()));


        //Product
      case AppRouterNames.createProduct:
        return SlideRight(
          page: BlocProvider(
            create: (context) => getIt<ProductsCubit>()
              ..emitGetCategories()
              ..emitGetStyles()
              ..emitGetSubjects(),
            child: CreateProductScreen(eventId: settings.arguments as String?),
          ),
        );
      case AppRouterNames.editProduct:
        return SlideRight(
          page: BlocProvider<ProductsCubit>.value(
            value: getIt<ProductsCubit>(),
            child: EditProductScreen(
              productDetails: settings.arguments as ProductDetails,
            ),
          ),
        );
      case AppRouterNames.editProductImages:
        return SlideRight(
          page: EditProductImages(
            coverImage: settings.arguments as String,
          ),
        );
      case AppRouterNames.viewProductDetails:
        return SlideRight(
          page: BlocProvider<ProductsCubit>(
            create: (context) => getIt<ProductsCubit>()
              ..emitGetProductDetails(productId: settings.arguments as String),
            child: const ViewProductDetails(),
          ),
        );


      // event
      case AppRouterNames.eventDetails:
        return SlideRight(
          page: BlocProvider<EventCubit>(
            create: (context) => getIt<EventCubit>()
              ..emitGetEventDetails(eventId: settings.arguments as String),
            child: const EventDetailsScreen(),
          ),
        );
      case AppRouterNames.createEvent:
        return SlideRight(
            page: BlocProvider(
                create: (context) => getIt<EventCubit>(),
                child: const CreateEvent()));
      case AppRouterNames.editEvent:
        return SlideRight(
            page: BlocProvider(
                create: (context) => getIt<EventCubit>(),
                child:  EditEventScreen(eventInfo: settings.arguments as EventInfo,)));


      // Auction
      case AppRouterNames.createAuction:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuctionCubit>(
            create: (context) => getIt<AuctionCubit>()
              ..emitGetCategories()
              ..emitGetStyles()
              ..emitGetSubjects(),
            child: const CreateAuctionScreen(),
          ),
        );
      case AppRouterNames.allAuctions:
        return SlideRight(
          page: BlocProvider<AuctionCubit>(
            create: (context) => getIt<AuctionCubit>()..emitGetAllAuctions(),
            child: const AllAuctionsScreen(),
          ),
        );
      case AppRouterNames.viewAuctionDetails:
        return SlideRight(
          page: BlocProvider<AuctionCubit>(
            create: (context) => getIt<AuctionCubit>()..emitGetDetailsAuction(auctionId: settings.arguments as String),
            child:  const ViewAuctionDetailsScreen(),
          ),
        );
      case AppRouterNames.editAuction:
          return SlideRight(
              page: BlocProvider<AuctionCubit>.value(
                value:  getIt<AuctionCubit>(),
                child:  EditAuctionScreen(
                  auctionInfo: settings.arguments as AuctionInfo,
                ),
              ));

      default:
        return unDefinedRoute(settings);
    }
  }

  static Route<dynamic> unDefinedRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Not Found Route"),
        ),
        body: Center(
          child: Text("Not Found Route ${settings.name}"),
        ),
      ),
    );
  }
}
