use v6.c;

use Method::Also;

use WebkitGTK::Raw::Credential;
use WebkitGTK::Raw::Types;

# BOXED TYPE

class WebkitGTK::Credential {
  has WebKitCredential $!wkc;

  submethod BUILD (:$cred) {
    $!wkc = $cred;
  }

  method WebkitGTK::Raw::Definitions::WebKitCredential
    is also<
      Credential
      WebKitCredential
    >
  { $!wkc }

  multi method new (WebKitCredential $cred) {
    $cred ?? self.bless(:$cred) !! Nil;
  }
  multi method new (
    Str() $username,
    Str() $password,
    Int() $persistence            # WebKitCredentialPersistence $persistence
  ) {
    my gint $p = $persistence;

    webkit_credential_new($username, $password, $p);
  }

  method copy (:$raw = False) {
    my $cred = webkit_credential_copy($!wkc);

    $cred ??
      ( $raw ?? $cred !! WebkitGTK::Credential.new($cred) )
      !!
      Nil;
  }

  method free {
    webkit_credential_free($!wkc);
  }

  method get_password
    is also<
      get-password
      password
    >
  {
    webkit_credential_get_password($!wkc);
  }

  method get_persistence
    is also<
      get-persistence
      persistence
    >
  {
    WebKitCredentialPersistenceEnum(
      webkit_credential_get_persistence($!wkc)
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);
    
    unstable_get_type( self.^name, &webkit_credential_get_type, $n, $t );
  }

  method get_username
    is also<
      get-username
      username
    >
  {
    webkit_credential_get_username($!wkc);
  }

  method has_password is also<has-password> {
    so webkit_credential_has_password($!wkc);
  }

}
