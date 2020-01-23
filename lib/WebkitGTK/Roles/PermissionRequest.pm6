use v6.c;

use Method::Also;

use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::PermissionRequest;

role WebkitGTK::Roles::PermissionRequest {
  has WebKitPermissionRequest $!wpr;

  method WebkitGTK::Raw::Definitions::WebKitPermissionRequest
    is also<WebKitPermissionRequest>
  { $!wpr }

  method allow {
    webkit_permission_request_allow($!wpr);
  }

  method deny {
    webkit_permission_request_deny($!wpr);
  }

  method get_permissionrequest_type {
    state ($n, $t);

    unstable_get_type(
      self.^name,
      &webkit_permission_request_get_type,
      $n,
      $t
    );
  }

}
