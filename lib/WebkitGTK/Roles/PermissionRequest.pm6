use v6.c;

use WebkitGTK::Raw::Types;

use WebkitGTK::Raw::PermissionRequest;

role WebkitGTK::Roles::PermissionRequest {
  has WebKitPermissionRequest $!wpr;

  method allow {
    webkit_permission_request_allow($!wpr);
  }

  method deny {
    webkit_permission_request_deny($!wpr);
  }

  method get_PermissionRequest_type {
    webkit_permission_request_get_type();
  }

}
