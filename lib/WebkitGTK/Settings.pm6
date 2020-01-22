use v6.c;

use NativeCall;


use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::Settings;

use GTK::Roles::Types;

class WebkitGTK::Settings {
  also does GTK::Roles::Types;

  has WebKitSettings $!ws;

  submethod BUILD (:$settings) {
    $!ws = $settings;
  }

  multi method new (WebKitSettings :$settings) {
    self.bless(:$settings);
  }
  multi method new {
    self.bless( settings => webkit_settings_new() );
  }

  method font_size_to_pixels {
    webkit_settings_font_size_to_pixels($!ws);
  }

  method font_size_to_points {
    webkit_settings_font_size_to_points($!ws);
  }

  method get_type {
    webkit_settings_get_type();
  }

  method set_user_agent_with_application_details (
    Str() $application_name,
    Str() $application_version
  ) {
    webkit_settings_set_user_agent_with_application_details(
      $!ws, $application_name, $application_version
    );
  }

  method allow_file_access_from_file_urls is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_allow_file_access_from_file_urls($!ws);
      },
      STORE => sub ($, Int() $allowed is copy) {
        my gboolean $a = self.RESOLVE-BOOL($allowed);
        webkit_settings_set_allow_file_access_from_file_urls($!ws, $a);
      }
    );
  }

  method allow_modal_dialogs is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_allow_modal_dialogs($!ws);
      },
      STORE => sub ($, Int() $allowed is copy) {
        my gboolean $a = self.RESOLVE-BOOL($allowed);
        webkit_settings_set_allow_modal_dialogs($!ws, $a);
      }
    );
  }

  method allow_universal_access_from_file_urls is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_allow_universal_access_from_file_urls($!ws);
      },
      STORE => sub ($, Int() $allowed is copy) {
        my gboolean $a = self.RESOLVE-BOOL($allowed);
        webkit_settings_set_allow_universal_access_from_file_urls($!ws, $a);
      }
    );
  }

  method auto_load_images is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_auto_load_images($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_auto_load_images($!ws, $e);
      }
    );
  }

  method cursive_font_family is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_cursive_font_family($!ws);
      },
      STORE => sub ($, Str() $cursive_font_family is copy) {
        webkit_settings_set_cursive_font_family($!ws, $cursive_font_family);
      }
    );
  }

  method default_charset is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_default_charset($!ws);
      },
      STORE => sub ($, Str() $default_charset is copy) {
        webkit_settings_set_default_charset($!ws, $default_charset);
      }
    );
  }

  method default_font_family is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_default_font_family($!ws);
      },
      STORE => sub ($, Str() $default_font_family is copy) {
        webkit_settings_set_default_font_family($!ws, $default_font_family);
      }
    );
  }

  method default_font_size is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_default_font_size($!ws);
      },
      STORE => sub ($, Int() $font_size is copy) {
        my gint $fs = self.RESOLVE-INT($font_size);
        webkit_settings_set_default_font_size($!ws, $fs);
      }
    );
  }

  method default_monospace_font_size is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_default_monospace_font_size($!ws);
      },
      STORE => sub ($, Int() $font_size is copy) {
        my gint $fs = self.RESOLVE-INT($font_size);
        webkit_settings_set_default_monospace_font_size($!ws, $fs);
      }
    );
  }

  method draw_compositing_indicators is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_draw_compositing_indicators($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_draw_compositing_indicators($!ws, $e);
      }
    );
  }

  method enable_accelerated_2d_canvas is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_accelerated_2d_canvas($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_accelerated_2d_canvas($!ws, $e);
      }
    );
  }

  method enable_caret_browsing is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_caret_browsing($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_caret_browsing($!ws, $e);
      }
    );
  }

  method enable_developer_extras is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_developer_extras($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_developer_extras($!ws, $e);
      }
    );
  }

  method enable_dns_prefetching is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_dns_prefetching($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_dns_prefetching($!ws, $e);
      }
    );
  }

  method enable_encrypted_media is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_encrypted_media($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_encrypted_media($!ws, $e);
      }
    );
  }

  method enable_frame_flattening is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_frame_flattening($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_frame_flattening($!ws, $e);
      }
    );
  }

  method enable_fullscreen is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_fullscreen($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_fullscreen($!ws, $e);
      }
    );
  }

  method enable_html5_database is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_html5_database($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_html5_database($!ws, $e);
      }
    );
  }

  method enable_html5_local_storage is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_html5_local_storage($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_html5_local_storage($!ws, $e);
      }
    );
  }

  method enable_hyperlink_auditing is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_hyperlink_auditing($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_hyperlink_auditing($!ws, $e);
      }
    );
  }

  method enable_java is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_java($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_java($!ws, $e);
      }
    );
  }

  method enable_javascript is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_javascript($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_javascript($!ws, $e);
      }
    );
  }

  method enable_media_capabilities is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_media_capabilities($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_media_capabilities($!ws, $e);
      }
    );
  }

  method enable_media_stream is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_media_stream($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_media_stream($!ws, $e);
      }
    );
  }

  method enable_mediasource is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_mediasource($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_mediasource($!ws, $e);
      }
    );
  }

  method enable_offline_web_application_cache is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_offline_web_application_cache($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_offline_web_application_cache($!ws, $e);
      }
    );
  }

  method enable_page_cache is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_page_cache($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_page_cache($!ws, $e);
      }
    );
  }

  method enable_plugins is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_plugins($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_plugins($!ws, $e);
      }
    );
  }

  method enable_resizable_text_areas is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_resizable_text_areas($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_resizable_text_areas($!ws, $e);
      }
    );
  }

  method enable_site_specific_quirks is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_site_specific_quirks($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_site_specific_quirks($!ws, $e);
      }
    );
  }

  method enable_smooth_scrolling is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_smooth_scrolling($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_smooth_scrolling($!ws, $e);
      }
    );
  }

  method enable_spatial_navigation is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_spatial_navigation($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_spatial_navigation($!ws, $e);
      }
    );
  }

  method enable_tabs_to_links is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_tabs_to_links($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_tabs_to_links($!ws, $e);
      }
    );
  }

  method enable_webaudio is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_webaudio($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_webaudio($!ws, $e);
      }
    );
  }

  method enable_webgl is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_webgl($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_webgl($!ws, $e);
      }
    );
  }

  method enable_write_console_messages_to_stdout is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_write_console_messages_to_stdout(
          $!ws
        );
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_write_console_messages_to_stdout(
          $!ws, $e
        );
      }
    );
  }

  method enable_xss_auditor is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_enable_xss_auditor($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_enable_xss_auditor($!ws, $e);
      }
    );
  }

  method fantasy_font_family is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_fantasy_font_family($!ws);
      },
      STORE => sub ($, Str() $fantasy_font_family is copy) {
        webkit_settings_set_fantasy_font_family($!ws, $fantasy_font_family);
      }
    );
  }

  method hardware_acceleration_policy is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_hardware_acceleration_policy($!ws);
      },
      STORE => sub ($, Int() $policy is copy) {
        my guint $p = self.RESOLVE-UINT($policy);
        webkit_settings_set_hardware_acceleration_policy($!ws, $p);
      }
    );
  }

  method javascript_can_access_clipboard is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_javascript_can_access_clipboard($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_javascript_can_access_clipboard($!ws, $e);
      }
    );
  }

  method javascript_can_open_windows_automatically is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_javascript_can_open_windows_automatically(
          $!ws
        );
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_javascript_can_open_windows_automatically(
          $!ws, $e
        );
      }
    );
  }

  method load_icons_ignoring_image_load_setting is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_load_icons_ignoring_image_load_setting($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_load_icons_ignoring_image_load_setting($!ws, $e);
      }
    );
  }

  method media_playback_allows_inline is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_media_playback_allows_inline($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_media_playback_allows_inline($!ws, $e);
      }
    );
  }

  method media_playback_requires_user_gesture is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_media_playback_requires_user_gesture($!ws);
      },
      STORE => sub ($, Int() $enabled is copy) {
        my gboolean $e = self.RESOLVE-BOOL($enabled);
        webkit_settings_set_media_playback_requires_user_gesture($!ws, $e);
      }
    );
  }

  method minimum_font_size is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_minimum_font_size($!ws);
      },
      STORE => sub ($, Int() $font_size is copy) {
        my gint $fs = self.RESOLVE-INT($font_size);
        webkit_settings_set_minimum_font_size($!ws, $fs);
      }
    );
  }

  method monospace_font_family is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_monospace_font_family($!ws);
      },
      STORE => sub ($, Str() $monospace_font_family is copy) {
        webkit_settings_set_monospace_font_family(
          $!ws, $monospace_font_family
        );
      }
    );
  }

  method pictograph_font_family is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_pictograph_font_family($!ws);
      },
      STORE => sub ($, Str() $pictograph_font_family is copy) {
        webkit_settings_set_pictograph_font_family(
          $!ws, $pictograph_font_family
        );
      }
    );
  }

  method print_backgrounds is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_print_backgrounds($!ws);
      },
      STORE => sub ($, Int() $print_backgrounds is copy) {
        my gboolean $pb = self.RESOLVE-BOOL($print_backgrounds);
        webkit_settings_set_print_backgrounds($!ws, $pb);
      }
    );
  }

  method sans_serif_font_family is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_sans_serif_font_family($!ws);
      },
      STORE => sub ($, Str() $sans_serif_font_family is copy) {
        webkit_settings_set_sans_serif_font_family(
          $!ws, $sans_serif_font_family
        );
      }
    );
  }

  method serif_font_family is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_serif_font_family($!ws);
      },
      STORE => sub ($, Str() $serif_font_family is copy) {
        webkit_settings_set_serif_font_family($!ws, $serif_font_family);
      }
    );
  }

  method user_agent is rw {
    Proxy.new(
      FETCH => sub ($) {
        webkit_settings_get_user_agent($!ws);
      },
      STORE => sub ($, Str() $user_agent is copy) {
        webkit_settings_set_user_agent($!ws, $user_agent);
      }
    );
  }

  method zoom_text_only is rw {
    Proxy.new(
      FETCH => sub ($) {
        so webkit_settings_get_zoom_text_only($!ws);
      },
      STORE => sub ($, Int() $zoom_text_only is copy) {
        my guint $zto = self.RESOLVE-BOOL($zoom_text_only);
        webkit_settings_set_zoom_text_only($!ws, $zto);
      }
    );
  }

}
