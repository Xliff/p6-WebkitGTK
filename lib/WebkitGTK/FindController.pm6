use v6.c;

use Method::Also;

use WebkitGTK::Raw::FindController;
use WebkitGTK::Raw::Types;

use GLib::Roles::Object;
use GLib::Roles::Signals::Generic;

class WebkitGTK::FindController {
  also does GLib::Roles::Object;
  also does GLib::Roles::Signals::Generic;

  has WebKitFindController $!wfc is implementor;

  submethod BUILD (:$controller) {
    $!wfc = $controller;

    self.roleInit-Object;
  }

  method WebkitGTK::Raw::Definitions::WebKitFindController
    is also<WebKitFindController>
  { $!wfc }

  method new (WebKitFindController $controller) {
    $controller ?? self.bless(:$controller) !! Nil;
  }

  # Is originally:
  # WebKitFindController, guint, gpointer --> void
  method counted-matches is also<counted_matches> {
    self.connect-uint($!wfc, 'counted-matches');
  }

  # Is originally:
  # WebKitFindController, gpointer --> void
  method failed-to-find-text is also<failed_to_find_text> {
    self.connect($!wfc, 'failed-to-find-text');
  }

  # Is originally:
  # WebKitFindController, guint, gpointer --> void
  method found-text is also<found_text> {
    self.connect-uint($!wfc, 'found-text');
  }

  method count_matches (
    Str() $search_text,
    Int() $find_options,
    Int() $max_match_count
  )
    is also<count-matches>
  {
    my guint ($fo, $mmc) = ($find_options, $max_match_count);

    webkit_find_controller_count_matches($!wfc, $search_text, $fo, $mmc);
  }

  method get_max_match_count is also<get-max-match-count> {
    webkit_find_controller_get_max_match_count($!wfc);
  }

  method get_options is also<get-options> {
    webkit_find_controller_get_options($!wfc);
  }

  method get_search_text is also<get-search-text> {
    webkit_find_controller_get_search_text($!wfc);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &webkit_find_controller_get_type, $n, $t );
  }

  method get_web_view (:$raw = False) is also<get-web-view> {
    my $wv = webkit_find_controller_get_web_view($!wfc);

    $wv ??
      ( $raw ?? $wv !! ::('WebkitGTK::WebView').new($wv) )
      !!
      Nil;
  }

  method search (
    Str() $search_text,
    Int() $find_options,
    Int() $max_match_count
  ) {
    my guint ($fo, $mmc) = ($find_options, $max_match_count);

    webkit_find_controller_search($!wfc, $search_text, $fo, $mmc);
  }

  method search_finish is also<search-finish> {
    webkit_find_controller_search_finish($!wfc);
  }

  method search_next is also<search-next> {
    webkit_find_controller_search_next($!wfc);
  }

  method search_previous is also<search-previous> {
    webkit_find_controller_search_previous($!wfc);
  }

}
