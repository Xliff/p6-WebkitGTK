use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::Error;

sub webkit_download_error_quark ()
  returns GQuark
  is native(webkit)
  is export
  { * }

sub webkit_javascript_error_quark ()
  returns GQuark
  is native(webkit)
  is export
  { * }

sub webkit_network_error_quark ()
  returns GQuark
  is native(webkit)
  is export
  { * }

sub webkit_plugin_error_quark ()
  returns GQuark
  is native(webkit)
  is export
  { * }

sub webkit_policy_error_quark ()
  returns GQuark
  is native(webkit)
  is export
  { * }

sub webkit_print_error_quark ()
  returns GQuark
  is native(webkit)
  is export
  { * }

sub webkit_snapshot_error_quark ()
  returns GQuark
  is native(webkit)
  is export
  { * }
