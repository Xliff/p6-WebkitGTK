use v6.c;

use NativeCall;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;

unit package WebkitGTK::Raw::WebsiteData;

sub webkit_website_data_get_name (WebKitWebsiteData $website_data)
  returns Str
  is native(webkit)
  is export
  { * }

sub webkit_website_data_get_size (
  WebKitWebsiteData $website_data,
  guint $types                    # WebKitWebsiteDataTypes $types
)
  returns guint64
  is native(webkit)
  is export
  { * }

sub webkit_website_data_get_type ()
  returns GType
  is native(webkit)
  is export
  { * }

sub webkit_website_data_get_types (WebKitWebsiteData $website_data)
  returns uint32 # WebKitWebsiteDataTypes
  is native(webkit)
  is export
  { * }

sub webkit_website_data_ref (WebKitWebsiteData $website_data)
  returns WebKitWebsiteData
  is native(webkit)
  is export
  { * }

sub webkit_website_data_unref (WebKitWebsiteData $website_data)
  is native(webkit)
  is export
  { * }
