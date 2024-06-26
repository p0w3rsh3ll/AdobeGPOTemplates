﻿@{

# Script module or binary module file associated with this manifest.
RootModule = 'AdobeGPOTemplates.psm1'

# Version number of this module.
ModuleVersion = '1.0.3'

# ID used to uniquely identify this module
GUID = '27e77a2e-7108-4769-9e84-99055ded8eb9'

# Author of this module
Author = 'Emin Atac'

# Copyright statement for this module
Copyright = 'BSD 3-Clause'

# Description of the functionality provided by this module
Description = 'AdobeGPOTemplates is a module that will help create group policies (GPO) ADMX templates for Adobe Reader and Acrobat'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = '4.0'

# Functions to export from this module
FunctionsToExport = @('New-AdobeGPOTemplate')
# FunctionsToExport = '*'

PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('security','defense','Adobe','PSEdition_Core','PSEdition_Desktop')

        # A URL to the license for this module.
        LicenseUri = 'https://opensource.org/licenses/BSD-3-Clause'

        # A URL to the main website for this project.
         ProjectUri = 'https://github.com/p0w3rsh3ll/AdobeGPOTemplates'

    } # End of PSData hashtable

} # End of PrivateData hashtable


}

