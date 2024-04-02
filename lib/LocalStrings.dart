import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // <-- English Language --> //
        'en_US': {
          'lan': 'EN',
          'title': 'Choose Your Language',
          'search': 'Search in ARBE',
          'shop_now': 'Shop now',
          'categories': 'Categories',
          'see_all': 'See all',
          'new_arrival': 'New Arrival',
          'add_to_cart': 'Add to Cart',
          'popular': 'Popular',
          'search_here': 'Search here',

          // <-- Profile screen list strings --> //
          'your_address': 'Your Address',
          'all_category': 'All Category',
          'notification': 'Notification',
          'chats': 'Chats',
          'payment_methods': 'Payment Methods',
          'change_password': 'Change Password',
          'settings': 'Settings',
          'teams_condition': 'Teams & Condition',
          'privacy_policy_title': 'Privacy Policy',
          'faq': 'FAQ',
          'about_us': 'About Us',
          'contact_us': 'Contact Us',
          'delete_account': 'Delete Account',
   
          'sign_out': 'Sign Out',

          // <-- Change the language of the text coming from the API using a variable. --> //
          'terms_and_condition': 'terms_and_condition',
          'privacy_policy': 'privacy_policy',

          // <-- Product Categories names --> //
          'Product_categories_name': 'name',

          // <-- Contact Us Screen Strings --> //
          'contact_us_sub_title': 'Send Us A Message',
          'contact_us_input_name': 'Your name',
          'contact_us_input_email': 'Email',
          'contact_us_input_phone': 'Phone',
          'contact_us_input_subject': 'Subject',
          'contact_us_input_message': 'Message',
          'contact_us_button_sand_now': 'Sand Now',
          'contact_us_Text_mail_address': 'Mail Address',
          'contact_us_Text_phone_number': 'Phone Number',
          'contact_us_Text_contact_address': 'Contact Address',

          // <-- Change Password Screen Strings --> //
          'current_password_input_name': 'Current Password',
          'change_password_input_email': 'Password',
          'change_password_input_phone': 'Re-enter password',
          'change_password_button_change_password': 'Change Password',

          // <-- Add Payment Method Screen Strings --> //
          'add_payment_method_button_text': 'Add Payment Method',

          // <-- Edit Profile Screen Strings --> //
          'edit_profile_input_your_name': 'Your Name',
          'edit_profile_input_your_zip_code': 'Your zip-code',
          'edit_profile_input_your_address': 'Your address',
          'edit_profile_button_update_account': 'Update Account',

          // <-- Order Screen Strings --> //
          'order_screen_no_item_heading_text': 'No Item here!',
          'order_screen_no_item_heading_message_text':
              "You don't have a any item, Please order Now",
          'order_screen_my_order_text': 'My Order',

          // <-- Home Screen Strings --> //

          // Filter Dropdown items
          'home_filter_dropdown_new_arrival': 'New Arrival',
          'home_filter_dropdown_top_products': 'Top Products',
          'home_filter_dropdown_best_sellings': 'Best Sellings',
          'home_filter_dropdown_discount_products': 'Discount Products',
          'home_filter_dropdown_height_price': 'Height Price',
          'home_filter_dropdown_low_price': 'Low Price',
          'home_filter_dropdown_free_delivery': 'Free Delivery',

          // <-- Login Screen Strings --> //
          'login_screen_heading_text': 'Welcome back!',
          'login_screen_sign_in_label_text': 'Sign In',
          'login_screen_sign_up_label_text': 'Sign Up',
          'login_screen_input_username': 'Username or Email',
          'login_screen_input_password': 'Password',
          'login_screen_remember_me_text': 'Remember me',
          'login_screen_forgot_password_text': 'Forgot password',
          'login_screen_sign_in_button': 'Sign In',
          'login_screen_continue_as_guest_text': 'Continue as Guest',

          // <-- Sign Up Screen Strings --> //
          'sign_up_screen_heading_text': 'Create Account',
          'sign_up_screen_sign_in_label_text': 'Sign In',
          'sign_up_screen_sign_up_label_text': 'Sign Up',
          'sign_up_screen_input_name': 'Name',
          'sign_up_screen_input_email': 'email',
          'sign_up_screen_input_password_1': 'Password',
          'sign_up_screen_input_password_2': 'Password',
          'sign_up_screen_checkbox_text': 'Forgot password',
          'sign_up_screen_sign_up_button': 'Sign Up',
        },

        // <-- Filipino Language  --> //

        'hi_IN': {
          'lan': 'FI',
          'title': 'Piliin ang Iyong Wika',
          'search': 'Maghanap sa ARBE',
          'shop_now': 'Mamili ngayon',
          'categories': 'Mga kategorya',
          'see_all': 'Ipakita lahat',
          'new_arrival': 'Bagong pagdating',
          'add_to_cart': 'Idagdag sa Cart',
          'popular': 'Sikat',
          'search_here': 'Maghanap dito',

          // <-- Profile screen list Filipino strings --> //
          'your_address': 'Ang iyong Address',
          'all_category': 'Lahat ng Kategorya',
          'notification': 'Abiso',
          'chats': 'Mga chat',
          'payment_methods': 'Mga Paraan ng Pagbabayad',
          'change_password': 'Palitan ANG password',
          'settings': 'Mga setting',
          'teams_condition': 'Mga Koponan at Kundisyon',
          'privacy_policy_title': 'Patakaran sa Privacy',
          'faq': 'Mga Karaniwang Tanong',
          'about_us': 'Tungkol sa atin',
          'contact_us': 'Makipag-ugnayan sa amin',
          'app_info': 'Impormasyon ng App',
          'delete_account': 'Tanggalin ang Account',
          'sign_out': 'Mag-sign Out',

          // <-- Change the Filipino language of the text coming from the API using a variable. --> //
          'terms_and_condition': 'terms_and_condition_filipino',
          'privacy_policy': 'privacy_policy_filipino',

          // <-- Product Categories names --> //
          'name': 'name_filipino',

          // <-- Contact Us Screen Filipino Strings --> //
          'contact_us_sub_title': 'Magpadala Ng Mensahe Sa Amin',
          'contact_us_input_name': 'Ang pangalan mo',
          'contact_us_input_email': 'Email',
          'contact_us_input_phone': 'Telepono',
          'contact_us_input_subject': 'Paksa',
          'contact_us_input_message': 'Mensahe',
          'contact_us_button_sand_now': 'Buhangin Ngayon',
          'contact_us_Text_mail_address': 'Mail Address',
          'contact_us_Text_phone_number': 'Numero ng telepono',
          'contact_us_Text_contact_address': 'Address ng Pakikipag-ugnayan',

          // <-- Change Password Screen Filipino Strings --> //
          'current_password_input_name': 'Kasalukuyang Password',
          'change_password_input_email': 'Password',
          'change_password_input_phone': 'Ipasok muli ang password',
          'change_password_button_change_password': 'Palitan ANG password',

          // <-- Add Payment Method Screen Filipino Strings --> //
          'add_payment_method_button_text': 'Magdagdag ng Paraan ng Pagbabayad',

          // <-- Edit Profile Screen Filipino Strings --> //
          'edit_profile_input_your_name': 'Ang pangalan mo',
          'edit_profile_input_your_zip_code': 'Ang iyong zip-code',
          'edit_profile_input_your_address': 'Ang iyong address',
          'edit_profile_button_update_account': 'I-update ang Profile',

          // <-- Order Screen Strings Filipino --> //
          'order_screen_no_item_heading_text': 'Walang Item dito!',
          'order_screen_no_item_heading_message_text':
              "Wala kang anumang item, Mangyaring mag-order na",
          'order_screen_my_order_text': 'Aking Order',

          // <-- Home Screen Filipino Strings --> //

          // Filter Dropdown items Filipino
          'home_filter_dropdown_new_arrival': 'Bagong pagdating',
          'home_filter_dropdown_top_products': 'Mga Nangungunang Produkto',
          'home_filter_dropdown_best_sellings': 'Pinakamabenta',
          'home_filter_dropdown_discount_products': 'Mga Produktong Diskwento',
          'home_filter_dropdown_height_price': 'Taas na Presyo',
          'home_filter_dropdown_low_price': 'Mababa ang presyo',
          'home_filter_dropdown_free_delivery': 'Libreng padala',

          // <-- Login Screen Strings Filipino --> //
          'login_screen_heading_text': 'Maligayang pagbabalik!',
          'login_screen_sign_in_label_text': 'Mag-sign In',
          'login_screen_sign_up_label_text': 'Mag-sign Up',
          'login_screen_input_username': 'Username or Email',
          'login_screen_input_password': 'Password',
          'login_screen_remember_me_text': 'Tandaan mo ako',
          'login_screen_forgot_password_text': 'Nakalimutan ang password',
          'login_screen_sign_in_button': 'Mag-sign In',
          'login_screen_continue_as_guest_text': 'Magpatuloy bilang Bisita',

          // <-- Sign Up Screen Strings Filipino --> //
          'sign_up_screen_heading_text': 'Lumikha ng Account',
          'sign_up_screen_sign_in_label_text': 'Mag-sign In',
          'sign_up_screen_sign_up_label_text': 'Mag-sign Up',
          'sign_up_screen_input_name': 'Pangalan',
          'sign_up_screen_input_email': 'Email',
          'sign_up_screen_input_password_1': 'Password',
          'sign_up_screen_input_password_2': 'Password',
          'sign_up_screen_checkbox_text':
              'Pumayag Ako Sa Patakaran sa Pagkapribado',
          'sign_up_screen_sign_up_button': 'Mag-sign Up',
        }
      };
}
