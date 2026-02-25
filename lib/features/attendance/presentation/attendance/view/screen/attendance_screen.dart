import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/presentation/design_system/components/attendance_history_card.dart';
import '../../../../../../core/presentation/design_system/model/history_card_model.dart';
import '../../../../../../core/presentation/design_system/theme/helper/snackbar_helper.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';
import '../../../../../../core/presentation/routes/route_names.dart';
import '../../logic/attendance_screen_cubit.dart';
import '../../logic/attendance_screen_state.dart';
import '../widget/attendance_history_empty_state.dart';
import '../widget/clock_in_banner.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceScreenCubit, AttendanceScreenState>(
      listener: (context, state) {
        if (state.apiError != null) {
          SnackBarHelper.showError(context, state.apiError!);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AttendanceScreenCubit>();

        return SafeArea(
          child: Scaffold(
            backgroundColor: context.colors.gray100,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ClockInBanner(
                    attendanceScreenCubit: cubit,
                    attendanceScreenState: state,

                    // الموظف دخل → روح لشاشة الـ Map
                    onClockInPressed: () async {
                      await context.push(RouteNames.clockInMap);
                      cubit.refreshAfterClockIn();
                    },

                    // الموظف خرج → روح لشاشة Clock Out
                    onClockOutPressed: () async {
                      cubit.clockOutAttendance();
                      cubit.refreshAfterClockOut();
                    },

                    // الموظف خد استراحة
                    onBreakPressed: () async {
                      cubit.startAttendanceBreak();
                      cubit.refreshAfterBreak();
                    },

                    // الموظف رجع من الاستراحة
                    onBackToWorkPressed: () async {
                      cubit.endAttendanceBreak();
                      cubit.refreshAfterClockIn();
                    },
                  ),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  sliver: _buildHistorySliver(context, state),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHistorySliver(
      BuildContext context,
      AttendanceScreenState state,
      ) {
    // Loading
    if (state.isLoading) {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    // Empty
    if (state.historyAttendanceCard.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: const AttendanceHistoryEmptyState(),
      );
    }

    // List
    return SliverList.separated(
      itemCount: state.historyAttendanceCard.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final card = state.historyAttendanceCard[index];
        return AttendanceHistoryCard(
          historyCardModel: HistoryCardModel(
            date: card.date,
            headerIcon: Iconsax.calendar_1,
            headerIconColor: context.colors.purple500,
            infoItems: card.infoItems,
          ),
        );
      },
    );
  }
}