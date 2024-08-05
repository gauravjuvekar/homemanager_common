{ firefox-addons, ... }:
{
  programs.firefox =
    {
      enable = true;
      profiles."Personal" =
        {
          name = "Personal";
          id = 0;
          settings =
            {
              "app.shield.optoutstudies.enabled" = false;
              "browser.bookmarks.restore_default_bookmarks" = false;
              "browser.bookmarks.showMobileBookmarks" = false;
              "browser.compactmode.show" = true;
              "browser.contentblocking.category" = "strict";
              "browser.download.alwaysOpenPanel" = false;
              "browser.download.always_ask_before_handling_new_types" = true;
              "browser.download.autohideButton" = false;
              "browser.download.improvements_to_download_panel" = false;
              "browser.download.panel.shown" = true;
              "browser.download.start_downloads_in_tmp_dir" = true;
              "browser.download.useDownloadDir" = false;
              "browser.fullscreen.autohide" = false;
              "browser.link.open_newwindow.restriction" = 0;
              "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
              "browser.newtabpage.activity-stream.feeds.topsites" = false;
              "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
              "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
              "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
              "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
              "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
              "browser.newtabpage.activity-stream.showSponsored" = false;
              "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
              "browser.proton.enabled" = false;
              "browser.search.separatePrivateDefault.urlbarResult.enabled" = false;
              "browser.search.widget.inNavBar" = true;
              "browser.startup.page" = 3;
              "browser.tabs.inTitlebar" = 0;
              "browser.toolbars.bookmarks.showOtherBookmarks" = false;
              "browser.toolbars.bookmarks.visibility" = "always";
              "browser.uidensity" = 1;
              "browser.urlbar.matchBuckets" = "general:5 =suggestion:Infinity";
              "browser.urlbar.quicksuggest.dataCollection.enabled" = false;
              "browser.urlbar.quicksuggest.nonsponsored" = false;
              "browser.urlbar.quicksuggest.scenario" = "offline";
              "browser.urlbar.quicksuggest.sponsored" = false;
              "browser.urlbar.showSearchSuggestionsFirst" = false;
              "browser.urlbar.suggest.engines" = false;
              "browser.urlbar.suggest.pocket" = false;
              "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
              "browser.urlbar.suggest.quicksuggest.sponsored" = false;
              "browser.urlbar.suggest.searches" = false;
              "devtools.chrome.enabled" = true;
              "devtools.theme" = "auto";
              "dom.forms.autocomplete.formautofill" = true;
              "extensions.formautofill.CreditCards.enabled" = false;
              "extensions.pocket.enabled" = false;
              "extensions.pocket.showHome" = false;
              "findbar.highlightAll" = true;
              "general.smoothScroll" = true;
              "network.dns.disablePrefetch" = true;
              "network.predictor.enabled" = false;
              "network.prefetch-next" = false;
              "network.trr.mode" = 3;
              "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
              "privacy.firstparty.isolate" = true;
              "signon.firefoxRelay.feature" = "disabled";
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
              "trailhead.firstrun.didSeeAboutWelcome" = true;
              "ui.context_menus.after_mouseup" = true;
            };
          extensions = with firefox-addons;
            [
              # These unfree extensions cannot be installed due to bug
              # https://gitlab.com/rycee/nur-expressions/-/issues/244
              # enhancer-for-youtube
              # flagfox
              # scroll_anywhere
              cookie-autodelete
              darkreader
              decentraleyes
              firemonkey
              foxytab
              gesturefy
              i-dont-care-about-cookies
              noscript
              offline-qr-code-generator
              print-edit-we
              read-aloud
              redirector
              simple-tab-groups
              stylus
              tab-reloader
              tab-retitle
              tab-session-manager
              tree-style-tab
              tst-tab-search
              ublock-origin
              user-agent-string-switcher
              vimium
              youtube-nonstop
              zoom-page-we
            ];
          userContent =
            ''
              @-moz-document unobservable-document() {
                @media (prefers-color-scheme: dark) {
                  .pdfViewer {
                    filter: invert(100%);
                  }
                }
              }
            '';
        };
    };
}
