/**
 * Firefox User Preferences
 *
 * This is heavily based on https://github.com/pyllyukko/user.js
 */

// Disable DOM timing API
// https://wiki.mozilla.org/Security/Reviews/Firefox/NavigationTimingAPI
// https://www.w3.org/TR/navigation-timing/#privacy
user_pref("dom.enable_performance", false);

// Make sure the User Timing API does not provide a new high resolution timestamp
// https://trac.torproject.org/projects/tor/ticket/16336
// https://www.w3.org/TR/2013/REC-user-timing-20131212/#privacy-security
user_pref("dom.enable_user_timing", false);

// Disable leaking network/browser connection information via Javascript
// Network Information API provides general information about the system's connection type (WiFi, cellular, etc.)
// https://developer.mozilla.org/en-US/docs/Web/API/Network_Information_API
// https://wicg.github.io/netinfo/#privacy-considerations
// https://bugzilla.mozilla.org/show_bug.cgi?id=960426
user_pref("dom.netinfo.enabled", false);

// Disable battery API (Firefox < 52)
// https://developer.mozilla.org/en-US/docs/Web/API/BatteryManager
// https://bugzilla.mozilla.org/show_bug.cgi?id=1313580
user_pref("dom.battery.enabled", false);

// Disable "beacon" asynchronous HTTP transfers (used for analytics)
// https://developer.mozilla.org/en-US/docs/Web/API/navigator.sendBeacon
user_pref("beacon.enabled", false);

// Disable clipboard event detection (onCut/onCopy/onPaste) via Javascript
// NOTICE: Disabling clipboard events breaks Ctrl+C/X/V copy/cut/paste functionaility in JS-based web applications (Google Docs...)
// https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/Preference_reference/dom.event.clipboardevents.enabled
user_pref("dom.event.clipboardevents.enabled", true);

// Disable "copy to clipboard" functionality via Javascript (Firefox >= 41)
// NOTICE: Disabling clipboard operations will break legitimate JS-based "copy to clipboard" functionality
// https://hg.mozilla.org/mozilla-central/rev/2f9f8ea4b9c3
user_pref("dom.allow_cut_copy", true);

// Disable sensor API
// https://wiki.mozilla.org/Sensor_API
user_pref("device.sensors.enabled", false);

// Disable pinging URIs specified in HTML <a> ping= attributes
// http://kb.mozillazine.org/Browser.send_pings
user_pref("browser.send_pings",	false);

// Disable resource timing API
// https://www.w3.org/TR/resource-timing/#privacy-security
user_pref("dom.enable_resource_timing",	false);

// Disable video stats to reduce fingerprinting threat
// https://bugzilla.mozilla.org/show_bug.cgi?id=654550
// https://github.com/pyllyukko/user.js/issues/9#issuecomment-100468785
// https://github.com/pyllyukko/user.js/issues/9#issuecomment-148922065
user_pref("media.video_stats.enabled", false);

// Don't reveal build ID
// Value taken from Tor Browser
// https://bugzilla.mozilla.org/show_bug.cgi?id=583181
user_pref("general.buildID.override", "20100101");
user_pref("browser.startup.homepage_override.buildID", "20100101");

// Prevent font fingerprinting
// https://browserleaks.com/fonts
// https://github.com/pyllyukko/user.js/issues/120
user_pref("browser.display.use_document_fonts",	1);

// Disable sending Flash Player crash reports
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);

// Updates addons automatically
// https://blog.mozilla.org/addons/how-to-turn-off-add-on-updates/
user_pref("extensions.update.enabled", true);

// PREF: Disable raw TCP socket support (mozTCPSocket)
// https://trac.torproject.org/projects/tor/ticket/18863
// https://www.mozilla.org/en-US/security/advisories/mfsa2015-97/
// https://developer.mozilla.org/docs/Mozilla/B2G_OS/API/TCPSocket
user_pref("dom.mozTCPSocket.enabled",	false);

// PREF: Don't reveal your internal IP when WebRTC is enabled (Firefox >= 42)
// https://wiki.mozilla.org/Media/WebRTC/Privacy
// https://github.com/beefproject/beef/wiki/Module%3A-Get-Internal-IP-WebRTC
user_pref("media.peerconnection.ice.no_host",	true); // Firefox >= 52

