import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/widgets/add_trip_header.dart';
import '../../../../../../core/widgets/gradient_button.dart';
import '../../../../../../core/widgets/text_field_widget.dart';
import '../../view_model/add_trip_view_model.dart';


class AddTripScreen extends StatelessWidget {
  const AddTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddTripViewModel(),
      child: Consumer<AddTripViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            backgroundColor: const Color(0xfff3f0f2),
            body: SafeArea(
              child: Column(
                children: [

                  /// HEADER
                  const AddTripHeader(),

                  const SizedBox(height: 20),

                  /// FORM
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: vm.formKey,
                        child: Column(
                          children: [

                            TextFieldWidget(
                              hint: "Destination",
                              icon: Icons.location_on_outlined,
                              controller: vm.destinationController,
                              validator: vm.validateDestination,
                            ),

                            TextFieldWidget(
                              hint: "mm/dd/yyyy",
                              icon: Icons.calendar_today_outlined,
                              controller: vm.dateController,
                              validator: vm.validateDate,
                            ),

                            TextFieldWidget(
                              hint: "--:-- --",
                              icon: Icons.access_time_outlined,
                              controller: vm.timeController,
                              validator: vm.validateTime,
                            ),

                            TextFieldWidget(
                              hint: "Price (EGP)",
                              icon: Icons.attach_money,
                              controller: vm.priceController,
                              keyboardType: TextInputType.number,
                              validator: vm.validatePrice,
                            ),

                            TextFieldWidget(
                              hint: "Number of Seats",
                              icon: Icons.event_seat_outlined,
                              controller: vm.seatsController,
                              keyboardType: TextInputType.number,
                              validator: vm.validateSeats,
                            ),

                            const SizedBox(height: 20),

                            GradientButton(
                              text: "Add Trip",
                              onPressed: vm.submit,
                            ),

                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
