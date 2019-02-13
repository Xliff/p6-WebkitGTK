use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::FindController;
use WebkitGTK::Raw::Types;

use GTK::Roles::Types;
use GTK::Roles::Signals::Generic;

class WebkitGTK::FindController {
  also does GTK::Roles::Types;
  also does GTK::Roles::Signals::Generic;

  has WebKitFindController $!wfc;

  submethod BUILD (:$controller) {
    $!wfc = $controller;
  }

  method new (WebKitFindController $controller) {
    self.bless(:$controller);
  }

  # Is originally:
  # WebKitFindController, guint, gpointer --> void
  method counted-matches {
    self.connect-uint($!wfc, 'counted-matches');
  }

  # Is originally:
  # WebKitFindController, gpointer --> void
  method failed-to-find-text {
    self.connect($!wfc, 'failed-to-find-text');
  }

  # Is originally:
  # WebKitFindController, guint, gpointer --> void
  method found-text {
    self.connect-uint($!wfc, 'found-text');
  }

  method count_matches (
    Str() $search_text,
    Int() $find_options,
    Int() $max_match_count
  ) {
    my guint ($fo, $mmc) = self.RESOLVE-UINT($find_options, $max_match_count);
    webkit_find_controller_count_matches($!wfc, $search_text, $fo, $mmc);
  }

  method get_max_match_count {
    webkit_find_controller_get_max_match_count($!wfc);
  }

  method get_options {
    webkit_find_controller_get_options($!wfc);
  }

  method get_search_text {
    webkit_find_controller_get_search_text($!wfc);
  }

  method get_type {
    webkit_find_controller_get_type();
  }

  method get_web_view {
    ::('WebkitGTK::WebView').new(
      webkit_find_controller_get_web_view($!wfc)
    );
  }

  method search (
    Str() $search_text,
    Int() $find_options,
    Int() $max_match_count
  ) {
    my guint ($fo, $mmc) = self.RESOLVE-UINT($find_options, $max_match_count);
    webkit_find_controller_search($!wfc, $search_text, $fo, $mmc);
  }

  method search_finish {
    webkit_find_controller_search_finish($!wfc);
  }

  method search_next {
    webkit_find_controller_search_next($!wfc);
  }

  method search_previous {
    webkit_find_controller_search_previous($!wfc);
  }

}