// Enable add-on and certificate blocklists (OneCRL) from Mozilla
// https://wiki.mozilla.org/Blocklisting
// https://blocked.cdn.mozilla.net/
// http://kb.mozillazine.org/Extensions.blocklist.enabled
// http://kb.mozillazine.org/Extensions.blocklist.url
// https://blog.mozilla.org/security/2015/03/03/revoking-intermediate-certificates-introducing-onecrl/
// Updated at interval defined in extensions.blocklist.interval (default: 86400)
user_pref("extensions.blocklist.enabled", true);
user_pref("services.blocklist.update_enabled", true);

// Decrease system information leakage to Mozilla blocklist update servers
// https://trac.torproject.org/projects/tor/ticket/16931
user_pref("extensions.blocklist.url", "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/");

// Disable system add-on updates (hidden & always-enabled add-ons from Mozilla)
// https://firefox-source-docs.mozilla.org/toolkit/mozapps/extensions/addon-manager/SystemAddons.html
// https://blog.mozilla.org/data/2018/08/20/effectively-measuring-search-in-firefox/
// https://github.com/pyllyukko/user.js/issues/419
// https://dxr.mozilla.org/mozilla-central/source/toolkit/mozapps/extensions/AddonManager.jsm#1248-1257
// NOTICE: Disabling system add-on updates prevents Mozilla from "hotfixing" your browser to patch critical problems (one possible use case from the documentation)
user_pref("extensions.systemAddon.update.enabled", false);

// Disable remote debugging
// https://developer.mozilla.org/en-US/docs/Tools/Remote_Debugging/Debugging_Firefox_Desktop
// https://developer.mozilla.org/en-US/docs/Tools/Tools_Toolbox#Advanced_settings
user_pref("devtools.debugger.remote-enabled", false);
user_pref("devtools.chrome.enabled", false);
user_pref("devtools.debugger.force-local", true);

// Disable Mozilla telemetry/experiments
// https://wiki.mozilla.org/Platform/Features/Telemetry
// https://wiki.mozilla.org/Privacy/Reviews/Telemetry
// https://wiki.mozilla.org/Telemetry
// https://www.mozilla.org/en-US/legal/privacy/firefox.html#telemetry
// https://support.mozilla.org/t5/Firefox-crashes/Mozilla-Crash-Reporter/ta-p/1715
// https://wiki.mozilla.org/Security/Reviews/Firefox6/ReviewNotes/telemetry
// https://gecko.readthedocs.io/en/latest/browser/experiments/experiments/manifest.html
// https://wiki.mozilla.org/Telemetry/Experiments
// https://support.mozilla.org/en-US/questions/1197144
// https://firefox-source-docs.mozilla.org/toolkit/components/telemetry/telemetry/internals/preferences.html#id1
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false)
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false)
user_pref("toolkit.telemetry.hybridContent.enabled", false)
user_pref("toolkit.telemetry.newProfilePing.enabled", false)
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false)
user_pref("toolkit.telemetry.server", false)
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false)
user_pref("toolkit.telemetry.updatePing.enabled", false)

user_pref("experiments.activeExperiment", false)
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
user_pref("network.allow-experiments", false)

user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false)
user_pref("browser.newtabpage.activity-stream.telemetry", false)
user_pref("browser.ping-centre.telemetry", false)

// Disallow Necko to do A/B testing
// https://trac.torproject.org/projects/tor/ticket/13170
user_pref("network.allow-experiments", false);

// Disable sending Firefox crash reports to Mozilla servers
// https://wiki.mozilla.org/Breakpad
// http://kb.mozillazine.org/Breakpad
// https://dxr.mozilla.org/mozilla-central/source/toolkit/crashreporter
// https://bugzilla.mozilla.org/show_bug.cgi?id=411490
// A list of submitted crash reports can be found at about:crashes
user_pref("breakpad.reportURL",	"");

