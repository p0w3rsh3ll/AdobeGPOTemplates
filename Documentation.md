AdobeGPOTemplates PowerShell Module
==========================

**AdobeGPOTemplates module was designed to help create group policies (GPO) ADMX templates to configure and harden Adobe Reader and Adobe Acrobat.**

## Table of Contents  
* [HKLM](#HKLM)
  * [Cloud Services](#CloudServices)
  * [Embedded Content](#EmbeddedContent)
  * [Other](#Other)
  * [Security](#Security)
  * [Trusted Locations](#TrustedLocations)
  * [Updater](#Updater)    
* [HKCU](#HKCU)
  * [Embedded Content](#HKCUEmbeddedContent)
  * [Security](#HKCUSecurity)
  * [Trusted Locations](#HKCUTrustedLocations)
  * [Updater](#HKCUUpdater)

[http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/index.html](http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/index.html)

<a name="HKLM"/>

## HKLM

<a name="CloudServices"/>

### Cloud Services

[http://www.adobe.com/devnet-docs/acrobatetk/tools/AdminGuide/services.html](http://www.adobe.com/devnet-docs/acrobatetk/tools/AdminGuide/services.html)

[http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Workflows.html](http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Workflows.html)


#### bAdobeSendPluginToggle

<img src=Media/HKLM/bAdobeSendPluginToggle-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bAdobeSendPluginToggle-reg.JPG  width="600">
<img src=Media/HKLM/bAdobeSendPluginToggle-web.JPG  width="600">


#### bDisableSharePointFeatures

<img src=Media/HKLM/bDisableSharePointFeatures-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDisableSharePointFeatures-reg.JPG  width="600">
<img src=Media/HKLM/bDisableSharePointFeatures-web.JPG  width="600">

#### bToggleAdobeDocumentServices

<img src=Media/HKLM/bToggleAdobeDocumentServices-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bToggleAdobeDocumentServices-reg.JPG  width="600">
<img src=Media/HKLM/bToggleAdobeDocumentServices-web.JPG  width="600">

#### bToggleAdobeSign

<img src=Media/HKLM/bToggleAdobeSign-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bToggleAdobeSign-reg.JPG  width="600">
<img src=Media/HKLM/bToggleAdobeSign-web.JPG  width="600">

#### bToggleFillSign

<img src=Media/HKLM/bToggleFillSign-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bToggleFillSign-reg.JPG  width="600">
<img src=Media/HKLM/bToggleFillSign-web.JPG  width="600">

#### bTogglePrefsSync

<img src=Media/HKLM/bTogglePrefsSync-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bTogglePrefsSync-reg.JPG  width="600">
<img src=Media/HKLM/bTogglePrefsSync-web.JPG  width="600">

#### bToggleSendAndTrack

<img src=Media/HKLM/bToggleSendAndTrack-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bToggleSendAndTrack-reg.JPG  width="600">
<img src=Media/HKLM/bToggleSendAndTrack-web.JPG  width="600">

#### bToggleWebConnectors

<img src=Media/HKLM/bToggleWebConnectors-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bToggleWebConnectors-reg.JPG  width="600">
<img src=Media/HKLM/bToggleWebConnectors-web.JPG  width="600">

#### bDisableADCFileStore

<img src=Media/HKLM/bDisableADCFileStore-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDisableADCFileStore-reg.JPG  width="600">
<img src=Media/HKLM/bDisableADCFileStore-web.JPG  width="600">

#### bDisableWebmail

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/WebMail.html

<img src=Media/HKLM/bDisableWebmail-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDisableWebmail-reg.JPG  width="600">
<img src=Media/HKLM/bDisableWebmail-web.JPG  width="600">

<a name="EmbeddedContent"/>

### Embedded Content

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/JSPrefs.html

<img src=Media/HKLM/bDisableJavaScript-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDisableJavaScript-reg.JPG  width="600">
<img src=Media/HKLM/bDisableJavaScript-web.JPG  width="600">

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/3D.html

<img src=Media/HKLM/bEnable3D-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bEnable3D-reg.JPG  width="600">
<img src=Media/HKLM/bEnable3D-web.JPG  width="600">

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

<img src=Media/HKLM/iUnknownURLPerms-GPO-UI.JPG  width="600">
<img src=Media/HKLM/iUnknownURLPerms-reg.JPG  width="600">
<img src=Media/HKLM/iUnknownURLPerms-web.JPG  width="600">

<a name="Other"/>

### Other

#### bIsSCReducedModeEnforcedEx

https://helpx.adobe.com/acrobat/kb/acrobat-unified-installer-windows-overview.html

https://www.adobe.com/devnet-docs/acrobatetk/tools/Wizard/installoptions.html#suppress-sign-in

https://www.adobe.com/devnet-docs/acrobatetk/tools/DesktopDeployment/singleinstaller.html#installing-on-a-clean-machine

#### bEnableGentech

https://helpx.adobe.com/acrobat/using/disable-generative-ai.html

#### bEnableAV2Enterprise

<img src=Media/HKLM/bEnableAV2Enterprise.PNG  width="600">

#### ENABLE_CHROMEEXT

<img src=Media/HKLM/ENABLE_CHROMEEXT.PNG  width="600">

#### bSendMailShareRedirection

<img src=Media/HKLM/bSendMailShareRedirection-UI.JPG  width="600">
<img src=Media/HKLM/bSendMailShareRedirection-reg.JPG  width="600">

https://helpx.adobe.com/acrobat/kb/send-email-attachment.html

#### bAcroSuppressUpsell

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/FeatureLockdown.html

<img src=Media/HKLM/bAcroSuppressUpsell-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bAcroSuppressUpsell-reg.JPG  width="600">
<img src=Media/HKLM/bAcroSuppressUpsell-web.JPG  width="600">

#### bDontShowMsgWhenViewingDoc

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/IPM.html

<img src=Media/HKLM/bDontShowMsgWhenViewingDoc-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDontShowMsgWhenViewingDoc-reg.JPG  width="600">
<img src=Media/HKLM/bDontShowMsgWhenViewingDoc-web.JPG  width="600">

#### bShowMsgAtLaunch

<img src=Media/HKLM/bShowMsgAtLaunch-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bShowMsgAtLaunch-reg.JPG  width="600">
<img src=Media/HKLM/bShowMsgAtLaunch-web.JPG  width="600">

#### bShowWelcomeScreen

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/AVGeneral.html

<img src=Media/HKLM/bShowWelcomeScreen-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bShowWelcomeScreen-reg.JPG  width="600">
<img src=Media/HKLM/bShowWelcomeScreen-web.JPG  width="600">

#### bUsageMeasurement

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/UsageMeasurement.html

<img src=Media/HKLM/bUsageMeasurement-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bUsageMeasurement-reg.JPG  width="600">
<img src=Media/HKLM/bUsageMeasurement-web.JPG  width="600">

<a name="Security"/>

### Security

#### bDisablePDFHandlerSwitching

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/FeatureLockdown.html

<img src=Media/HKLM/bDisablePDFHandlerSwitching-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDisablePDFHandlerSwitching-reg.JPG  width="600">
<img src=Media/HKLM/bDisablePDFHandlerSwitching-web.JPG  width="600">

#### bEnhancedSecurityInBrowser

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

<img src=Media/HKLM/bEnhancedSecurityInBrowser-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bEnhancedSecurityInBrowser-reg.JPG  width="600">
<img src=Media/HKLM/bEnhancedSecurityInBrowser-web.JPG  width="600">

#### bEnhancedSecurityStandalone

<img src=Media/HKLM/bEnhancedSecurityStandalone-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bEnhancedSecurityStandalone-reg.JPG  width="600">
<img src=Media/HKLM/bEnhancedSecurityStandalone-web.JPG  width="600">

#### bProtectedMode
http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Privileged.html

<img src=Media/HKLM/bProtectedMode-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bProtectedMode-reg.JPG  width="600">
<img src=Media/HKLM/bProtectedMode-web.JPG  width="600">

#### iProtectedView

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

<img src=Media/HKLM/iProtectedView-GPO-UI.JPG  width="600">
<img src=Media/HKLM/iProtectedView-reg.JPG  width="600">
<img src=Media/HKLM/iProtectedView-web.JPG  width="600">

<a name="TrustedLocations"/>

### Trusted Locations

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

#### bDisableOSTrustedSites

<img src=Media/HKLM/bDisableOSTrustedSites-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDisableOSTrustedSites-reg.JPG  width="600">
<img src=Media/HKLM/bDisableOSTrustedSites-web.JPG  width="600">

#### bDisableTrustedFolders

<img src=Media/HKLM/bDisableTrustedFolders-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDisableTrustedFolders-reg.JPG  width="600">
<img src=Media/HKLM/bDisableTrustedFolders-web.JPG  width="600">

#### bDisableTrustedSites

<img src=Media/HKLM/bDisableTrustedSites-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bDisableTrustedSites-reg.JPG  width="600">
<img src=Media/HKLM/bDisableTrustedSites-web.JPG  width="600">

#### bEnableCertificateBasedTrust-

<img src=Media/HKLM/bEnableCertificateBasedTrust-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bEnableCertificateBasedTrust-reg.JPG  width="600">
<img src=Media/HKLM/bEnableCertificateBasedTrust-web.JPG  width="600">

#### iURLPerms

<img src=Media/HKLM/iURLPerms-GPO-UI.JPG  width="600">
<img src=Media/HKLM/iURLPerms-reg.JPG  width="600">
<img src=Media/HKLM/iURLPerms-web.JPG  width="600">

<a name="Updater"/>

### Updater

#### bUpdater

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Updater-Win.html

<img src=Media/HKLM/bUpdater-GPO-UI.JPG  width="600">
<img src=Media/HKLM/bUpdater-reg.JPG  width="600">
<img src=Media/HKLM/bUpdater-web.JPG  width="600">

#### bUpdater

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Workflows.html

<img src=Media/HKLM/cServices-bUpdater-GPO-UI.JPG  width="600">
<img src=Media/HKLM/cServices-bUpdater-reg.JPG  width="600">
<img src=Media/HKLM/cServices-bUpdater-web.JPG  width="600">

<a name="HKCU"/>

## HKCU

<a name="HKCUEmbeddedContent"/>

### Embedded Content

#### b3DEnableContent

<img src=Media/HKCU/b3DEnableContent-GPO-UI.JPG  width="600">
<img src=Media/HKCU/b3DEnableContent-reg.JPG  width="600">
<img src=Media/HKCU/b3DEnableContent-web.JPG  width="600">

#### bSecureOpenFile

<img src=Media/HKCU/bSecureOpenFile-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bSecureOpenFile-reg.JPG  width="600">

#### bAllowOpenFile

<img src=Media/HKCU/bAllowOpenFile-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bAllowOpenFile-reg.JPG  width="600">

#### bAutoUriDetect

<img src=Media/HKCU/bAutoUriDetect-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bAutoUriDetect-reg.JPG  width="600">

#### bEnableJS

<img src=Media/HKCU/bEnableJS-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bEnableJS-reg.JPG  width="600">
<img src=Media/HKCU/bEnableJS-web.JPG  width="600">

<a name="HKCUSecurity"/>

### Security

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Security.html

#### bAskBeforeInstalling

<img src=Media/HKCU/bAskBeforeInstalling-AATL-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bAskBeforeInstalling-AATL-reg.JPG  width="600">
<img src=Media/HKCU/bAskBeforeInstalling-AATL-web.JPG  width="600">

#### bAskBeforeInstalling

<img src=Media/HKCU/bAskBeforeInstalling-EUTL-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bAskBeforeInstalling-EUTL-reg.JPG  width="600">
<img src=Media/HKCU/bAskBeforeInstalling-EUTL-web.JPG  width="600">

#### bLoadSettingsFromURL AATL

<img src=Media/HKCU/bLoadSettingsFromURL-AATL-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bLoadSettingsFromURL-AATL-reg.JPG  width="600">
<img src=Media/HKCU/bLoadSettingsFromURL-AATL-web.JPG  width="600">

#### bLoadSettingsFromURL EUTL

<img src=Media/HKCU/bLoadSettingsFromURL-EUTL-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bLoadSettingsFromURL-EUTL-reg.JPG  width="600">
<img src=Media/HKCU/bLoadSettingsFromURL-EUTL-web.JPG  width="600">

#### bLoadSettingsFromURL Custom

<img src=Media/HKCU/bLoadSettingsFromURL-Cust-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bLoadSettingsFromURL-Cust-reg.JPG  width="600">

#### iProtectedView

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

<img src=Media/HKCU/iProtectedView-GPO-UI.JPG  width="600">
<img src=Media/HKCU/iProtectedView-reg.JPG  width="600">
<img src=Media/HKCU/iProtectedView-web.JPG  width="600">

<a name="HKCUTrustedLocations"/>

### Trusted Locations

#### bFipsMode
http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/AVGeneral.html

<img src=Media/HKCU/bFipsMode-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bFipsMode-reg.JPG  width="600">
<img src=Media/HKCU/bFipsMode-web.JPG  width="600">

#### bTrustOSTrustedSites

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

<img src=Media/HKCU/bTrustOSTrustedSites-GPO-UI.JPG  width="600">
<img src=Media/HKCU/bTrustOSTrustedSites-reg.JPG  width="600">
<img src=Media/HKCU/bTrustOSTrustedSites-web.JPG  width="600">

<a name="HKCUUpdater"/>

### Updater

#### EULA

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/AdobeViewer.html

<img src=Media/HKCU/EULA-GPO-UI.JPG  width="600">
<img src=Media/HKCU/EULA-reg.JPG  width="600">
<img src=Media/HKCU/EULA-web.JPG  width="600">
