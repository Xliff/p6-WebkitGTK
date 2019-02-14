use v6.c;

use NativeCall;

use GTK::Roles::Pointers;

unit package WebkitGTK::Raw::Types;

constant webkit is export = 'webkit2gtk-4.0',v37;

constant WebKitURISchemeRequestCallback is export := Pointer;

class WebKitAuthenticationRequest is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitAutomationSession     is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitBackForwardList       is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitBackForwardListItem   is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitColorChooserRequest   is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitContextMenu           is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitContextMenuItem       is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitCookieManager         is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitCredential            is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitDownload              is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitEditorState           is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitFaviconDatabase       is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitFileChooserRequest    is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitFindController        is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitFormSubmissionRequest is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitHitTestResult         is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitJavascriptResult      is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitMimeInfo              is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitNavigationAction      is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitNetworkProxySettings  is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitNotification          is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitOptionMenu            is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitOptionMenuItem        is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitPermissionRequest     is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitPlugin                is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitPolicyDecision        is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitPrintCustomWidget     is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitPrintOperation        is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitScriptDialog          is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitSecurityManager       is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitSecurityOrigin        is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitSettings              is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitURIRequest            is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitURIResponse           is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitURISchemeRequest      is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitUserContentManager    is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitUserScript            is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitUserStyleSheet        is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebContext            is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebInspector          is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebResource           is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebsiteData           is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebsiteDataManager    is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebView               is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebViewSessionState   is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWindowProperties      is repr("CPointer") is export does GTK::Roles::Pointers { }

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

our enum WebKitWebProcessTerminationReason is export <
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

our enum WebKitContextMenuAction is export (
  WEBKIT_CONTEXT_MENU_ACTION_NO_ACTION => 0,
  'WEBKIT_CONTEXT_MENU_ACTION_OPEN_LINK',
  'WEBKIT_CONTEXT_MENU_ACTION_OPEN_LINK_IN_NEW_WINDOW',
  'WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_LINK_TO_DISK',
  'WEBKIT_CONTEXT_MENU_ACTION_COPY_LINK_TO_CLIPBOARD',
  'WEBKIT_CONTEXT_MENU_ACTION_OPEN_IMAGE_IN_NEW_WINDOW',
  'WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_IMAGE_TO_DISK',
  'WEBKIT_CONTEXT_MENU_ACTION_COPY_IMAGE_TO_CLIPBOARD',
  'WEBKIT_CONTEXT_MENU_ACTION_COPY_IMAGE_URL_TO_CLIPBOARD',
  'WEBKIT_CONTEXT_MENU_ACTION_OPEN_FRAME_IN_NEW_WINDOW',
  'WEBKIT_CONTEXT_MENU_ACTION_GO_BACK',
  'WEBKIT_CONTEXT_MENU_ACTION_GO_FORWARD',
  'WEBKIT_CONTEXT_MENU_ACTION_STOP',
  'WEBKIT_CONTEXT_MENU_ACTION_RELOAD',
  'WEBKIT_CONTEXT_MENU_ACTION_COPY',
  'WEBKIT_CONTEXT_MENU_ACTION_CUT',
  'WEBKIT_CONTEXT_MENU_ACTION_PASTE',
  'WEBKIT_CONTEXT_MENU_ACTION_DELETE',
  'WEBKIT_CONTEXT_MENU_ACTION_SELECT_ALL',
  'WEBKIT_CONTEXT_MENU_ACTION_INPUT_METHODS',
  'WEBKIT_CONTEXT_MENU_ACTION_UNICODE',
  'WEBKIT_CONTEXT_MENU_ACTION_SPELLING_GUESS',
  'WEBKIT_CONTEXT_MENU_ACTION_NO_GUESSES_FOUND',
  'WEBKIT_CONTEXT_MENU_ACTION_IGNORE_SPELLING',
  'WEBKIT_CONTEXT_MENU_ACTION_LEARN_SPELLING',
  'WEBKIT_CONTEXT_MENU_ACTION_IGNORE_GRAMMAR',
  'WEBKIT_CONTEXT_MENU_ACTION_FONT_MENU',
  'WEBKIT_CONTEXT_MENU_ACTION_BOLD',
  'WEBKIT_CONTEXT_MENU_ACTION_ITALIC',
  'WEBKIT_CONTEXT_MENU_ACTION_UNDERLINE',
  'WEBKIT_CONTEXT_MENU_ACTION_OUTLINE',
  'WEBKIT_CONTEXT_MENU_ACTION_INSPECT_ELEMENT',
  'WEBKIT_CONTEXT_MENU_ACTION_OPEN_VIDEO_IN_NEW_WINDOW',
  'WEBKIT_CONTEXT_MENU_ACTION_OPEN_AUDIO_IN_NEW_WINDOW',
  'WEBKIT_CONTEXT_MENU_ACTION_COPY_VIDEO_LINK_TO_CLIPBOARD',
  'WEBKIT_CONTEXT_MENU_ACTION_COPY_AUDIO_LINK_TO_CLIPBOARD',
  'WEBKIT_CONTEXT_MENU_ACTION_TOGGLE_MEDIA_CONTROLS',
  'WEBKIT_CONTEXT_MENU_ACTION_TOGGLE_MEDIA_LOOP',
  'WEBKIT_CONTEXT_MENU_ACTION_ENTER_VIDEO_FULLSCREEN',
  'WEBKIT_CONTEXT_MENU_ACTION_MEDIA_PLAY',
  'WEBKIT_CONTEXT_MENU_ACTION_MEDIA_PAUSE',
  'WEBKIT_CONTEXT_MENU_ACTION_MEDIA_MUTE',
  'WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_VIDEO_TO_DISK',
  'WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_AUDIO_TO_DISK',

  WEBKIT_CONTEXT_MENU_ACTION_CUSTOM => 10000
);

