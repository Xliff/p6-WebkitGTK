use v6.c;

use NativeCall;

use GTK::Roles::Pointers;

unit package WebkitGTK::Raw::Types;

constant webkit is export = 'webkit2gtk-4.0',v37;

class WebKitAuthenticationRequest is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitBackForwardList       is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitBackForwardListItem   is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitContextMenu           is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitContextMenuItem       is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitCredential            is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitDownload              is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitEditorState           is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitFindController        is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitHitTestResult         is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitJavascriptResult      is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitPolicyDecision        is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitNavigationAction      is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitSettings              is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitURIRequest            is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitUserContentManager    is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebContext            is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebInspector          is repr("CPointer") is export does GTK::Roles::Pointers { }
class WebKitWebResource           is repr("CPointer") is export does GTK::Roles::Pointers { }
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
