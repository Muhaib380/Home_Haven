import 'package:go_router/go_router.dart';
import 'package:home_haven/screens/Splash/splashScreen.dart';
import 'package:home_haven/screens/account/my_account_screen.dart';
import 'package:home_haven/screens/auth/login/register/registerScreen.dart';
import 'package:home_haven/screens/home/product_details_screen.dart';
import 'package:home_haven/screens/myCart/my_cartScreen.dart';

import '../screens/auth/login/loginScreen.dart';
import '../screens/home/homeScreen.dart';
import '../screens/onbording/onbodring/onboardingScreen.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/splash',

    routes: [

      // =========================
      // Splash
      // =========================
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const Splashscreen();
        },
      ),

      // =========================
      // Onboarding
      // =========================
      GoRoute(
        path: '/onboarding',
        builder: (context, state) {
          return const OnboardingScreen();
        },
      ),

      // =========================
      // Login
      // =========================
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      // =========================
      // Register
      // =========================
      GoRoute(
        path: '/register',
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),

      // =========================
      // Home
      // =========================
      GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomeScreen();
        },
      ),

      // =========================
      // Product Details
      // =========================
      GoRoute(
        path: '/product_details',
        builder: (context, state) {

          final product = state.extra as Map<String, dynamic>;

          return ProductDetailsScreen(
            imagePath: product['imagePath'],
            productName: product['productName'],
            price: product['price'],
            oldPrice: product['oldPrice'],
            discount: product['discount'],
            rating: product['rating'],
            reviews: product['reviews'],
          );
        },
      ),

      // =========================
      // My Cart
      // =========================
      GoRoute(
        path: '/my-cart',
        builder: (context, state) {
          return const MyCartScreen();
        },
      ),

      // =========================
      // My Account
      // =========================
      GoRoute(
        path: '/my-account',
        builder: (context, state) {
          return const MyAccountScreen();
        },
      ),
    ],
  );
}