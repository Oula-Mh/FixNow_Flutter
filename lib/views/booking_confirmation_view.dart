import 'package:flutter/material.dart';

import '../models/booking_confirmation_model.dart';
import '../widgets/widgets_booking/booking_action_buttons.dart';
import '../widgets/widgets_booking/booking_details_card.dart';
import '../widgets/widgets_booking/booking_success_header.dart';

class BookingConfirmationView extends StatelessWidget {
  final BookingConfirmationModel bookingData;

  const BookingConfirmationView({
    super.key,
    this.bookingData = BookingConfirmationModel.dummyData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xffBDC9C9)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BookingSuccessHeader(),

                  const SizedBox(height: 48),

                  BookingDetailsCard(bookingData: bookingData),

                  const SizedBox(height: 48),

                  BookingActionButtons(
                    onViewBooking: () {},
                    onBackToHome: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