our enum WebKitCacheModel is export <
  WEBKIT_CACHE_MODEL_DOCUMENT_VIEWER
  WEBKIT_CACHE_MODEL_WEB_BROWSER
  WEBKIT_CACHE_MODEL_DOCUMENT_BROWSER
>;

our enum WebKitProcessModel is export <
  WEBKIT_PROCESS_MODEL_SHARED_SECONDARY_PROCESS
  WEBKIT_PROCESS_MODEL_MULTIPLE_SECONDARY_PROCESSES
>;

our enum WebKitTLSErrorsPolicy is export <
  WEBKIT_TLS_ERRORS_POLICY_IGNORE
  WEBKIT_TLS_ERRORS_POLICY_FAIL
>;

our enum WebKitNavigationType is export <
  WEBKIT_NAVIGATION_TYPE_LINK_CLICKED
  WEBKIT_NAVIGATION_TYPE_FORM_SUBMITTED
  WEBKIT_NAVIGATION_TYPE_BACK_FORWARD
  WEBKIT_NAVIGATION_TYPE_RELOAD
  WEBKIT_NAVIGATION_TYPE_FORM_RESUBMITTED
  WEBKIT_NAVIGATION_TYPE_OTHER
>;

our enum WebKitWebsiteDataTypes is export (
  WEBKIT_WEBSITE_DATA_MEMORY_CACHE              =>  1,
  WEBKIT_WEBSITE_DATA_DISK_CACHE                =>  1 +< 1,
  WEBKIT_WEBSITE_DATA_OFFLINE_APPLICATION_CACHE =>  1 +< 2,
  WEBKIT_WEBSITE_DATA_SESSION_STORAGE           =>  1 +< 3,
  WEBKIT_WEBSITE_DATA_LOCAL_STORAGE             =>  1 +< 4,
  WEBKIT_WEBSITE_DATA_WEBSQL_DATABASES          =>  1 +< 5,
  WEBKIT_WEBSITE_DATA_INDEXEDDB_DATABASES       =>  1 +< 6,
  WEBKIT_WEBSITE_DATA_PLUGIN_DATA               =>  1 +< 7,
  WEBKIT_WEBSITE_DATA_COOKIES                   =>  1 +< 8,
  WEBKIT_WEBSITE_DATA_ALL                       => (1 +< 9) - 1
);