// Disable sending reports of tab crashes to Mozilla (about:tabcrashed), don't nag user about unsent crash reports
// https://hg.mozilla.org/mozilla-central/file/tip/browser/app/profile/firefox.js
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);

// Disable FlyWeb (discovery of LAN/proximity IoT devices that expose a Web interface)
// https://wiki.mozilla.org/FlyWeb
// https://wiki.mozilla.org/FlyWeb/Security_scenarios
// https://docs.google.com/document/d/1eqLb6cGjDL9XooSYEEo7mE-zKQ-o-AuDTcEyNhfBMBM/edit
// http://www.ghacks.net/2016/07/26/firefox-flyweb
user_pref("dom.flyweb.enabled", false);

// Disable the UITour backend
// https://trac.torproject.org/projects/tor/ticket/19047#comment:3
user_pref("browser.uitour.enabled", false);

// Enable Firefox Tracking Protection
// https://wiki.mozilla.org/Security/Tracking_protection
// https://support.mozilla.org/en-US/kb/tracking-protection-firefox
// https://support.mozilla.org/en-US/kb/tracking-protection-pbm
// https://kontaxis.github.io/trackingprotectionfirefox/
// https://feeding.cloud.geek.nz/posts/how-tracking-protection-works-in-firefox/
user_pref("privacy.trackingprotection.enabled",	true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);

// Enable contextual identity Containers feature (Firefox >= 52)
// NOTICE: Containers are not available in Private Browsing mode
// https://wiki.mozilla.org/Security/Contextual_Identity_Project/Containers
user_pref("privacy.userContext.enabled", true);

// Enable Firefox's anti-fingerprinting mode ("resist fingerprinting" or RFP) (Tor Uplift project)
// https://wiki.mozilla.org/Security/Tor_Uplift/Tracking
// https://bugzilla.mozilla.org/show_bug.cgi?id=1333933
// https://wiki.mozilla.org/Security/Fingerprinting
// NOTICE: RFP breaks some keyboard shortcuts used in certain websites (see #443)
user_pref("privacy.resistFingerprinting", false);

// Disable collection/sending of the health report (healthreport.sqlite*)
// https://support.mozilla.org/en-US/kb/firefox-health-report-understand-your-browser-perf
// https://gecko.readthedocs.org/en/latest/toolkit/components/telemetry/telemetry/preferences.html
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
// "Allow Firefox to make personalized extension recommendations"
user_pref("browser.discovery.enabled", false);

// Disable Heartbeat  (Mozilla user rating telemetry)
// https://wiki.mozilla.org/Advocacy/heartbeat
// https://trac.torproject.org/projects/tor/ticket/19047
user_pref("browser.selfsupport.url", "");

// Disable Firefox Hello metrics collection
// https://groups.google.com/d/topic/mozilla.dev.platform/nyVkCx-_sFw/discussion
user_pref("loop.logDomains", false);

// Disable querying Google Application Reputation database for downloaded binary files
// https://www.mozilla.org/en-US/firefox/39.0/releasenotes/
// https://wiki.mozilla.org/Security/Application_Reputation
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

// Disable SHIELD
// https://support.mozilla.org/en-US/kb/shield
// https://bugzilla.mozilla.org/show_bug.cgi?id=1370801
user_pref("extensions.shield-recipe-client.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);

// Disable prefetching of <link rel="next"> URLs
// http://kb.mozillazine.org/Network.prefetch-next
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Link_prefetching_FAQ#Is_there_a_preference_to_disable_link_prefetching.3F
user_pref("network.prefetch-next", false);

// Disable DNS prefetching
// http://kb.mozillazine.org/Network.dns.disablePrefetch
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Controlling_DNS_prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// Disable the predictive service (Necko)
// https://wiki.mozilla.org/Privacy/Reviews/Necko
user_pref("network.predictor.enabled", false);\
user_pref("network.predictor.cleaned-up", true);

// Never check updates for search engines
// https://support.mozilla.org/en-US/kb/how-stop-firefox-making-automatic-connections#w_auto-update-checking
user_pref("browser.search.update", false);

// Disable Normandy
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.first_run", false);
user_pref("app.normandy.startupRolloutPrefs.extensions.fxmonitor.enabled", false);
