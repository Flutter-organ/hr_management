import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../core/presentation/design_system/theme/helper/dashed_border_painter.dart';
import '../../../../../../core/presentation/design_system/theme/helper/theme_extention.dart';

class ReceiptUploadWidget extends StatelessWidget {
  final String? filePath;
  final bool isUploading;
  final String? errorMessage;
  final VoidCallback onPickFile;
  final VoidCallback onRemoveFile;

  const ReceiptUploadWidget({
    super.key,
    this.filePath,
    this.isUploading = false,
    this.errorMessage,
    required this.onPickFile,
    required this.onRemoveFile,
  });

  bool get _hasFile => filePath != null && filePath!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Material(
              color: context.colors.purple50,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: isUploading
                    ? null
                    : _hasFile
                    ? null
                    : onPickFile,
                borderRadius: BorderRadius.circular(12),
                splashColor: context.colors.purple200.withOpacity(0.3),
                child: CustomPaint(
                  painter: DashedBorderPainter(
                    color: context.colors.purple300,
                    borderRadius: 12,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: _hasFile ? 180 : 100,
                    alignment: Alignment.center,
                    child: _buildContent(context),
                  ),
                ),
              ),
            ),

            if (_hasFile && !isUploading)
              Positioned(
                top: -8,
                right: -8,
                child: GestureDetector(
                  onTap: onRemoveFile,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: context.colors.error,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
          ],
        ),

        if (errorMessage != null) ...[
          const SizedBox(height: 6),
          Text(
            errorMessage!,
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    if (isUploading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: context.colors.purple500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Uploading...',
            style: context.textTheme.bodySmallFont.copyWith(
              color: context.colors.purple400,
            ),
          ),
        ],
      );
    }

    if (_hasFile) {
      final file = File(filePath!);
      final fileName = filePath!.split('/').last;
      final isImage = ['.jpg', '.jpeg', '.png']
          .any((ext) => fileName.toLowerCase().endsWith(ext));

      if (isImage) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            file,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.document_text,
              size: 40,
              color: context.colors.purple500,
            ),
            const SizedBox(height: 8),
            Text(
              fileName,
              style: context.textTheme.labelSmallFont.copyWith(
                color: context.colors.gray700,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Iconsax.export_1,
          size: 28,
          color: context.colors.purple500,
        ),
        const SizedBox(height: 6),
        Text(
          'Upload Claim Document',
          style: context.textTheme.labelMediumFont.copyWith(
            color: context.colors.purple500,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Format should be in .pdf .jpeg .png less than 5MB',
          style: context.textTheme.labelSmallFont.copyWith(
            color: context.colors.gray400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}