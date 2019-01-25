use v6.c;

use NativeCall;

use GTK::Roles::Pointers;

unit package WebkitGTK::Raw::Types;

constant webkit is export = 'webkit2gtk-4.0',v37;

class WebKitAuthenticationRequest is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitBackForwardList       is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitBackForwardListItem   is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitCredential            is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitDownload              is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitEditorState           is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitFindController        is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitJavascriptResult      is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitSettings              is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitURIRequest            is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitUserContentManager    is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebContext            is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebInspector          is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebResource           is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebsiteDataManager    is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebView               is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebViewSessionState   is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWindowProperties      is repr("CPointer") is export does GTK::Roles::Pointers { * }

our enum WebKitPolicyDecisionType is export <
  WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION
  WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION
  WEBKIT_POLICY_DECISION_TYPE_RESPONSE
>;

our enum WebKitLoadEvent is export <
  WEBKIT_LOAD_STARTED
  WEBKIT_LOAD_REDIRECTED
  WEBKIT_LOAD_COMMITTED
  WEBKIT_LOAD_FINISHED
>;

our enum WebKitSaveMode is export <
  WEBKIT_SAVE_MODE_MHTML
>;

our enum WebKitInsecureContentEvent is export <
  WEBKIT_INSECURE_CONTENT_RUN,
  WEBKIT_INSECURE_CONTENT_DISPLAYED
>;

our enum WebKitSnapshotOptions is export (
  WEBKIT_SNAPSHOT_OPTIONS_NONE                           => 0,
  WEBKIT_SNAPSHOT_OPTIONS_INCLUDE_SELECTION_HIGHLIGHTING => 1,
  WEBKIT_SNAPSHOT_OPTIONS_TRANSPARENT_BACKGROUND         => 2,
);

our enum WebKitSnapshotRegion is export <
  WEBKIT_SNAPSHOT_REGION_VISIBLE
  WEBKIT_SNAPSHOT_REGION_FULL_DOCUMENT
>;

our enum WebKitWebProcessTerminationReason <
  WEBKIT_WEB_PROCESS_CRASHED
  WEBKIT_WEB_PROCESS_EXCEEDED_MEMORY_LIMIT
>;

our enum WebKitAuthenticationScheme is export (
  WEBKIT_AUTHENTICATION_SCHEME_DEFAULT                           => 1,
  WEBKIT_AUTHENTICATION_SCHEME_HTTP_BASIC                        => 2,
  WEBKIT_AUTHENTICATION_SCHEME_HTTP_DIGEST                       => 3,
  WEBKIT_AUTHENTICATION_SCHEME_HTML_FORM                         => 4,
  WEBKIT_AUTHENTICATION_SCHEME_NTLM                              => 5,
  WEBKIT_AUTHENTICATION_SCHEME_NEGOTIATE                         => 6,
  WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_REQUESTED      => 7,
  WEBKIT_AUTHENTICATION_SCHEME_SERVER_TRUST_EVALUATION_REQUESTED => 8,
  WEBKIT_AUTHENTICATION_SCHEME_UNKNOWN                           => 100,
);

our enum WebKitCredentialPersistence is export <
  WEBKIT_CREDENTIAL_PERSISTENCE_NONE
  WEBKIT_CREDENTIAL_PERSISTENCE_FOR_SESSION
  WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT
>;
