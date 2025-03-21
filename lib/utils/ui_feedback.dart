// lib/utils/ui_feedback.dart
import 'package:flutter/material.dart';

class UIFeedback {
  // Show a styled dialog with message and disappears after duration
  static void showFeedbackDialog(
    BuildContext context, {
    required String message,
    required bool isSuccess,
    Duration displayDuration = const Duration(seconds: 2),
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // Auto dismiss after duration
        Future.delayed(displayDuration, () {
          Navigator.of(context).pop();
        });
        
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.all(20),
          backgroundColor: isSuccess ? Colors.green.shade50 : Colors.red.shade50,
          content: SizedBox(
            width: 300,
            child: Row(
              children: [
                Icon(
                  isSuccess ? Icons.check_circle : Icons.error,
                  color: isSuccess ? Colors.green : Colors.red,
                  size: 36,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSuccess ? Colors.green.shade900 : Colors.red.shade900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  // Show an inline message below a form field
  static Widget inlineMessage(String message, bool isError) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12),
      child: Row(
        children: [
          Icon(
            isError ? Icons.error : Icons.info,
            size: 16,
            color: isError ? Colors.red : Colors.blue,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 14,
                color: isError ? Colors.red : Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Show a styled snackbar
  static void showSnackBar(
    BuildContext context, {
    required String message,
    required bool isSuccess,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}