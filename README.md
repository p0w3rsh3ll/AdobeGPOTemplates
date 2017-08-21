AdobeGPOTemplates PowerShell Module
===================================

**AdobeGPOTemplates module was designed to help create group policies (GPO) ADMX templates to configure and harden Adobe Reader and Adobe Acrobat.**

## Table of Contents  
* [Usage](#Usage)
  * [Install the module](#Install)
  * [Functions](#Functions)
  * [Help](#Help)
  * [What's Next](#WhatsNext)
* [Issues](#issues)
* [Todo](#Todo)
* [Credits](#Credits)
* [Other links](#Otherlinks)

<a name="Usage"/>

## Usage

<a name="Install"/>

### Install the module

```powershell
# Check the mmodule on powershellgallery.com
Find-Module -Name AdobeGPOTemplates -Repository PSGallery
```
```
Version    Name                                Repository           Description
-------    ----                                ----------           -----------                                   
1.0.0      AdobeGPOTemplates                   PSGallery            AdobeGPOTemplates is a module ...
```

```powershell
# Save the module locally in Downloads folder
Save-Module -Name AdobeGPOTemplates -Repository PSGallery -Path ~/Downloads
```

Stop and please review the content of the module, I mean the code to make sure it's trustworthy :-)

You can also verify that the SHA256 hashes of downloaded files match those stored in the catalog file
```powershell
$HT = @{
    CatalogFilePath = "~/Downloads/AdobeGPOTemplates/1.0.0/AdobeGPOTemplates.cat"
    Path = "~/Downloads/AdobeGPOTemplates/1.0.0"
    Detailed = $true
    FilesToSkip = 'PSGetModuleInfo.xml'
}
Test-FileCatalog @HT
```

```powershell
# Import the module
Import-Module ~/Downloads/AdobeGPOTemplates/1.0.0/AdobeGPOTemplates.psd1 -Force -Verbose
```

<a name="Functions"/>

### Check the command available
```powershell
Get-Command -Module AdobeGPOTemplates
```
```
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        New-AdobeGPOTemplate                               1.0.0      AdobeGPOTemp...
```
<a name="Help"/>

### Find the syntax

```powershell
# View the syntax
Get-Command New-AdobeGPOTemplate -Syntax
```
```
New-AdobeGPOTemplate [[-Product] <string[]>] [[-Version] <string[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### View examples provided in the help
```powershell
# Get examples from the help
 Get-Help New-AdobeGPOTemplate  -Examples
```
```
NAME
    New-AdobeGPOTemplate

SYNOPSIS
    Create Admx and Adml GPO templates for Adobe products


    -------------------------- EXAMPLE 1 --------------------------

    PS C:\>New-AdobeGPOTemplate -Product Reader,Acrobat -Version DC,2017,2015

    Confirm
    Are you sure you want to perform this action?
    Performing the operation "Create files" on target "AdobeReader2015.adm?".
    [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): A

    It creates the following files:
        Adobe.admx, Adobe.adml
        AdobeAcrobat2015.admx, AdobeAcrobat2015.adml
        AdobeAcrobat2017.admx, AdobeAcrobat2017.adml
        AdobeAcrobatDC.admx, AdobeAcrobatDC.adml
        AdobeReader2015.admx, AdobeReader2015.adml
        AdobeReader2017.admx, AdobeReader2017.adml
        AdobeReaderDC.admx, AdobeReaderDC.adml




    -------------------------- EXAMPLE 2 --------------------------

    PS C:\>New-AdobeGPOTemplate -Product Reader -Version DC -Confirm:$false

    It creates without asking for confirmation the following files:
    Adobe.admx, Adobe.adml,
    AdobeReaderDC.admx, AdobeReaderDC.adml



```
<a name="WhatsNext"/>

## What's Next

Once you've created the Adobe GPO templates, you can test them locally and copy them to your local templates store:
```powershell
copy .\*.admx -Destination C:\Windows\PolicyDefinitions\
copy .\*.adml -Destination C:\Windows\PolicyDefinitions\en-US\
gpedit.msc
```

<a name="Issues"/>

## Issues
 * None

<a name="Todo"/>

## Todo

#### Coding best practices
- [x] Use PSScriptAnalyzer module to validate the code follows best practices
- [ ] Add more hardening/security settings
- [ ] Review the effect of these settings on Adobe products
- [ ] Write Pester tests for this module

<a name="Credits"/>

## Credits
Thanks go to:
* **[@iadgov](https://github.com/iadgov/)**: 

<a name="OtherLinks"/>

## Other links
* [https://p0w3rsh3ll.wordpress.com/2017/08/21/create-adobe-gpo-templates/](https://p0w3rsh3ll.wordpress.com/2017/08/21/create-adobe-gpo-templates/): 
   

