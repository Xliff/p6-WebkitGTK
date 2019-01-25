use v6.c;

use NativeCall;

use GTK::Compat::Types;

use WebkitGTK::Raw::Credential;
use WebkitGTK::Raw::Types;

use GTK::Roles::Types;

use GTK::Raw::Utils;

class WebkitGTK::Credential {
  has WebKitCredential $!wkc;

  submethod BUILD (:$cred) {
    $!wkc = $cred;
  }

  method WebkitGTK::Raw::Types::WebKitCredential {
    $!wkc;
  }

  method new (
    Str() $username,
    Str() $password,
    Int() $persistence            # WebKitCredentialPersistence $persistence
  ) {
    my gint $p = resolve-uint($persistence);
    webkit_credential_new($username, $password, $p);
  }

  method copy {
    self.bless( cred => webkit_credential_copy($!wkc) );
  }

  method free {
    webkit_credential_free($!wkc);
  }

  method get_password {
    webkit_credential_get_password($!wkc);
  }

  method get_persistence {
    WebKitCredentialPersistence( webkit_credential_get_persistence($!wkc) );
  }

  method get_type {
    webkit_credential_get_type();
  }

  method get_username {
    webkit_credential_get_username($!wkc);
  }

  method has_password {
    so webkit_credential_has_password($!wkc);
  }
  
}
