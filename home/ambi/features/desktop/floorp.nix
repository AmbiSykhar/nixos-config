{ pkgs, ... }:

{
  programs.floorp = {
    enable = true;
    profiles.ambi = {
      name = "ambi";
      search = {};
      bookmarks = {};
      # TODO: extensions

      settings = {
        "browser.startup.homepage" = "about:home";

        # Disable homepage things
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;

        # Disable some telemetry
        "app.shield.optoutstudies.enabled" = true;
        "browser.discovery.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "datareporting.healthreport.service.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.sessions.current.clean" = true;
        "devtools.onboarding.telemetry.logged" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.prompted" = 2;
        "toolkit.telemetry.rejected" = true;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.server" = "";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.unifiedIsOptIn" = false;
        "toolkit.telemetry.updatePing.enabled" = false;

        "privacy.trackingprotection.enabled" = true;

        "browser.tabs.inTitlebar" = 0;

        "sidebar.verticalTabs" = true;
        "sidebar.revamp" = true;
        "sidebar.main.tools" = [ "history" "bookmarks" ];

        "browser.uicustomization.state" = builtins.toJSON {
          placements = {
            unified-extensions-area = [];
            widget-overflow-fixed-list = [];
            nav-bar = [
              "back-button"
              "forward-button"
              "undo-closed-tab"
              "vertical-spacer"
              "stop-reload-button"
              "urlbar-container"
              "vertical-spacer"
              "adnauseam_rednoise_org-browser-action"
              "unified-extensions-button"
            ];
            toolbar-menubar = [ "menubar-items" ];
            TabsToolbar = [];
            vertical-tabs = [ "tabbrowser-tabs" ];
            PersonalToolbar = [ "sidebar-button" "personal-bookmarks" ];
          };
          seen = [
            "developer-button"
            "profile-manager-button"
            "undo-closed-tab"
            "workspaces-toolbar-button"
            "screenshot-button"
            "_34daeb50-c2d2-4f14-886a-7160b24d66a4_-browser-action"
            "_762f9885-5a13-4abd-9c77-433dcd38b8fd_-browser-action"
            "_cb31ec5d-c49a-4e5a-b240-16c767444f62_-browser-action"
            "_0507f777-2480-4d48-baf1-3b9c8feeb2b4_-browser-action"
            "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
            "adnauseam_rednoise_org-browser-action"
          ];
          dirtyAreaCache = [
            "navbar"
            "TabsToolbar"
            "vertical-tabs"
            "nora-statusbar"
            "PersonalToolbar"
            "unified-extensions-area"
            "toolbar-menubar"
          ];
          currentVersion = 23;
          newElementCount = 2;
        };
      };
    };
  };
}