our enum WebKitPrintOperationResponse is export <
    WEBKIT_PRINT_OPERATION_RESPONSE_PRINT,
    WEBKIT_PRINT_OPERATION_RESPONSE_CANCEL
>;

our enum WebKitNetworkError is export (
    WEBKIT_NETWORK_ERROR_FAILED              => 399,
    WEBKIT_NETWORK_ERROR_TRANSPORT           => 300,
    WEBKIT_NETWORK_ERROR_UNKNOWN_PROTOCOL    => 301,
    WEBKIT_NETWORK_ERROR_CANCELLED           => 302,
    WEBKIT_NETWORK_ERROR_FILE_DOES_NOT_EXIST => 303
);

our enum WebKitPolicyError is export (
    WEBKIT_POLICY_ERROR_FAILED                                  => 199,
    WEBKIT_POLICY_ERROR_CANNOT_SHOW_MIME_TYPE                   => 100,
    WEBKIT_POLICY_ERROR_CANNOT_SHOW_URI                         => 101,
    WEBKIT_POLICY_ERROR_FRAME_LOAD_INTERRUPTED_BY_POLICY_CHANGE => 102,
    WEBKIT_POLICY_ERROR_CANNOT_USE_RESTRICTED_PORT              => 103
);


our enum WebKitPluginError is export (
    WEBKIT_PLUGIN_ERROR_FAILED               => 299,
    WEBKIT_PLUGIN_ERROR_CANNOT_FIND_PLUGIN   => 200,
    WEBKIT_PLUGIN_ERROR_CANNOT_LOAD_PLUGIN   => 201,
    WEBKIT_PLUGIN_ERROR_JAVA_UNAVAILABLE     => 202,
    WEBKIT_PLUGIN_ERROR_CONNECTION_CANCELLED => 203,
    WEBKIT_PLUGIN_ERROR_WILL_HANDLE_LOAD     => 204,
);

our enum WebKitDownloadError is export (
    WEBKIT_DOWNLOAD_ERROR_NETWORK           => 499,
    WEBKIT_DOWNLOAD_ERROR_CANCELLED_BY_USER => 400,
    WEBKIT_DOWNLOAD_ERROR_DESTINATION       => 401
);

our enum WebKitPrintError is export (
    WEBKIT_PRINT_ERROR_GENERAL            => 599,
    WEBKIT_PRINT_ERROR_PRINTER_NOT_FOUND  => 500,
    WEBKIT_PRINT_ERROR_INVALID_PAGE_RANGE => 501
);

our enum WebKitJavascriptError is export (
    WEBKIT_JAVASCRIPT_ERROR_SCRIPT_FAILED => 699
);

our enum WebKitSnapshotError is export (
    WEBKIT_SNAPSHOT_ERROR_FAILED_TO_CREATE => 799
);

our enum WebKitCookiePersistentStorage is export <
  WEBKIT_COOKIE_PERSISTENT_STORAGE_TEXT
  WEBKIT_COOKIE_PERSISTENT_STORAGE_SQLITE
>;

our enum WebKitCookieAcceptPolicy is export <
  WEBKIT_COOKIE_POLICY_ACCEPT_ALWAYS
  WEBKIT_COOKIE_POLICY_ACCEPT_NEVER
  WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY
>;

our enum WebKitNetworkProxyMode is export <
  WEBKIT_NETWORK_PROXY_MODE_DEFAULT
  WEBKIT_NETWORK_PROXY_MODE_NO_PROXY
  WEBKIT_NETWORK_PROXY_MODE_CUSTOM
>;

our enum WebKitUserStyleLevel is export <
  WEBKIT_USER_STYLE_LEVEL_USER
  WEBKIT_USER_STYLE_LEVEL_AUTHOR
>;

our enum WebKitUserContentInjectedFrames is export <
  WEBKIT_USER_CONTENT_INJECT_ALL_FRAMES
  WEBKIT_USER_CONTENT_INJECT_TOP_FRAME
>;

our enum WebKitUserScriptInjectionTime is export <
  WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_START
  WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_END
>;
