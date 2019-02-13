use v6.c;

use NativeCall;

use WebkitGTK::Raw::UserContentManager;

use WebkitGTK::Roles::Signals::UserContentManager;

class WebkitGTK::UserContentManager {
  also does WebkitGTK::Roles::Signals::UserContentManager;

  has WebKitUserContentManager $!wcm;

  submethod BUILD (:$manager) {
    $!wcm = $manager;
  }

  method WebkitGTK::Raw::Types::WebKitUserContentManager {
    $!wcm;
  }

  method new {
    self.bless( manager => webkit_user_content_manager_new() );
  }

  # Is originally:
  # WebKitUserContentManager, WebKitJavascriptResult, gpointer --> void
  method script-message-received {
    self.connect-script-message-received($!wcm);
  }

  method add_script (WebKitUserScript() $script) {
    webkit_user_content_manager_add_script($!wcm, $script);
  }

  method add_style_sheet (
    WebKitUserStyleSheet() $stylesheet
  ) {
    webkit_user_content_manager_add_style_sheet($!wcm, $stylesheet);
  }

  method get_type {
    webkit_user_content_manager_get_type();
  }

  method register_script_message_handler (Str() $name) {
    webkit_user_content_manager_register_script_message_handler($!wcm, $name);
  }

  method register_script_message_handler_in_world (
    Str() $name,
    Str() $world_name
  ) {
    webkit_user_content_manager_register_script_message_handler_in_world(
      $!wcm, $name, $world_name
    );
  }

  method remove_all_scripts {
    webkit_user_content_manager_remove_all_scripts($!wcm);
  }

  method remove_all_style_sheets {
    webkit_user_content_manager_remove_all_style_sheets($!wcm);
  }

  method unregister_script_message_handler (Str() $name) {
    webkit_user_content_manager_unregister_script_message_handler(
      $!wcm, $name
    );
  }

  method unregister_script_message_handler_in_world (
    Str() $name,
    Str() $world_name
  ) {
    webkit_user_content_manager_unregister_script_message_handler_in_world(
      $!wcm, $name, $world_name
    );
  }

}
