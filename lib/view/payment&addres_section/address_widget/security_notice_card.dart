import 'package:flutter/material.dart';
import 'package:flutter_task04_team_ecommerce_getx_mvc_api_adv/core/constants/app_colors.dart';

class SecurityNoticeCard extends StatelessWidget {
  const SecurityNoticeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF181515), 
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          const Icon(
            Icons.lock_outline_rounded,
            color:AppColors.primary,
            size: 24,
          ),
          const SizedBox(width: 12),
          
         
          const Expanded(
            child: Text(
              'Transactions are secured with end-to-end 256–bit encryption. Atelier does not store plaintext card verification codes.',
              style: TextStyle(
                color: Color(0xFFB09E99),
                fontSize: 13,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}