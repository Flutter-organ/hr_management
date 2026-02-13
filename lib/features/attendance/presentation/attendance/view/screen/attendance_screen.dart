import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_management/core/presentation/design_system/components/header_banner.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/presentation/design_system/components/attendance_history_card.dart';
import '../../../../../../core/presentation/design_system/components/card_header.dart';
import '../../../../../../core/presentation/design_system/components/empty_state_card.dart';
import '../../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../../../../core/presentation/design_system/theme/helper/app_assets.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/attendance_screen_cubit.dart';
import '../../logic/attendance_screen_state.dart';
import '../widget/attendance_history_empty_state.dart';
import '../widget/clock_in_banner.dart';

/// ✅ شاشة الحضور الرئيسية - أول شاشة في الـ Flow
class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceScreenCubit, AttendanceScreenState>(
      listener: (context, state) {
        // يمكن إضافة أي listener actions هنا
      },
      builder: (context, state) {
        final cubit = context.read<AttendanceScreenCubit>();

        return SafeArea(
          child: Scaffold(
            backgroundColor: context.colors.gray100,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ClockInBanner(
                        attendanceScreenCubit: cubit,
                        attendanceScreenState: state,
                        onClockInPressed: () {
                          context.push(RouteNames.clockInMap);
                        },
                      ),
                    ],
                  ),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  sliver: state.isLoading
                      ? const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : state.historyAttendanceCard.isEmpty
                      ? SliverFillRemaining(
                          hasScrollBody: false,
                          child:AttendanceHistoryEmptyState(),
                        )
                      : SliverList.separated(
                          itemBuilder: (context, index) =>
                              AttendanceHistoryCard(
                                historyCardModel: HistoryCardModel(
                                  date: state.historyAttendanceCard[index].date,
                                  headerIcon: Iconsax.calendar_1,
                                  headerIconColor: context.colors.purple500,
                                  infoItems: state
                                      .historyAttendanceCard[index]
                                      .infoItems,
                                ),
                              ),
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 16),
                          itemCount: state.historyAttendanceCard.length,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}