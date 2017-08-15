AdobeGPOTemplates PowerShell Module
==========================

**AdobeGPOTemplates module was designed to help create group policies (GPO) ADMX templates to configure and harden Adobe Reader and Adobe Acrobat.**

## Table of Contents  
* [HKLM](#HKLM)
  * [CloudServices](#Cloud Services)
  * [Embedded Content](#Embedded Content)
  * [Other](#Other)
  * [Security](#Security)
  * [Trusted Locations](#Trusted Locations)
  * [Updater](#Updater)    
* [HKCU](#HKCU)
  * [Embedded Content](#Embedded Content)
  * [Security](#Security)
  * [Trusted Locations](#Trusted Locations)
  * [Updater](#Updater)

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/index.html

<a name="HKLM"/>

## HKLM

<a name="CloudServices"/>

### Cloud Services

http://www.adobe.com/devnet-docs/acrobatetk/tools/AdminGuide/services.html
http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Workflows.html

#### bAdobeSendPluginToggle

![test](https://github.com/favicon.ico)
<img src="https://github.com/favicon.ico" width="48">

![Alt text](Media/HKLM/bAdobeSendPluginToggle-GPO-UI.JPG "bAdobeSendPluginToggle-GPO-UI")
![Alt text](Media/HKLM/bAdobeSendPluginToggle-reg.JPG?raw=true "bAdobeSendPluginToggle-reg")
![Alt text](Media/HKLM/bAdobeSendPluginToggle-web.JPG?raw=true "bAdobeSendPluginToggle-web")

#### bDisableSharePointFeatures

![Alt text](Media/HKLM/bDisableSharePointFeatures-GPO-UI.JPG?raw=true "bDisableSharePointFeatures-GPO-UI")
![Alt text](Media/HKLM/bDisableSharePointFeatures-reg.JPG?raw=true "bDisableSharePointFeatures-reg")
![Alt text](Media/HKLM/bDisableSharePointFeatures-web.JPG?raw=true "bDisableSharePointFeatures-web")

#### bToggleAdobeDocumentServices

![Alt text](Media/HKLM/bToggleAdobeDocumentServices-GPO-UI.JPG?raw=true "bToggleAdobeDocumentServices-GPO-UI")
![Alt text](Media/HKLM/bToggleAdobeDocumentServices-reg.JPG?raw=true "bToggleAdobeDocumentServices-reg")
![Alt text](Media/HKLM/bToggleAdobeDocumentServices-web.JPG?raw=true "bToggleAdobeDocumentServices-web")

#### bToggleAdobeSign

![Alt text](Media/HKLM/bToggleAdobeSign-GPO-UI.JPG?raw=true "bToggleAdobeSign-GPO-UI")
![Alt text](Media/HKLM/bToggleAdobeSign-reg.JPG?raw=true "bToggleAdobeSign-reg")
![Alt text](Media/HKLM/bToggleAdobeSign-web.JPG?raw=true "bToggleAdobeSign-reg")

#### bToggleFillSign

![Alt text](Media/HKLM/bToggleFillSign-GPO-UI.JPG?raw=true "bToggleFillSign-GPO-UI")
![Alt text](Media/HKLM/bToggleFillSign-reg.JPG?raw=true "bToggleFillSign-reg")
![Alt text](Media/HKLM/bToggleFillSign-web.JPG?raw=true "bToggleFillSign-web")

#### bTogglePrefsSync

![Alt text](Media/HKLM/bTogglePrefsSync-GPO-UI.JPG?raw=true "bTogglePrefsSync-GPO-UI")
![Alt text](Media/HKLM/bTogglePrefsSync-reg.JPG?raw=true "bTogglePrefsSync-reg")
![Alt text](Media/HKLM/bTogglePrefsSync-web.JPG?raw=true "bTogglePrefsSync-web")

#### bToggleSendAndTrack

![Alt text](Media/HKLM/bToggleSendAndTrack-GPO-UI.JPG?raw=true "bToggleSendAndTrack-GPO-UI")
![Alt text](Media/HKLM/bToggleSendAndTrack-reg.JPG?raw=true "bToggleSendAndTrack-reg")
![Alt text](Media/HKLM/bToggleSendAndTrack-web.JPG?raw=true "bToggleSendAndTrack-web")

#### bToggleWebConnectors

![Alt text](Media/HKLM/bToggleWebConnectors-GPO-UI.JPG?raw=true "bToggleWebConnectors-GPO-UI")
![Alt text](Media/HKLM/bToggleWebConnectors-reg.JPG?raw=true "bToggleWebConnectors-reg")
![Alt text](Media/HKLM/bToggleWebConnectors-web.JPG?raw=true "bToggleWebConnectors-web")

#### bDisableADCFileStore

![Alt text](Media/HKLM/bDisableADCFileStore-GPO-UI.JPG?raw=true "bDisableADCFileStore-GPO-UI")
![Alt text](Media/HKLM/bDisableADCFileStore-reg.JPG?raw=true "bDisableADCFileStore-reg")
![Alt text](Media/HKLM/bDisableADCFileStore-web.JPG?raw=true "bDisableADCFileStore-web")

#### bDisableWebmail

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/WebMail.html

![Alt text](Media/HKLM/bDisableWebmail-GPO-UI.JPG?raw=true "bDisableWebmail-GPO-UI")
![Alt text](Media/HKLM/bDisableWebmail-reg.JPG?raw=true "bDisableWebmail-reg")
![Alt text](Media/HKLM/bDisableWebmail-web.JPG?raw=true "bDisableWebmail-web")

<a name="Embedded Content"/>

### Embedded Content

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/JSPrefs.html

![Alt text](Media/HKLM/bDisableJavaScript-GPO-UI.JPG?raw=true "bDisableJavaScript-GPO-UI")
![Alt text](Media/HKLM/bDisableJavaScript-reg.JPG?raw=true "bDisableJavaScript-reg")
![Alt text](Media/HKLM/bDisableJavaScript-web.JPG?raw=true "bDisableJavaScript-web")

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/3D.html

![Alt text](Media/HKLM/bEnable3D-GPO-UI.JPG?raw=true "bEnable3D-GPO-UI")
![Alt text](Media/HKLM/bEnable3D-reg.JPG?raw=true "bEnable3D-reg")
![Alt text](Media/HKLM/bEnable3D-web.JPG?raw=true "bEnable3D-web")

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

![Alt text](Media/HKLM/iUnknownURLPerms-GPO-UI.JPG?raw=true "iUnknownURLPerms-GPO-UI")
![Alt text](Media/HKLM/iUnknownURLPerms-reg.JPG?raw=true "iUnknownURLPerms-reg")
![Alt text](Media/HKLM/iUnknownURLPerms-web.JPG?raw=true "iUnknownURLPerms-web")

<a name="Other"/>

### Other

#### bAcroSuppressUpsell

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/FeatureLockdown.html

![Alt text](Media/HKLM/bAcroSuppressUpsell-GPO-UI.JPG?raw=true "bAcroSuppressUpsell-GPO-UI")
![Alt text](Media/HKLM/bAcroSuppressUpsell-reg.JPG?raw=true "bAcroSuppressUpsell-reg")
![Alt text](Media/HKLM/bAcroSuppressUpsell-web.JPG?raw=true "bAcroSuppressUpsell-web")

#### bDontShowMsgWhenViewingDoc

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/IPM.html

![Alt text](Media/HKLM/bDontShowMsgWhenViewingDoc-GPO-UI.JPG?raw=true "bDontShowMsgWhenViewingDoc-GPO-UI")
![Alt text](Media/HKLM/bDontShowMsgWhenViewingDoc-reg.JPG?raw=true "bDontShowMsgWhenViewingDoc-reg")
![Alt text](Media/HKLM/bDontShowMsgWhenViewingDoc-web.JPG?raw=true "bDontShowMsgWhenViewingDoc-web")

#### bShowMsgAtLaunch

![Alt text](Media/HKLM/bShowMsgAtLaunch-GPO-UI.JPG?raw=true "bShowMsgAtLaunch-GPO-UI")
![Alt text](Media/HKLM/bShowMsgAtLaunch-reg.JPG?raw=true "bShowMsgAtLaunch-reg")
![Alt text](Media/HKLM/bShowMsgAtLaunch-web.JPG?raw=true "bShowMsgAtLaunch-web")

#### bShowWelcomeScreen

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/AVGeneral.html

![Alt text](Media/HKLM/bShowWelcomeScreen-GPO-UI.JPG?raw=true "bShowWelcomeScreen-GPO-UI")
![Alt text](Media/HKLM/bShowWelcomeScreen-reg.JPG?raw=true "bShowWelcomeScreen-reg")
![Alt text](Media/HKLM/bShowWelcomeScreen-web.JPG?raw=true "bShowWelcomeScreen-web")

#### bUsageMeasurement

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/UsageMeasurement.html

![Alt text](Media/HKLM/bUsageMeasurement-GPO-UI.JPG?raw=true "bUsageMeasurement-GPO-UI")
![Alt text](Media/HKLM/bUsageMeasurement-reg.JPG?raw=true "bUsageMeasurement-reg")
![Alt text](Media/HKLM/bUsageMeasurement-web.JPG?raw=true "bUsageMeasurement-web")

<a name="Security"/>

### Security

#### bDisablePDFHandlerSwitching

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/FeatureLockdown.html

![Alt text](Media/HKLM/bDisablePDFHandlerSwitching-GPO-UI.JPG?raw=true "bDisablePDFHandlerSwitching-GPO-UI")
![Alt text](Media/HKLM/bDisablePDFHandlerSwitching-reg.JPG?raw=true "bDisablePDFHandlerSwitching-reg")
![Alt text](Media/HKLM/bDisablePDFHandlerSwitching-web.JPG?raw=true "bDisablePDFHandlerSwitching-web")

#### bEnhancedSecurityInBrowser

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

![Alt text](Media/HKLM/bEnhancedSecurityInBrowser-GPO-UI.JPG?raw=true "bEnhancedSecurityInBrowser-GPO-UI")
![Alt text](Media/HKLM/bEnhancedSecurityInBrowser-reg.JPG?raw=true "bEnhancedSecurityInBrowser-reg")
![Alt text](Media/HKLM/bEnhancedSecurityInBrowser-web.JPG?raw=true "bEnhancedSecurityInBrowser-web")

#### bEnhancedSecurityStandalone

![Alt text](Media/HKLM/bEnhancedSecurityStandalone-GPO-UI.JPG?raw=true "bEnhancedSecurityStandalone-GPO-UI")
![Alt text](Media/HKLM/bEnhancedSecurityStandalone-reg.JPG?raw=true "bEnhancedSecurityStandalone-reg")
![Alt text](Media/HKLM/bEnhancedSecurityStandalone-web.JPG?raw=true "bEnhancedSecurityStandalone-web")

#### bProtectedMode
http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Privileged.html

![Alt text](Media/HKLM/bProtectedMode-GPO-UI.JPG?raw=true "bProtectedMode-GPO-UI")
![Alt text](Media/HKLM/bProtectedMode-reg.JPG?raw=true "bProtectedMode-reg")
![Alt text](Media/HKLM/bProtectedMode-web.JPG?raw=true "bProtectedMode-web")

#### iProtectedView

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

![Alt text](Media/HKLM/iProtectedView-GPO-UI.JPG?raw=true "iProtectedView-GPO-UI")
![Alt text](Media/HKLM/iProtectedView-reg.JPG?raw=true "iProtectedView-reg")
![Alt text](Media/HKLM/iProtectedView-web.JPG?raw=true "iProtectedView-web")

<a name="Trusted Locations"/>

### Trusted Locations

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

#### bDisableOSTrustedSites

![Alt text](Media/HKLM/bDisableOSTrustedSites-GPO-UI.JPG?raw=true "bDisableOSTrustedSites-GPO-UI")
![Alt text](Media/HKLM/bDisableOSTrustedSites-reg.JPG?raw=true "bDisableOSTrustedSites-reg")
![Alt text](Media/HKLM/bDisableOSTrustedSites-web.JPG?raw=true "bDisableOSTrustedSites-web")

#### bDisableTrustedFolders

![Alt text](Media/HKLM/bDisableTrustedFolders-GPO-UI.JPG?raw=true "bDisableTrustedFolders-GPO-UI")
![Alt text](Media/HKLM/bDisableTrustedFolders-reg.JPG?raw=true "bDisableTrustedFolders-reg")
![Alt text](Media/HKLM/bDisableTrustedFolders-web.JPG?raw=true "bDisableTrustedFolders-web")

#### bDisableTrustedSites

![Alt text](Media/HKLM/bDisableTrustedSites-GPO-UI.JPG?raw=true "bDisableTrustedSites-GPO-UI")
![Alt text](Media/HKLM/bDisableTrustedSites-reg.JPG?raw=true "bDisableTrustedSites-reg")
![Alt text](Media/HKLM/bDisableTrustedSites-web.JPG?raw=true "bDisableTrustedSites-web")

#### bEnableCertificateBasedTrust-

![Alt text](Media/HKLM/bEnableCertificateBasedTrust-GPO-UI.JPG?raw=true "bEnableCertificateBasedTrust-GPO-UI")
![Alt text](Media/HKLM/bEnableCertificateBasedTrust-reg.JPG?raw=true "bEnableCertificateBasedTrust-reg")
![Alt text](Media/HKLM/bEnableCertificateBasedTrust-web.JPG?raw=true "bEnableCertificateBasedTrust-web")

#### iURLPerms

![Alt text](Media/HKLM/iURLPerms-GPO-UI.JPG?raw=true "iURLPerms-GPO-UI")
![Alt text](Media/HKLM/iURLPerms-reg.JPG?raw=true "iURLPerms-reg")
![Alt text](Media/HKLM/iURLPerms-web.JPG?raw=true "iURLPerms-web")

<a name="Updater"/>

### Updater

#### bUpdater

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Updater-Win.html

![Alt text](Media/HKLM/bUpdater-GPO-UI.JPG?raw=true "bUpdater-GPO-UI")
![Alt text](Media/HKLM/bUpdater-reg.JPG?raw=true "bUpdater-reg")
![Alt text](Media/HKLM/bUpdater-web.JPG?raw=true "bUpdater-web")

#### bUpdater

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Workflows.html

![Alt text](Media/HKLM/cServices-bUpdater-GPO-UI.JPG?raw=true "cServices-bUpdater-GPO-UI")
![Alt text](Media/HKLM/cServices-bUpdater-reg.JPG?raw=true "cServices-bUpdater-reg")
![Alt text](Media/HKLM/cServices-bUpdater-web.JPG?raw=true "cServices-bUpdater-web")

<a name="HKCU"/>

## HKCU

<a name="Embedded Content"/>

### Embedded Content

#### b3DEnableContent

![Alt text](Media/HKCU/b3DEnableContent-GPO-UI.JPG?raw=true "b3DEnableContent-GPO-UI")
![Alt text](Media/HKCU/b3DEnableContent-reg.JPG?raw=true "b3DEnableContent-reg")
![Alt text](Media/HKCU/b3DEnableContent-web.JPG?raw=true "b3DEnableContent-web")

#### bSecureOpenFile

![Alt text](Media/HKCU/bSecureOpenFile-GPO-UI.JPG?raw=true "bSecureOpenFile-GPO-UI")
![Alt text](Media/HKCU/bSecureOpenFile-reg.JPG?raw=true "bSecureOpenFile-reg")

#### bAllowOpenFile

![Alt text](Media/HKCU/bAllowOpenFile-GPO-UI.JPG?raw=true "bAllowOpenFile-GPO-UI")
![Alt text](Media/HKCU/bAllowOpenFile-reg.JPG?raw=true "bAllowOpenFile-reg")

#### bAutoUriDetect

![Alt text](Media/HKCU/bAutoUriDetect-GPO-UI.JPG?raw=true "bAutoUriDetect-GPO-UI")
![Alt text](Media/HKCU/bAutoUriDetect-reg.JPG?raw=true "bAutoUriDetect-reg")

#### bEnableJS

![Alt text](Media/HKCU/bEnableJS-GPO-UI.JPG?raw=true "bEnableJS-GPO-UI")
![Alt text](Media/HKCU/bEnableJS-reg.JPG?raw=true "bEnableJS-reg")
![Alt text](Media/HKCU/bEnableJS-web.JPG?raw=true "bEnableJS-web")

<a name="Security"/>

### Security

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/Security.html

#### bAskBeforeInstalling

![Alt text](Media/HKCU/bAskBeforeInstalling-AATL-GPO-UI.JPG?raw=true "bAskBeforeInstalling-AATL-GPO-UI")
![Alt text](Media/HKCU/bAskBeforeInstalling-AATL-reg.JPG?raw=true "bAskBeforeInstalling-AATL-reg")
![Alt text](Media/HKCU/bAskBeforeInstalling-AATL-web.JPG?raw=true "bAskBeforeInstalling-AATL-web")

#### bAskBeforeInstalling

![Alt text](Media/HKCU/bAskBeforeInstalling-EUTL-GPO-UI.JPG?raw=true "bAskBeforeInstalling-EUTL-GPO-UI")
![Alt text](Media/HKCU/bAskBeforeInstalling-EUTL-reg.JPG?raw=true "bAskBeforeInstalling-EUTL-reg")
![Alt text](Media/HKCU/bAskBeforeInstalling-EUTL-web.JPG?raw=true "bAskBeforeInstalling-EUTL-web")

#### bLoadSettingsFromURL

![Alt text](Media/HKCU/bLoadSettingsFromURL-AATL-GPO-UI.JPG?raw=true "bLoadSettingsFromURL-AATL-GPO-UI")
![Alt text](Media/HKCU/bLoadSettingsFromURL-AATL-reg.JPG?raw=true "bLoadSettingsFromURL-AATL-reg")
![Alt text](Media/HKCU/bLoadSettingsFromURL-AATL-web.JPG?raw=true "bLoadSettingsFromURL-AATL-web")

#### bLoadSettingsFromURL

![Alt text](Media/HKCU/bLoadSettingsFromURL-EUTL-reg.JPG?raw=true "bLoadSettingsFromURL-EUTL-reg")

#### iProtectedView

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

![Alt text](Media/HKCU/iProtectedView-GPO-UI.JPG?raw=true "iProtectedView-GPO-UI")
![Alt text](Media/HKCU/iProtectedView-reg.JPG?raw=true "iProtectedView-reg")

<a name="Trusted Locations"/>

### Trusted Locations

#### bFipsMode
http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/AVGeneral.html

![Alt text](Media/HKCU/bFipsMode-GPO-UI.JPG?raw=true "bFipsMode-GPO-UI")
![Alt text](Media/HKCU/bFipsMode-reg.JPG?raw=true "bFipsMode-reg")
![Alt text](Media/HKCU/bFipsMode-web.JPG?raw=true "bFipsMode-web")

#### bTrustOSTrustedSites

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/TrustManager.html

![Alt text](Media/HKCU/bTrustOSTrustedSites-GPO-UI.JPG?raw=true "bTrustOSTrustedSites-GPO-UI")
![Alt text](Media/HKCU/bTrustOSTrustedSites-reg.JPG?raw=true "bTrustOSTrustedSites-reg")
![Alt text](Media/HKCU/bTrustOSTrustedSites-web.JPG?raw=true "bTrustOSTrustedSites-web")

<a name="Updater"/>

### Updater

#### EULA

http://www.adobe.com/devnet-docs/acrobatetk/tools/PrefRef/Windows/AdobeViewer.html

![Alt text](Media/HKCU/EULA-GPO-UI.JPG?raw=true "EULA-GPO-UI")
![Alt text](Media/HKCU/EULA-reg.JPG?raw=true "EULA-reg")
![Alt text](Media/HKCU/EULA-web.JPG?raw=true "EULA-web")
