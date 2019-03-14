use v6.c;

use GTK::Compat::Types;
use WebkitGTK::Raw::Types;
use WebkitGTK::Raw::SecurityManager;

class WebkitGTK::SecurityManager {
  has WebKitSecurityManager $!wsm;

  submethod BUILD (:$manager) {
    $!wsm = $manager;
  }

  method new (WebKitSecurityManager $manager) {
    self.bless(:$manager);
  }

  method get_type is also<get-type> {
    webkit_security_manager_get_type();
  }

  method register_uri_scheme_as_cors_enabled (Str() $scheme) 
    is also<register-uri-scheme-as-cors-enabled> 
  {
    webkit_security_manager_register_uri_scheme_as_cors_enabled(
      $!wsm, $scheme
    );
  }

  method register_uri_scheme_as_display_isolated (Str() $scheme) 
    is also<register-uri-scheme-as-display-isolated> 
  {
    webkit_security_manager_register_uri_scheme_as_display_isolated(
      $!wsm, $scheme
    );
  }

  method register_uri_scheme_as_empty_document (Str() $scheme) 
    is also<register-uri-scheme-as-empty-document> 
  {
    webkit_security_manager_register_uri_scheme_as_empty_document(
      $!wsm, $scheme
    );
  }

  method register_uri_scheme_as_local (Str() $scheme) 
    is also<register-uri-scheme-as-local> 
  {
    webkit_security_manager_register_uri_scheme_as_local(
      $!wsm, $scheme
    );
  }

  method register_uri_scheme_as_no_access (Str() $scheme) 
    is also<register-uri-scheme-as-no-access> 
  {
    webkit_security_manager_register_uri_scheme_as_no_access(
      $!wsm, $scheme
    );
  }

  method register_uri_scheme_as_secure (Str() $scheme) 
    is also<register-uri-scheme-as-secure> 
  {
    webkit_security_manager_register_uri_scheme_as_secure(
      $!wsm, $scheme
    );
  }

  method uri_scheme_is_cors_enabled (Str() $scheme) 
    is also<uri-scheme-is-cors-enabled> 
  {
    so webkit_security_manager_uri_scheme_is_cors_enabled($!wsm, $scheme);
  }

  method uri_scheme_is_display_isolated (Str() $scheme) 
    is also<uri-scheme-is-display-isolated> 
  {
    so webkit_security_manager_uri_scheme_is_display_isolated(
      $!wsm, $scheme
    );
  }

  method uri_scheme_is_empty_document (Str() $scheme) 
    is also<uri-scheme-is-empty-document> 
  {
    so webkit_security_manager_uri_scheme_is_empty_document($!wsm, $scheme);
  }

  method uri_scheme_is_local (Str() $scheme) 
    is also<uri-scheme-is-local> 
  {
    so webkit_security_manager_uri_scheme_is_local($!wsm, $scheme);
  }

  method uri_scheme_is_no_access (Str() $scheme) 
    is also<uri-scheme-is-no-access> 
  {
    so webkit_security_manager_uri_scheme_is_no_access($!wsm, $scheme);
  }

  method uri_scheme_is_secure (Str() $scheme) 
    is also<uri-scheme-is-secure> 
  {
    so webkit_security_manager_uri_scheme_is_secure($!wsm, $scheme);
  }

}
