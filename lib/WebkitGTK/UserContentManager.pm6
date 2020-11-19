use v6.c;

use Method::Also;
use NativeCall;

use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::UserContentManager;

use GLib::Roles::Object;
use WebkitGTK::Roles::Signals::UserContentManager;

our subset WebKitUserContentManagerAncestry is export of Mu
  where WebKitUserContentManager | GObject;

class WebkitGTK::UserContentManager {
  also does GLib::Roles::Object;
  also does WebkitGTK::Roles::Signals::UserContentManager;

  has WebKitUserContentManager $!wcm;

  submethod BUILD (:$manager) {
    self.setWebKitUserContentManager($manager) if $manager;
  }

  method setWebKitUserContentManager (WebKitUserContentManagerAncestry $_) {
    my $to-parent;

    $!wcm = do {
      when WebKitUserContentManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(WebKitUserContentManager, $_);
      }
    }
    self!setObject($to-parent);
  }

  method WebkitGTK::Raw::Types::WebKitUserContentManager
    is also<
      UserContentManager
      WebKitUserContentManager
    >
  { $!wcm }

  multi method new (WebKitUserContentManager $manager, :$ref = True) {
    return Nil unless $manager;

    my $o = self.bless(:$manager);
    $o.ref if $ref;
    $o;
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
