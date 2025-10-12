
Function New-AdobeGPOTemplate {
<#
    .SYNOPSIS
        Create Admx and Adml GPO templates for Adobe products

    .DESCRIPTION
        Create Admx and Adml GPO templates for Adobe Reader and Acrobat versions

    .PARAMETER Product
        Indicate the product(s): can be Reader, Acrobat or both.

    .PARAMETER Version
        Indicate the version(s): can be DC and/or Classic and/or 2015 and/or 2017 and/or 2020

    .EXAMPLE
        New-AdobeGPOTemplate -Product Reader,Acrobat -Version DC,Classic,2017,2020

        Confirm
        Are you sure you want to perform this action?
        Performing the operation "Create files" on target "AdobeReader2020.adm?".
        [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): A

        It creates the following files:
            Adobe.admx, Adobe.adml
            AdobeAcrobat2020.admx, AdobeAcrobat2020.adml
            AdobeAcrobat2017.admx, AdobeAcrobat2017.adml
            AdobeAcrobatDC.admx, AdobeAcrobatDC.adml
            AdobeReader2020.admx, AdobeReader2020.adml
            AdobeReader2017.admx, AdobeReader2017.adml
            AdobeReaderDC.admx, AdobeReaderDC.adml
            AdobeReaderClassic.admx, AdobeReaderClassic.adml

    .EXAMPLE
        New-AdobeGPOTemplate -Product Reader -Version DC -Confirm:$false

        It creates without asking for confirmation the following files:
        Adobe.admx, Adobe.adml,
        AdobeReaderDC.admx, AdobeReaderDC.adml

#>
[CmdletBinding(SupportsShouldProcess,ConfirmImpact='High')]
Param(

    [Parameter()]
    [ValidateSet('Reader','Acrobat')]
    [string[]]$Product='Reader',

    [Parameter()]
    [ValidateSet('Classic','2020','2017','2015','DC','11.0','10.0','9.0')]
    [string[]]$Version='DC'
)
Begin {
    try {
        @'
<?xml version="1.0" encoding="utf-8"?>
<policyDefinitions xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
revision="1.0" schemaVersion="1.0" xmlns="http://schemas.microsoft.com/GroupPolicy/2006/07/PolicyDefinitions">
<policyNamespaces>
    <target prefix="adobe"     namespace="Microsoft.Policies.adobe" />
    <using prefix="products" namespace="Microsoft.Policies.Products" />
</policyNamespaces>
<resources minRequiredRevision="1.0" />
<supportedOn>
    <definitions>
    <!--At least Windows 7 or Windows Server 2008 R2-->
    <definition name="SUPPORTED_Windows7" displayName="$(string.SUPPORTED_Windows7)">
        <or>
        <range ref="products:WindowsServer2008" minVersionIndex="1"/>
        <range ref="products:MicrosoftWindows" minVersionIndex="6"/>
        </or>
    </definition>
    </definitions>
</supportedOn>
<categories>
	    <category name="Adobe" displayName="$(string.Cat_Adobe)"></category>
		    <category name="Reader" displayName="$(string.Cat_Reader)"><parentCategory ref="adobe:Adobe" /></category>
		    <category name="Acrobat" displayName="$(string.Cat_Acrobat)"><parentCategory ref="adobe:Adobe" /></category>
</categories>
</policyDefinitions>
'@      | Out-File -FilePath Adobe.admx -Encoding UTF8 -ErrorAction Stop
    } catch {
        Write-Warning -Message "Failed to create template because $($_.Exception.Message)"
    }
    try {
        @'
<?xml version="1.0" encoding="utf-8"?>
<!--  (c) 2006 Microsoft Corporation  -->
<policyDefinitionResources xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
revision="1.0" schemaVersion="1.0" xmlns="http://schemas.microsoft.com/GroupPolicy/2006/07/PolicyDefinitions">
  <displayName>entrer le nom complet ici</displayName>
  <description>entrer la description ici</description>
  <resources>
    <stringTable>
        <string id="Cat_Adobe">Adobe</string>
        <string id="Cat_Reader">Reader</string>
        <string id="Cat_Acrobat">Acrobat</string>
        <string id="SUPPORTED_Windows7">At least Windows 7 or Windows Server 2008 R2</string>
    </stringTable>
  </resources>
</policyDefinitionResources>
'@      | Out-File -FilePath Adobe.adml -Encoding UTF8 -ErrorAction Stop
    } catch {
        Write-Warning -Message "Failed to create template because $($_.Exception.Message)"
    }
}
Process {
$Product | ForEach-Object {
        $p = $_
        Switch ($p) {
            'Reader' {
                $f = 'Acrobat Reader'
                break
            }
            'Acrobat' {
                $f = 'Adobe Acrobat'
                break
            }
            default {}
        }

        $Version | ForEach-Object {
            $catID = $null
            $v = $_
            Switch ($v) {
                '11.0' { $catID = '11x' ; break }
                '10.0' { $catID = '10x' ; break }
                '9.0'  { $catID = '9x'  ; break }
                default { $catID = $v }

            }
            if ($pscmdlet.ShouldProcess(('Adobe{0}{1}.admx?' -f $p,$v),'Create files')) {
                #region master template
                $ADMXfile = 'Adobe{0}{1}.admx' -f $p,$v,$catID
                try {
                    @"
<?xml version="1.0" encoding="utf-8"?>
<!--  (c) 2006 Microsoft Corporation  -->
<policyDefinitions xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
revision="1.0" schemaVersion="1.0" xmlns="http://schemas.microsoft.com/GroupPolicy/2006/07/PolicyDefinitions">
  <policyNamespaces>
    <target prefix="$($p)" namespace="Microsoft.Policies.Adobe.$($p).$($catID)" />
    <using prefix="adobe"    namespace="Microsoft.Policies.adobe" />
  </policyNamespaces>
  <resources minRequiredRevision="1.0" />
  <categories>
    <category name="$($p)$($catID)" displayName="`$(string.Cat_$($p)$($catID))">
    <parentCategory ref="adobe:$($p)" /></category>

    <category displayName="`$(string.SecurityCategory)" name="SecurityCategory">
      <parentCategory ref="$($p)$($catID)"/>
    </category>
    <category displayName="`$(string.EmbeddedContentCategory)" name="EmbeddedContentCategory">
      <parentCategory ref="$($p)$($catID)"/>
    </category>
    <category displayName="`$(string.CloudCategory)" name="CloudCategory">
      <parentCategory ref="$($p)$($catID)"/>
    </category>
    <category displayName="`$(string.TrustedLocationCategory)" name="TrustedLocationCategory">
      <parentCategory ref="$($p)$($catID)"/>
    </category>
    <category displayName="`$(string.UpdaterCategory)" name="UpdaterCategory">
      <parentCategory ref="$($p)$($catID)"/>
    </category>
    <category displayName="`$(string.OtherCategory)" name="OtherCategory">
      <parentCategory ref="$($p)$($catID)"/>
    </category>
    <category displayName="`$(string.MPIPCategory)" name="MPIPCategory">
      <parentCategory ref="$($p)$($catID)"/>
    </category>
  </categories>
  <policies>

  <policy name="bDisableThumbnailPreviewHandler"
  class="Machine"
  displayName="`$(string.bDisableThumbnailPreviewHandler)"
  explainText="`$(string.bDisableThumbnailPreviewHandler_Help)"
  key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
  valueName="bDisableThumbnailPreviewHandler">
  <parentCategory ref="OtherCategory"/>
  <supportedOn ref="adobe:SUPPORTED_Windows7" />
  <enabledValue><decimal value="1" /></enabledValue>
  <disabledValue><decimal value="0" /></disabledValue>
</policy>

  <policy name="bIsSCReducedModeEnforcedEx"
  class="Machine"
  displayName="`$(string.bIsSCReducedModeEnforcedEx)"
  explainText="`$(string.bIsSCReducedModeEnforcedEx_Help)"
  key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
  valueName="bIsSCReducedModeEnforcedEx">
  <parentCategory ref="OtherCategory"/>
  <supportedOn ref="adobe:SUPPORTED_Windows7" />
  <enabledValue><decimal value="1" /></enabledValue>
  <disabledValue><decimal value="0" /></disabledValue>
</policy>

  <policy name="bEnableGentech"
  class="Machine"
  displayName="`$(string.bEnableGentech)"
  explainText="`$(string.bEnableGentech_Help)"
  key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
  valueName="bEnableGentech">
  <parentCategory ref="OtherCategory"/>
  <supportedOn ref="adobe:SUPPORTED_Windows7" />
  <enabledValue><decimal value="1" /></enabledValue>
  <disabledValue><decimal value="0" /></disabledValue>
</policy>

  <policy name="bEnableAV2Enterprise"
  class="Machine"
  displayName="`$(string.bEnableAV2Enterprise)"
  explainText="`$(string.bEnableAV2Enterprise_Help)"
  key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
  valueName="bEnableAV2Enterprise">
  <parentCategory ref="OtherCategory"/>
  <supportedOn ref="adobe:SUPPORTED_Windows7" />
  <enabledValue><decimal value="1" /></enabledValue>
  <disabledValue><decimal value="0" /></disabledValue>
</policy>

  <policy name="bAutoLaunchAtDocClose"
   class="User"
   displayName="`$(string.bAutoLaunchAtDocClose)"
   explainText="`$(string.bAutoLaunchAtDocClose_Help)"
   key="Software\Adobe\$($f)\$($v)\Security"
   valueName="bAutoLaunchAtDocClose">
   <parentCategory ref="SecurityCategory"/>
   <supportedOn ref="adobe:SUPPORTED_Windows7" />
   <enabledValue><decimal value="1" /></enabledValue>
   <disabledValue><decimal value="0" /></disabledValue>
 </policy>

  <policy name="bAutoLaunchAtSendMail"
   class="User"
   displayName="`$(string.bAutoLaunchAtSendMail)"
   explainText="`$(string.bAutoLaunchAtSendMail_Help)"
   key="Software\Adobe\$($f)\$($v)\Security"
   valueName="bAutoLaunchAtSendMail">
   <parentCategory ref="SecurityCategory"/>
   <supportedOn ref="adobe:SUPPORTED_Windows7" />
   <enabledValue><decimal value="1" /></enabledValue>
   <disabledValue><decimal value="0" /></disabledValue>
 </policy>

  <policy name="bUpdateToSingleApp"
  class="Machine"
  displayName="`$(string.bUpdateToSingleApp)"
  explainText="`$(string.bUpdateToSingleApp_Help)"
  key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
  valueName="bUpdateToSingleApp">
  <parentCategory ref="OtherCategory"/>
  <supportedOn ref="adobe:SUPPORTED_Windows7" />
  <enabledValue><decimal value="1" /></enabledValue>
  <disabledValue><decimal value="0" /></disabledValue>
</policy>

  <policy name="ENABLE_CHROMEEXT"
  class="Machine"
  displayName="`$(string.ENABLE_CHROMEEXT)"
  explainText="`$(string.ENABLE_CHROMEEXT_Help)"
  key="Software\WOW6432Node\Adobe\$($f)\$($v)\Installer"
  valueName="ENABLE_CHROMEEXT">
  <parentCategory ref="OtherCategory"/>
  <supportedOn ref="adobe:SUPPORTED_Windows7" />
  <enabledValue><decimal value="0" /></enabledValue>
  <disabledValue><decimal value="1" /></disabledValue>
</policy>

    <policy name="SendMailShareRedirection"
        class="Machine"
        displayName="`$(string.SendMailShareRedirection)"
        explainText="`$(string.SendMailShareRedirection_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bSendMailShareRedirection">
        <parentCategory ref="OtherCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- Trust Manager > Enhanced Security -->
    <policy name="EnhancedSecurityStandalone"
        class="Machine"
        displayName="`$(string.EnhancedSecurityStandalone)"
        explainText="`$(string.EnhancedSecurityStandalone_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bEnhancedSecurityStandalone">
        <parentCategory ref="SecurityCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="EnhancedSecurityBrowser"
        class="Machine"
        displayName="`$(string.EnhancedSecurityBrowser)"
        explainText="`$(string.EnhancedSecurityBrowser_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bEnhancedSecurityInBrowser">
        <parentCategory ref="SecurityCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="ProtectedModeatstartup"
        class="Machine"
        displayName="`$(string.ProtectedModeatstartup)"
        explainText="`$(string.ProtectedModeatstartup_Help)"
        presentation="`$(presentation.ProtectedModeatstartup)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bProtectedMode">
        <parentCategory ref="SecurityCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- Trust Manager > Protected View -->
    <policy name="ProtectedView"
        class="Machine"
        displayName="`$(string.ProtectedView)"
        explainText="`$(string.ProtectedView_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="iProtectedView"
        presentation="`$(presentation.ProtectedView_Dropdown)">
        <parentCategory ref="SecurityCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <elements>
            <enum id="ProtectedViewLevel" valueName="iProtectedView" required="true">
                <item displayName="`$(string.DisableProtectedView)">
                    <value><decimal value="0" /></value>
                </item>
                <item displayName="`$(string.EnableProtectedViewUnsafeOnly)">
                    <value><decimal value="1" /></value>
                </item>
                <item displayName="`$(string.EnableProtectedView)">
                    <value><decimal value="2" /></value>
                </item>
            </enum>
      </elements>
    </policy>

    <!-- Trust Manager > Internet Access -->
    <policy name="Hyperlinks"
        class="User"
        displayName="`$(string.Hyperlinks)"
        explainText="`$(string.Hyperlinks_Help)"
        key="Software\Adobe\$($f)\$($v)\TrustManager\cDefaultLaunchURLPerms"
        valueName="iURLPerms">
        <parentCategory ref="TrustedLocationCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="2" /></disabledValue>
    </policy>

    <policy name="HyperlinksUserList_MP"
        class="Machine"
        displayName="`$(string.HyperlinksUserList)"
        explainText="`$(string.HyperlinksUserList_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cDefaultLaunchURLPerms"
        valueName="iUnknownURLPerms"
        presentation="`$(presentation.HyperlinksUserList_Dropdown)">
        <parentCategory ref="TrustedLocationCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <elements>
            <enum id="HyperlinksUserListMode" valueName="iUnknownURLPerms" required="true">
                <item displayName="`$(string.AlwaysAsk)">
                    <value><decimal value="1" /></value>
                </item>
                <item displayName="`$(string.AlwaysAllow)">
                    <value><decimal value="2" /></value>
                </item>
                <item displayName="`$(string.AlwaysBlock)">
                    <value><decimal value="3" /></value>
                </item>
            </enum>
        </elements>
    </policy>

    <policy name="HyperlinksUserList"
        class="User"
        displayName="`$(string.HyperlinksUserList)"
        explainText="`$(string.HyperlinksUserList_Help)"
        key="Software\Adobe\$($f)\$($v)\TrustManager\cDefaultLaunchURLPerms"
        valueName="iUnknownURLPerms"
        presentation="`$(presentation.HyperlinksUserList_Dropdown)">
        <parentCategory ref="TrustedLocationCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <elements>
            <enum id="HyperlinksUserListMode" valueName="iUnknownURLPerms" required="true">
                <item displayName="`$(string.AlwaysAsk)">
                    <value><decimal value="1" /></value>
                </item>
                <item displayName="`$(string.AlwaysAllow)">
                    <value><decimal value="2" /></value>
                </item>
                <item displayName="`$(string.AlwaysBlock)">
                    <value><decimal value="3" /></value>
                </item>
            </enum>
        </elements>
    </policy>

    <!-- Trust Manager > Attachments / iFileAttachmentPerms -->
    <!-- bEnableFlash -->

    <!-- General -->
    <policy name="DisablePDFHandlerSwitching"
        class="Machine"
        displayName="`$(string.DisablePDFHandlerSwitching)"
        explainText="`$(string.DisablePDFHandlerSwitching_Help)"
        presentation="`$(presentation.DisablePDFHandlerSwitching)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bDisablePDFHandlerSwitching">
        <parentCategory ref="SecurityCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="AdobeSendPluginToggle"
        class="Machine"
        displayName="`$(string.AdobeSendPluginToggle)"
        explainText="`$(string.AdobeSendPluginToggle_Help)"
        presentation="`$(presentation.AdobeSendPluginToggle)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cCloud"
        valueName="bAdobeSendPluginToggle">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="ToggleAdobeDocumentServices"
        class="Machine"
        displayName="`$(string.ToggleAdobeDocumentServices)"
        explainText="`$(string.ToggleAdobeDocumentServices_Help)"
        presentation="`$(presentation.ToggleAdobeDocumentServices)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cServices"
        valueName="bToggleAdobeDocumentServices">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="TogglePrefsSync"
        class="Machine"
        displayName="`$(string.TogglePrefsSync)"
        explainText="`$(string.TogglePrefsSync_Help)"
        presentation="`$(presentation.TogglePrefsSync)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cServices"
        valueName="bTogglePrefsSync">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- DisableMaintenance32 needs to be moved to a GP Preference -->
    <!-- DisableMaintenance64 needs to be moved to a GP Preference -->

    <!-- bEnableAlwaysOutlookAttachmentProtectedView -->

    <!-- Trusted Location Settings -->
    <policy name="TrustedSites"
        class="Machine"
        displayName="`$(string.TrustedSites)"
        explainText="`$(string.TrustedSites_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bDisableTrustedSites">
        <parentCategory ref="TrustedLocationCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="TrustedFolders"
        class="Machine"
        displayName="`$(string.TrustedFolders)"
        explainText="`$(string.TrustedFolders_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bDisableTrustedFolders">
        <parentCategory ref="TrustedLocationCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="TrustedOSSites"
        class="Machine"
        displayName="`$(string.TrustedOSSites)"
        explainText="`$(string.TrustedOSSites_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bDisableOSTrustedSites">
        <parentCategory ref="TrustedLocationCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="TrustedCertificate"
        class="Machine"
        displayName="`$(string.TrustedCertificate)"
        explainText="`$(string.TrustedCertificate_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bEnableCertificateBasedTrust">
        <parentCategory ref="TrustedLocationCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- Cloud Settings -->
    <policy name="DisableSharePointFeatures"
        class="Machine"
        displayName="`$(string.DisableSharePointFeatures)"
        explainText="`$(string.DisableSharePointFeatures_Help)"
        presentation="`$(presentation.DisableSharePointFeatures)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cSharePoint"
        valueName="bDisableSharePointFeatures">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy  name="CloudFilestore"
        class="Machine"
        displayName="`$(string.CloudFilestore)"
        explainText="`$(string.CloudFilestore_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cCloud"
        valueName="bDisableADCFileStore">
        <parentCategory ref="CloudCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="CloudWebmail"
        class="Machine"
        displayName="`$(string.CloudWebmail)"
        explainText="`$(string.CloudWebmail_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cWebmailProfiles"
        valueName="bDisableWebmail">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="ToggleAdobeSign"
        class="Machine"
        displayName="`$(string.ToggleAdobeSign)"
        explainText="`$(string.ToggleAdobeSign_Help)"
        presentation="`$(presentation.ToggleAdobeSign)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cServices"
        valueName="bToggleAdobeSign">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="ToggleWebConnectors"
        class="Machine"
        displayName="`$(string.ToggleWebConnectors)"
        explainText="`$(string.ToggleWebConnectors_Help)"
        presentation="`$(presentation.ToggleWebConnectors)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cServices"
        valueName="bToggleWebConnectors">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- Updater Settings -->

    <policy name="DisableAllUpdates"
        class="Machine"
        displayName="`$(string.DisableAllUpdates)"
        explainText="`$(string.DisableAllUpdates_Help)"
        presentation="`$(presentation.DisableAllUpdates)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bUpdater">
        <parentCategory ref="UpdaterCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="DisableAllWebServices"
        class="Machine"
        displayName="`$(string.DisableAllWebServices)"
        explainText="`$(string.DisableAllWebServices_Help)"
        presentation="`$(presentation.DisableAllWebServices)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cServices"
        valueName="bUpdater">
        <parentCategory ref="UpdaterCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- iLogLevel needs to be moved to a GP Preference -->

    <policy name="DisableEULA"
        class="User"
        displayName="`$(string.DisableEULA)"
        explainText="`$(string.DisableEULA_Help)"
        presentation="`$(presentation.DisableEULA)"
        key="Software\Adobe\$($f)\$($v)\AdobeViewer"
        valueName="EULA">
        <parentCategory ref="UpdaterCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- iDisableCheckEula needs to be moved to a GP Preference -->

    <!-- needs to be moved to a GP Preference
        Mode key="Software\Wow6432Node\Adobe\Adobe ARM\Legacy\Reader\{AC76BA86-7AD7-1033-7B44-AC0F074E4100}"
    -->

    <!-- iCheckReader needs to be moved to a GP Preference -->

    <!-- Embedded Content Settings -->

    <policy name="DisableJavaScript"
        class="Machine"
        displayName="`$(string.DisableJavaScript)"
        explainText="`$(string.DisableJavaScript_Help)"
        presentation="`$(presentation.DisableJavaScript)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bDisableJavaScript">
        <parentCategory ref="EmbeddedContentCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!--  FeatureLockDown\cJavaScriptPerms tBlackList -->

    <policy name="Enable3d"
        class="Machine"
        displayName="`$(string.Enable3d)"
        explainText="`$(string.Enable3d_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bEnable3D">
        <parentCategory ref="EmbeddedContentCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- Other Content Settings -->

    <policy name="AdobeWelcomeScreen"
	    class="Machine"
	    displayName="`$(string.AdobeWelcomeScreen)"
	    explainText="`$(string.AdobeWelcomeScreen_Help)"
	    presentation="`$(presentation.AdobeWelcomeScreen)"
	    key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cWelcomeScreen"
	    valueName="bShowWelcomeScreen">
        <parentCategory ref="OtherCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="DisableUsageTracking"
        class="Machine"
        displayName="`$(string.DisableUsageTracking)"
        explainText="`$(string.DisableUsageTracking_Help)"
        presentation="`$(presentation.DisableUsageTracking)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bUsageMeasurement">
        <parentCategory ref="OtherCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="Upsell"
        class="Machine"
        displayName="`$(string.Upsell)"
        explainText="`$(string.Upsell_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="bAcroSuppressUpsell">
        <parentCategory ref="OtherCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- bAutoFill -->

    <policy name="ShowMsgAtLaunch"
        class="Machine"
        displayName="`$(string.ShowMsgAtLaunch)"
        explainText="`$(string.ShowMsgAtLaunch_Help)"
        presentation="`$(presentation.ShowMsgAtLaunch)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cIPM"
        valueName="bShowMsgAtLaunch">
        <parentCategory ref="OtherCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="DontShowMsgWhenViewingDoc"
        class="Machine"
        displayName="`$(string.DontShowMsgWhenViewingDoc)"
        explainText="`$(string.DontShowMsgWhenViewingDoc_Help)"
        presentation="`$(presentation.DontShowMsgWhenViewingDoc)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cIPM"
        valueName="bDontShowMsgWhenViewingDoc">
        <parentCategory ref="OtherCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="FipsMode"
        class="User"
        displayName="`$(string.FipsMode)"
        explainText="`$(string.FipsMode_Help)"
        key="Software\Adobe\$($f)\$($v)\AVGeneral"
        valueName="bFipsMode">
        <parentCategory ref="TrustedLocationCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- More Cloud Settings -->
    <policy name="ToggleFillSign"
        class="Machine"
        displayName="`$(string.ToggleFillSign)"
        explainText="`$(string.ToggleFillSign_Help)"
        presentation="`$(presentation.ToggleFillSign)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cServices"
        valueName="bToggleFillSign">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="ToggleSendAndTrack"
        class="Machine"
        displayName="`$(string.ToggleSendAndTrack)"
        explainText="`$(string.ToggleSendAndTrack_Help)"
        presentation="`$(presentation.ToggleSendAndTrack)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown\cServices"
        valueName="bToggleSendAndTrack">
        <parentCategory ref="CloudCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- More Embedded Content Settings -->
    <policy name="Enable3dContent"
        class="User"
        displayName="`$(string.3DEnableContent)"
        explainText="`$(string.3DEnableContent_Help)"
        key="Software\Policies\Adobe\$($f)\$($v)\FeatureLockDown"
        valueName="b3DEnableContent">
        <parentCategory ref="EmbeddedContentCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="AutoUriDetect"
        class="User"
        displayName="`$(string.AutoUriDetect)"
        explainText="`$(string.AutoUriDetect_Help)"
        key="Software\Adobe\$($f)\$($v)\AVGeneral"
        valueName="bAutoUriDetect">
        <parentCategory ref="EmbeddedContentCategory"/>
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- User: Collab\bEnableRSSFeeds not documented -->

    <policy name="JavaScript"
	    class="User"
	    displayName="`$(string.JavaScript)"
	    explainText="`$(string.JavaScript_Help)"
	    presentation="`$(presentation.JavaScript)"
        key="Software\Adobe\$($f)\$($v)\JSPrefs"
	    valueName="bEnableJS">
        <parentCategory ref="EmbeddedContentCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="Launchfunctionality"
	    class="User"
        displayName="`$(string.Launchfunctionality)"
	    explainText="`$(string.Launchfunctionality_Help)"
	    presentation="`$(presentation.Launchfunctionality)"
	    key="Software\Adobe\$($f)\$($v)\Originals"
	    valueName="bAllowOpenFile">
        <parentCategory ref="EmbeddedContentCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="bDisplayAboutDialog"
	class="User"
        displayName="`$(string.bDisplayAboutDialog)"
	 explainText="`$(string.bDisplayAboutDialog_Help)"
	presentation="`$(presentation.bDisplayAboutDialog)"
	key="Software\Adobe\$($f)\$($v)\Originals"
	valueName="bDisplayAboutDialog">
        <parentCategory ref="EmbeddedContentCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="GreyouttheLaunchfunctionality"
        class="User"
        displayName="`$(string.GreyouttheLaunchfunctionality)"
        explainText="`$(string.GreyouttheLaunchfunctionality_Help)"
        presentation="`$(presentation.GreyouttheLaunchfunctionality)"
        key="Software\Adobe\$($f)\$($v)\Originals"
        valueName="bSecureOpenFile">
        <parentCategory ref="EmbeddedContentCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- More Trust Manager settings -->

    <policy name="LoadSettingsFromURLCust"
        class="User"
        displayName="`$(string.LoadSettingsFromURLCust)"
        explainText="`$(string.LoadSettingsFromURLCust_Help)"
        presentation="`$(presentation.LoadSettingsFromURLCust)"
        key="Software\Adobe\$($f)\$($v)\Security\cDigSig\cCustomDownload"
        valueName="bLoadSettingsFromURL">
        <parentCategory ref="SecurityCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="LoadSettingsFromURLAATL"
        class="User"
        displayName="`$(string.LoadSettingsFromURLAATL)"
        explainText="`$(string.LoadSettingsFromURLAATL_Help)"
        presentation="`$(presentation.LoadSettingsFromURLAATL)"
        key="Software\Adobe\$($f)\$($v)\Security\cDigSig\cAdobeDownload"
        valueName="bLoadSettingsFromURL">
        <parentCategory ref="SecurityCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="LoadSettingsFromURLEUTL"
        class="User"
        displayName="`$(string.LoadSettingsFromURLEUTL)"
        explainText="`$(string.LoadSettingsFromURLEUTL_Help)"
        presentation="`$(presentation.LoadSettingsFromURLEUTL)"
        key="Software\Adobe\$($f)\$($v)\Security\cDigSig\cEUTLDownload"
        valueName="bLoadSettingsFromURL">
        <parentCategory ref="SecurityCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="AskBeforeUpdatingRootCertificates"
        class="User"
        displayName="`$(string.AskBeforeUpdatingRootCertificates)"
        explainText="`$(string.AskBeforeUpdatingRootCertificates_Help)"
        presentation="`$(presentation.AskBeforeUpdatingRootCertificates)"
        key="Software\Adobe\$($f)\$($v)\Security\cDigSig\cAdobeDownload"
        valueName="bAskBeforeInstalling">
        <parentCategory ref="SecurityCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="AskBeforeUpdatingEUCertificates"
        class="User"
        displayName="`$(string.AskBeforeUpdatingEUCertificates)"
        explainText="`$(string.AskBeforeUpdatingEUCertificates_Help)"
        presentation="`$(presentation.AskBeforeUpdatingEUCertificates)"
        key="Software\Adobe\$($f)\$($v)\Security\cDigSig\cEUTLDownload"
        valueName="bAskBeforeInstalling">
        <parentCategory ref="SecurityCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- More Trust Manager > Protected View -->
    <policy name="ProtectedViewMode"
        class="User"
        displayName="`$(string.ProtectedViewMode)"
        explainText="`$(string.ProtectedViewMode_Help)"
        presentation="`$(presentation.ProtectedViewMode)"
        key="Software\Adobe\$($f)\$($v)\TrustManager"
        valueName="iProtectedView">
        <parentCategory ref="SecurityCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <!-- More Trusted Location Settings -->
    <policy name="TrustOSTrustedSites"
        class="User"
        displayName="`$(string.TrustOSTrustedSites)"
        explainText="`$(string.TrustOSTrustedSites_Help)"
        presentation="`$(presentation.TrustOSTrustedSites)"
        key="Software\Adobe\$($f)\$($v)\TrustManager"
        valueName="bTrustOSTrustedSites">
        <parentCategory ref="TrustedLocationCategory" />
        <supportedOn ref="adobe:SUPPORTED_Windows7" />
        <enabledValue><decimal value="1" /></enabledValue>
        <disabledValue><decimal value="0" /></disabledValue>
    </policy>

    <policy name="bShowDMB"
     class="User"
     displayName="`$(string.bShowDMB)"
     explainText="`$(string.bShowDMB_Help)"
     presentation="`$(presentation.bShowDMB)"
     key="Software\Adobe\$($f)\$($v)\MicrosoftAIP"
     valueName="bShowDMB">
     <parentCategory ref="MPIPCategory" />
     <supportedOn ref="adobe:SUPPORTED_Windows7" />
     <enabledValue><decimal value="1" /></enabledValue>
     <disabledValue><decimal value="0" /></disabledValue>
    </policy>

  </policies>
</policyDefinitions>
"@                  | Out-File -FilePath $ADMXfile -ErrorAction Stop -Encoding UTF8
                } catch {
                    Write-Warning -Message "Failed to create template because $($_.Exception.Message)"
                }
                #endregion

                #region ADML file
                $ADMLfile = 'Adobe{0}{1}.adml' -f $p,$v,$catID
                try {
                    @"
<?xml version="1.0" encoding="utf-8"?>
<!--  (c) 2006 Microsoft Corporation  -->
<policyDefinitionResources xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
revision="1.0" schemaVersion="1.0" xmlns="http://schemas.microsoft.com/GroupPolicy/2006/07/PolicyDefinitions">
  <displayName>entrer le nom complet ici</displayName>
  <description>entrer la description ici</description>
  <resources>
    <stringTable>

      <string id="Cat_Adobe">Adobe</string>
      <string id="Cat_$($p)">$($f)</string>
      <string id="Cat_$($p)$($catID)">$($v)</string>

      <string id="SecurityCategory">Security</string>
      <string id="CloudCategory">Cloud Services</string>
      <string id="EmbeddedContentCategory">Embedded Content</string>
      <string id="UpdaterCategory">Updater</string>
      <string id="OtherCategory">Other</string>
      <string id="MPIPCategory">Purview</string>
      <string id="TrustedLocationCategory">Trusted Locations</string>

      <string id="bEnableAV2Enterprise">Specifies whether to enable the Modern Viewer</string>
      <string id="bEnableAV2Enterprise_Help">
The new app UI is rolling out in phases over 2023.
Set to Disabled to: Don't show the Modern Viewer
Set to Enabled to: Show the Modern Viewer
     </string>

      <string id="bShowDMB">Enable the document message bar</string>
      <string id="bShowDMB_Help">
To enable the document message bar in MPIP protected PDFs
Set to Disabled to: Don't show the message bar
Set to Enabled to: Show the message bar
     </string>

      <string id="bUpdateToSingleApp">Stop automatic upgrade of Acrobat Reader 32-bit to Acrobat Reader 64-bit</string>
      <string id="bUpdateToSingleApp_Help">
To stop the Acrobat Reader 32-bit application from automatically upgrading to the 64-bit version,
set the following before the first launch of the application:
Set to Disabled to: Stop upgrading
Set to Enabled to: automatically upgrade to 64-bit version
     </string>

      <string id="bDisableThumbnailPreviewHandler">Disable thumbnails in Windows Explorer</string>
      <string id="bDisableThumbnailPreviewHandler_Help">
Set to Enabled to: Prevent the end user from enabling PDF preview in Windows Explorer
Set to Disabled to: Allow the end user from enabling PDF preview in Windows Explorer
      </string>

      <string id="bIsSCReducedModeEnforcedEx">Disable mandatory sign-in</string>
      <string id="bIsSCReducedModeEnforcedEx_Help">
Set to Enabled to disable the mandatory sign-in in Acrobat
Set to Disabled to enable the mandatory sign-in in Acrobat
      </string>

      <string id="bEnableGentech">Disable Generative AI</string>
      <string id="bEnableGentech_Help">
Set to Enabled to enable the Generative AI feature in Acrobat
Set to Disabled to disable the Generative AI feature in Acrobat
      </string>

      <string id="bAutoLaunchAtDocClose">Examine document when closing document</string>
      <string id="bAutoLaunchAtDocClose_Help">
Set to Enabled to examine document when closing document in Acrobat
Set to Disabled to disable examining document when closing document in Acrobat
      </string>

      <string id="bAutoLaunchAtSendMail">Examine document when sending document by email</string>
      <string id="bAutoLaunchAtSendMail_Help">
Set to Enabled to examine document when sending document by email in Acrobat
Set to Disabled to disable examine document when sending document by email in Acrobat
      </string>

      <string id="bDisplayAboutDialog">Display splash screen at launch</string>
      <string id="bDisplayAboutDialog_Help">
Set to Disabled to Don't display the startup splash screen. 
Set to Enabled to Display the startup splash screen at every launch.
      </string>

      <string id="ENABLE_CHROMEEXT">Suppresses the First Time in-app experience</string>
      <string id="ENABLE_CHROMEEXT_Help">
Enable to suppress the First Time in-app experience if you do not want users to see the in-app experience for Chrome extension
      </string>
      <string id="SendMailShareRedirection">Mail icon behavior</string>
      <string id="SendMailShareRedirection_Help">
You can change the behavior of the email icon to send a PDF directly as email attachment.

If disabled, this policy will restore the Attach to email experience and will not redirect to the new unified sharing experience.

If enabled, this policy will redirect to the new unified share pane and unified sharing experience.
      </string>
      <string id="AdobeWelcomeScreen">Welcomescreen</string>
      <string id="AdobeWelcomeScreen_Help">
If disabled, this policy will disable the welcome screen of the $($p)

If enabled, this policy will activate the welcome screen of the $($p)
      </string>

      <string id="JavaScript">JavaScript</string>
      <string id="JavaScript_Help">
  Set to 'Enabled' to enable Javascript at the user level.

  Set to 'Disabled' to disable Javascript at the user level.

  If not set at machine level, the user can still control Javascript in Preferences > Javascript.
      </string>

      <string id="GreyouttheLaunchfunctionality">Grey out the Launch functionality</string>
      <string id="GreyouttheLaunchfunctionality_Help">
Set to 'Enabled' to the grey out of the launch functionality in Adobe $($p)

See and set the 'Launch functionality' GPO item as well
      </string>

      <string id="Launchfunctionality">Launch functionality</string>
      <string id="Launchfunctionality_Help">
Set to 'Disabled' to disable the Launch functionality in Adobe $($p)

see Preferences > Trust Manager > 'Allow opening of non-PDF file attachments with external applications'
      </string>

      <string id="DisableAllUpdates">Disable automatic updates </string>
      <string id="DisableAllUpdates_Help">
Set to 'Disabled' to turn off automatic updates

Set to 'Enabled'  to turn on  automatic updates
      </string>

      <string id="DisableUsageTracking">Turn off user participation in the feedback program</string>
      <string id="DisableUsageTracking_Help">
Set it to 'Disabled' to hide this option in Help
      </string>

      <string id="ProtectedModeatstartup">Enable Protected Mode at startup </string>
      <string id="ProtectedModeatstartup_Help">
Set to 'Enabled' to activate the Protected mode at startup

Set to 'Disabled' to desactivate the Protected mode at startup

see Preferences > Security (Enhanced) > 'Enabled Protected Mode at startup'
      </string>

      <string id="DisableEULA">Accept EULA</string>
      <string id="DisableEULA_Help">Set to 'Enabled' to accept the EULA</string>

      <string id="AskBeforeUpdatingRootCertificates">Ask before updating checkbox of Trusted root Certificates</string>
      <string id="AskBeforeUpdatingRootCertificates_Help">
Set to 'Enabled' to Ask before updating

see Preferences > Trust Manager > Automatic Adobe Approved Trust List (AATL) updates
      </string>

      <string id="AskBeforeUpdatingEUCertificates">Ask before updating checkbox of Trusted EU Certificates </string>
      <string id="AskBeforeUpdatingEUCertificates_Help">
Set to 'Enabled' to Ask before updating

see Preferences > Trust Manager > Automatic European Union Trusted list (EUTL) updates
      </string>

      <string id="ProtectedViewMode">Protected View mode</string>
      <string id="ProtectedViewMode_Help">
Set to 'Enabled' to activate 'Files from potentially unsafe location'.

Set to 'Disabled' to set it to 'Off' (default)

see Preferences > Security (Enhanced) > Proctected View
      </string>

      <string id="LoadSettingsFromURLCust">Load security settings from a server (Custom)</string>
      <string id="LoadSettingsFromURLCust_Help">
Set to 'Disabled' to disable the ability to load settings from a server URL

see Preferences > Security > Load security settings from a server
      </string>

      <string id="LoadSettingsFromURLAATL">Load certificates from Adobe AATL server</string>
      <string id="LoadSettingsFromURLAATL_Help">
Set to 'Disabled' to disable the ability to load certificates from Adobe AATL server

see Preferences > Trust Manager > Automatic Adobe Approved Trust List (AATL) updates
      </string>

      <string id="LoadSettingsFromURLEUTL">Load certificates from Adobe EUTL server</string>
      <string id="LoadSettingsFromURLEUTL_Help">
Set to 'Disabled' to disable the ability to load load certificates from Adobe EUTL server

see Preferences > Trust Manager > Automatic European Union Trusted list (EUTL) updates
      </string>

      <string id="DisablePDFHandlerSwitching">Disable PDF Handler Switching</string>
      <string id="DisablePDFHandlerSwitching_Help">
Set to 'Enabled' to disable the ability to activate the PDF handler switching feature.

Set to 'Disabled' to enable the ability to activate the PDF handler switching feature.

See Preferences > General > Select Default PDF Handler
      </string>

      <string id="DisableJavaScript">Disable Javascript</string>
      <string id="DisableJavaScript_Help">
Set to 'Enabled' to disable Javascript at the machine level.

Set to 'Disabled' to enable Javascript at the machine level.

When this policy is set, the user level setting has no effect and the user cannot control Javascript in Preferences > Javascript.
      </string>

      <string id="ShowMsgAtLaunch">Show me messages when I launch $($p)</string>
      <string id="ShowMsgAtLaunch_Help">
Set to 'Enabled' to activate Preferences > General > Show me messages when I launch $($p).
      </string>

      <string id="DontShowMsgWhenViewingDoc">Don't show messages while viewing a document</string>
      <string id="DontShowMsgWhenViewingDoc_Help">
Set to 'Enabled' to activate Preferences > General > Don't show messages while viewing a document
      </string>

      <string id="TrustOSTrustedSites">Automatically trust sites for my Win OS security zones</string>
      <string id="TrustOSTrustedSites_Help">
Set to 'Enabled' to automatically trust sites for my Win OS security zones

See Preferences > Security (Enhanced) > Automatically trust sites for my Win OS security zones
      </string>

      <string id="DisableAllWebServices">Disable all web services</string>
      <string id="DisableAllWebServices_Help">
Prevents web service plugins from updating and also disables all services.

Set it to 'Disabled' to turn them off or to 'Enabled' to turn them on
      </string>

      <string id="ToggleWebConnectors">Disable third party connectors</string>
      <string id="ToggleWebConnectors_Help">
Set to 'Enabled' to disable third party connectors such as Dropbox, Google Drive, etc.

This new feature allows configuring in-product access to third party services for file storage
      </string>

      <string id="ToggleFillSign">Disable Fill and Sign</string>
      <string id="ToggleFillSign_Help">
Set to 'Enabled' to disable and lock the Fill and Sign feature
      </string>

      <string id="ToggleAdobeDocumentServices">Disable all services with exceptions</string>
      <string id="ToggleAdobeDocumentServices_Help">
Set to 'Enabled' to disable all service access except those features controlled by the other preferences:

 Fill and Sign
 Third party connectors
 Adobe Send for Signature
 Preference synchronization
 Send and Track
      </string>

      <string id="ToggleAdobeSign">Disable Adobe Send for Signature</string>
      <string id="ToggleAdobeSign_Help">
Set to 'Enabled' to disable Adobe Send for Signature (formerly EchoSign)
      </string>

      <string id="TogglePrefsSync">Disable preference synchronization</string>
      <string id="TogglePrefsSync_Help">
Set to 'Enabled' to disable preference synchronization across devices.

This new feature which synchronizes desktop preferences across machines with Acrobat and Reader on which the user is signed in with an Adobe ID.
      </string>

      <string id="ToggleSendAndTrack">Disable Send and Track</string>
      <string id="ToggleSendAndTrack_Help">
Set to 'Enabled' to disable and lock the Send and Track feature
      </string>

      <string id="DisableSharePointFeatures">Disable SharePoint integration</string>
      <string id="DisableSharePointFeatures_Help">
Set to 'Enabled' to disable the SharePoint integration.

Set to 'Disabled' to enable the SharePoint integration.
      </string>

      <string id="AdobeSendPluginToggle">Send and Track plugin for Outlook</string>
      <string id="AdobeSendPluginToggle_Help">
Set to 'Enabled' to disable the Adobe Send and Track plugin for Outlook
      </string>

        <string id="CloudFilestore">Disable Cloud File Storage</string>
        <string id="CloudFilestore_Help">
Set to 'Enabled' to disable the  Cloud File Storage
        </string>

      <string id="CloudWebmail">Disable WebMail integration</string>
      <string id="CloudWebmail_Help">
Set to 'Enabled' to disable integration with WebMail services (ie Yahoo, Google, etc).
      </string>

      <string id="Enable3d">Disable 3D Content</string>
      <string id="Enable3d_Help">
Set to 'Enabled' to trust and render 3D files.
Set to 'Disabled' to don't render 3D content.

See Preferences > 3D &amp; Multimedia > 'Enable playing of 3D content'
      </string>

      <string id="3DEnableContent">Enable 3D Content</string>
      <string id="3DEnableContent_Help">
Set to 'Enabled' to enable 3D or to 'Disabled' to disable 3D in the user context.

See Preferences > 3D &amp; Multimedia > 'Enable playing of 3D content'
      </string>

      <string id="AutoUriDetect">Enable Create Links from URL</string>
      <string id="AutoUriDetect_Help">
Set to 'Enabled' to enable 'Create Links from URL' or to 'Disabled' to disable 'Create Links from URL' in the user context.

See Preferences > General > 'Create links from URL'
      </string>

      <string id="Upsell">Suppress Upsell</string>
      <string id="Upsell_Help">
Disables messages which encourage the user to upgrade the product.

Set to 'Enabled' to disable Upsell.
      </string>

      <string id="Hyperlinks">Allow PDF to connect to web sites</string>
      <string id="Hyperlinks_Help">
Set to 'Disabled' to 'Allow PDF files to access all web sites'.

Set to 'Enabled' to 'Block PDF files' access to all web sites'.

See Preferences > Trust Manager > Internet Access
      </string>

      <string id="TrustedSites">User Trusted Sites</string>
      <string id="TrustedSites_Help">
Enable/Disable a user's ability to mark sites as Trusted.

Trusted sites are not subjected to Protected View/Mode and other security features.

Setting to Disabled will prevent user's from trusting PDF files before they are have been opened with Protected View.
        </string>

      <string id="TrustedFolders">User Trusted Folders and Files</string>
      <string id="TrustedFolders_Help">

Enable/Disable a user's ability to mark particular files as Trusted.

This setting is related to the Yellow Message Bar for Protected View/Mode.

By setting to Enabled or Not Configured a user can approve a single PDF file as trusted and get active content (like JavaScript) to execute.

By setting to disabled a user will never be able to move beyond the Yellow Message Bar, essentially they will be in read-only mode and will not be able to enable any active content.

Setting to disabled will have ramifications on user workflows.

Not Configured and Disabled have the same behavior.
        </string>

      <string id="TrustedCertificate">Trust Certified Documents</string>
      <string id="TrustedCertificate_Help">

Enable/Disable Certified Documents as Trusted.

Setting to Enabled will allow signed PDF files to open normally without any security restrictions.

Not Configured or Disabled have the same behavior.
    </string>

    <string id="FipsMode">Configure FIPS mode</string>
    <string id="FipsMode_Help">
Turn FIPS mode on or off thereby requiring stronger encryptiong algortihms and limiting certain application behavior.
Default is FIPS mode off.
Not Configured and Disabled have the same behavior.
    </string>

    <string id="HyperlinksUserList">User non-whitelisted hyperlinks access to the Internet</string>
    <string id="HyperlinksUserList_Help">
Controls if hyperlinks, that are not in a user's list, clicked inside PDF documents are allowed to access the Internet.
Only applicable if 'Hyperlink access to the Internet' is Not Configured.
If 'Hyperlink access to the Internet' is Not Configured, then the default behavior is 'Always ask'.
Not Configured and Enabled with 'Always ask' have the same behavior of always asking for permission.
Users can change the value when it is set to Not Configured.
    </string>

    <string id="AlwaysAsk">Always ask</string>
    <string id="AlwaysAllow">Always allow</string>
    <string id="AlwaysBlock">Always block</string>

    <string id="EnhancedSecurityStandalone">Enhanced Security: standalone mode</string>
    <string id="EnhancedSecurityStandalone_Help">
The Enhanced Security feature is designed to limit document behaviors in workflows where those behaviors are perceived as a vulnerability or security risk.
Enhanced Security blocks 6 specific behaviors: data injection, script injection, silent printing, web links (if not allowed by Trust Manager settings), cross domain access, and access to external streams.
Standalone mode occurs when Adobe Reader is running as an application.
Enhanced Security is enabled by default.
Configuring this setting to Enabled or Disabled prevents users from changing it from the administrator's desired configuration.
Not Configured and Enabled have the same behavior of enabling Enhanced Security but users can change the value when it is set to Not Configured.
    </string>

    <string id="EnhancedSecurityBrowser">Enhanced Security: browser mode</string>
    <string id="EnhancedSecurityBrowser_Help">
The Enhanced Security feature is designed to limit document behaviors in workflows where those behaviors are perceived as a vulnerability or security risk.
Enhanced Security blocks 6 specific behaviors: data injection, script injection, silent printing, web links (if not allowed by Trust Manager settings), cross domain access, and access to external streams.
Browser mode occurs when Adobe Reader is running as a browser plugin.
Enhanced Security is enabled by default.
Configuring this setting to Enabled or Disabled prevents users from changing it from the administrator's desired configuration.
Not Configured and Enabled have the same behavior of enabling Enhanced Security.
Users can change the value when it is set to Not Configured.
    </string>

      <string id="ProtectedView">Protected View</string>
      <string id="ProtectedView_Help">
Protected View is a highly secure, read-only mode that blocks most actions and application behavior until the user decides whether or not to trust the document.
This helps protect users from potentially malicous content inside PDF files.
Protected View is only supported when Protected Mode is also enabled.
Protected View is disabled by default.
Not Configured and Disabled have the same behavior of disabling Protected Mode Protected View.
Users can change the value when it is set to Not Configured.
      </string>

        <string id="DisableProtectedView">Disable Protected View</string>
        <string id="EnableProtectedViewUnsafeOnly">Enable Protected View for unsafe locations only</string>
        <string id="EnableProtectedView">Enable Protected View</string>

      <string id="TrustedOSSites">OS Trusted Sites</string>
      <string id="TrustedOSSites_Help">
Enable/Disable OS Trusted sites (from IE Zones) and use them as Reader DC Trusted sites.
IE Trusted Sites are generally already under IT control.
Setting to Enabled will allow PDF files openned from OS Trusted Sites to open normally without any security restrictions.
Not Configured and Disabled have the same behavior.
        </string>

    </stringTable>

    <presentationTable>
      <presentation id="JavaScript" />
      <presentation id="AdobeWelcomeScreen" />
      <presentation id="Launchfunctionality" />
      <presentation id="bDisplayAboutDialog" />
      <presentation id="GreyouttheLaunchfunctionality" />
      <presentation id="DisableAllUpdates" />
      <presentation id="DisableUsageTracking" />
      <presentation id="ProtectedModeatstartup" />
      <presentation id="DisableEULA" />
      <presentation id="AskBeforeUpdatingRootCertificates" />
      <presentation id="AskBeforeUpdatingEUCertificates" />
      <presentation id="ProtectedViewMode" />
      <presentation id="LoadSettingsFromURLCust" />
      <presentation id="LoadSettingsFromURLAATL" />
      <presentation id="LoadSettingsFromURLEUTL" />
      <presentation id="DisablePDFHandlerSwitching" />
      <presentation id="DisableJavaScript" />
      <presentation id="ShowMsgAtLaunch" />
      <presentation id="DontShowMsgWhenViewingDoc" />
      <presentation id="TrustOSTrustedSites" />
      <presentation id="DisableAllWebServices" />
      <presentation id="ToggleWebConnectors" />
      <presentation id="ToggleFillSign" />
      <presentation id="ToggleAdobeDocumentServices" />
      <presentation id="ToggleAdobeSign" />
      <presentation id="TogglePrefsSync" />
      <presentation id="ToggleSendAndTrack" />
      <presentation id="DisableSharePointFeatures" />
      <presentation id="AdobeSendPluginToggle" />
      <presentation id="bShowDMB" />

      <presentation id="HyperlinksUserList_Dropdown">
        <dropdownList defaultItem="2" refId="HyperlinksUserListMode">Hyperlinks in user list</dropdownList>
      </presentation>

      <presentation id="ProtectedView_Dropdown">
        <dropdownList defaultItem="2" refId="ProtectedViewLevel">Protected View:</dropdownList>
      </presentation>

    </presentationTable>
  </resources>
</policyDefinitionResources>
"@              | Out-File -FilePath $ADMLfile -ErrorAction Stop -Encoding UTF8
                } catch {
                    Write-Warning -Message "Failed to create template because $($_.Exception.Message)"
                }
                #endregion
            }
        }
    }
}
End {}
} #endof function
