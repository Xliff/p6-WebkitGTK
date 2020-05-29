use v6.c;

use NativeCall;

use CompUnit::Util :re-export;
use GLib::Raw::Exports;
use Pango::Raw::Exports;
use GIO::Raw::Exports;
use GDK::Raw::Exports;
use GTK::Raw::Exports;
use WebkitGTK::Raw::Exports;

unit package WebkitGTK::Raw::Types;

need Cairo;
need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Struct_Subs;
need GLib::Raw::Subs;
need Pango::Raw::Definitions;
need Pango::Raw::Enums;
need Pango::Raw::Structs;
need Pango::Raw::Subs;
need GIO::DBus::Raw::Types;
need GIO::Raw::Definitions;
need GIO::Raw::Enums;
need GIO::Raw::Structs;
need GIO::Raw::Subs;
need GIO::Raw::Exports;
need GDK::Raw::Definitions;
need GDK::Raw::Enums;
need GDK::Raw::Structs;
need GDK::Raw::Subs;
need GTK::Raw::Definitions;
need GTK::Raw::Enums;
need GTK::Raw::Structs;
need GTK::Raw::Subs;
need GTK::Raw::Requisition;
need WebkitGTK::Compat::Types;
need WebkitGTK::Raw::Definitions;
need WebkitGTK::Raw::Enums;

BEGIN {
  re-export($_) for
    |@glib-exports,
    |@pango-exports,
    |@gio-exports,
    |@gdk-exports,
    |@gtk-exports,
    |@webkit-exports;
}
