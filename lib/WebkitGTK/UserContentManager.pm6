use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::UserContentManager;

use WebkitGTK::Roles::Signals::UserContentManager;

class WebkitGTK::UserContentManager {
  also does WebkitGTK::Roles::Signals::UserContentManager;

  has WebKitUserContentManager $!wcm;

  submethod BUILD (:$manager) {
    $!wcm = $manager;
  }

  method WebkitGTK::Raw::Definitions::WebKitUserContentManager
    is also<
      UserContentManager
      WebKitUserContentManager
    >
  { $!wcm }

  multi method new (WebKitUserContentManager $manager) {
    $manager ?? self.bless(:$manager) !! Nil;
  }
  multi method new {
    my $manager = webkit_user_content_manager_new();

    $manager ?? self.bless(:$manager) !! Nil;
  }

  # Is originally:
  # WebKitUserContentManager, WebKitJavascriptResult, gpointer --> void
  method script-message-received is also<script_message_received> {
    self.connect-script-message-received($!wcm);
  }

  method add_script (WebKitUserScript() $script) is also<add-script> {
    webkit_user_content_manager_add_script($!wcm, $script);
  }

  method add_style_sheet (
    WebKitUserStyleSheet() $stylesheet
  )
    is also<add-style-sheet>
  {
    webkit_user_content_manager_add_style_sheet($!wcm, $stylesheet);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_user_content_manager_get_type,
      $n,
      $t
    );
  }

  method register_script_message_handler (Str() $name)
    is also<register-script-message-handler>
  {
    so webkit_user_content_manager_register_script_message_handler(
      $!wcm,
      $name
    );
  }

  method register_script_message_handler_in_world (
    Str() $name,
    Str() $world_name
  )
    is also<register-script-message-handler-in-world>
  {
    so webkit_user_content_manager_register_script_message_handler_in_world(
      $!wcm,
      $name,
      $world_name
    );
  }

  method remove_all_scripts is also<remove-all-scripts> {
    webkit_user_content_manager_remove_all_scripts($!wcm);
  }

  method remove_all_style_sheets is also<remove-all-style-sheets> {
    webkit_user_content_manager_remove_all_style_sheets($!wcm);
  }

  method unregister_script_message_handler (Str() $name)
    is also<unregister-script-message-handler>
  {
    webkit_user_content_manager_unregister_script_message_handler(
      $!wcm,
      $name
    );
  }

  method unregister_script_message_handler_in_world (
    Str() $name,
    Str() $world_name
  )
    is also<unregister-script-message-handler-in-world>
  {
    webkit_user_content_manager_unregister_script_message_handler_in_world(
      $!wcm,
      $name,
      $world_name
    );
  }

}
