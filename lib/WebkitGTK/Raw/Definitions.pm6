use v6.c;

use NativeCall;

use GLib::Roles::Pointers;

unit package WebkitGTK::Raw::Types;

constant webkit is export = 'webkit2gtk-4.0',v37;

# Number of times compilations have been forced.
my constant forced = 30;

constant WebKitURISchemeRequestCallback is export := Pointer;

class WebKitApplicationInfo          is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitAuthenticationRequest    is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitAutomationSession        is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitBackForwardList          is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitBackForwardListItem      is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitColorChooserRequest      is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitConsoleMessage           is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitContextMenu              is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitContextMenuItem          is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitCookieManager            is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitCredential               is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitDOMObject                is repr<CPointer> is export does GLib::Roles::Pointers { } # DEPRECATED
class WebKitDownload                 is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitEditorState              is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitFaviconDatabase          is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitFileChooserRequest       is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitFindController           is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitFormSubmissionRequest    is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitFrame                    is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitHitTestResult            is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitJavascriptResult         is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitMimeInfo                 is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitNavigationAction         is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitNavigationPolicyDecision is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitNetworkProxySettings     is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitNotification             is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitOptionMenu               is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitOptionMenuItem           is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitPermissionRequest        is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitPlugin                   is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitPolicyDecision           is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitPrintCustomWidget        is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitPrintOperation           is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitResponsePolicyDecision   is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitScriptDialog             is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitScriptWorld              is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitSecurityManager          is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitSecurityOrigin           is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitSettings                 is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitURIRequest               is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitURIResponse              is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitURISchemeRequest         is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitUserContentManager       is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitUserScript               is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitUserStyleSheet           is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitWebContext               is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitWebInspector             is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitWebResource              is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitWebsiteData              is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitWebsiteDataManager       is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitWebView                  is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitWebViewSessionState      is repr<CPointer> is export does GLib::Roles::Pointers { }
class WebKitWindowProperties         is repr<CPointer> is export does GLib::Roles::Pointers { }