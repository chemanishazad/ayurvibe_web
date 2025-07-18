import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  String inquiryType = 'Appointment';
  bool isSending = false;

  Future<void> sendEmail({
    required String name,
    required String age,
    required String mobile,
    required String email,
    required String type,
    required String message,
  }) async {
    const serviceId = 'service_0du2i3q';
    const templateId = 'template_laoe4hx';
    const userId = 'jCbJ4C1pc_xXhy0Fn';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final Map<String, dynamic> templateParams = {
      'name': name,
      'age': age,
      'mobile': mobile,
      'email': email,
      'inquiry_type': type,
      'message': message,
      'time': DateTime.now().toString(),
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': templateParams,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Message sent successfully!')),
        );
        nameController.clear();
        ageController.clear();
        mobileController.clear();
        emailController.clear();
        messageController.clear();
        setState(() => inquiryType = 'Appointment');
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('❌ Failed to send: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B4332),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(nameController, 'Full Name'),
                _buildTextField(ageController, 'Age', TextInputType.number),
                _buildTextField(
                  mobileController,
                  'Mobile Number',
                  TextInputType.phone,
                ),
                _buildTextField(
                  emailController,
                  'Your Email',
                  TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  value: inquiryType,
                  decoration: _inputDecoration('Inquiry Type'),
                  items:
                      ['Appointment', 'Treatment Info']
                          .map(
                            (label) => DropdownMenuItem(
                              value: label,
                              child: Text(label),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() => inquiryType = value!);
                  },
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: messageController,
                  maxLines: 4,
                  decoration: _inputDecoration('Your Message'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: _handleSendPressed,
                    icon:
                        isSending
                            ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                            : const Icon(Icons.send),
                    label: const Text('Send Message'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: _inputDecoration(label),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: const Color(0xFFF9F9F9),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF1B4332), width: 2),
      ),
    );
  }

  void _handleSendPressed() async {
    if ([
      nameController,
      ageController,
      mobileController,
      emailController,
      messageController,
    ].any((controller) => controller.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ Please fill in all the fields.')),
      );
      return;
    }

    setState(() => isSending = true);
    await sendEmail(
      name: nameController.text,
      age: ageController.text,
      mobile: mobileController.text,
      email: emailController.text,
      type: inquiryType,
      message: messageController.text,
    );
    setState(() => isSending = false);
  }
}
