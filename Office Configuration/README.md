# Office 365 ODT XML Configuration Files

This folder contains various XML configuration files for use with the Microsoft Office Deployment Toolkit (ODT)

The ODT can be downloaded from Microsoft [here](https://www.microsoft.com/en-us/download/details.aspx?id=49117)

For a typical install, you'd run the following from an elevated command prompt:

~~~ cmd
> setup.exe /configure <insert configuration XML file here>
~~~

If you just want to download, but not immediately install, run the following:

~~~ cmd
> setup.exe /download <insert configuration XML file here>
~~~

Current XML Configuration Files

* Business
  * [64-bit Monthly Channel](configuration_Business_Monthly_x64.xml)
  * [64-bit Monthly Channel, Silent](configuration_Business_Monthly_x64_silent.xml)
  * [64-bit Semi Annual Channel](configuration_Business_Semi-Annual_x64.xml)
  * [64-bit Semi Annual Channel, Silent](configuration_Business_Semi-Annual_x64_silent.xml)
* ProPlus
  * [64-bit Monthly Channel](configuration_ProPlus_Monthly_x64.xml)
  * [64-bit Monthly Channel, Silent](configuration_ProPlus_Monthly_x64_silent.xml)
  * [64-bit Semi Annual Channel](configuration_ProPlus_Semi-Annual_x64.xml)
  * [64-bit Semi Annual Channel, Silent](configuration_ProPlus_Semi-Annual_x64_silent.xml)

All configuration files are set to exclude Groove. Groove is the old OneDrive for Business client and has been deprecated in favor of the new OneDrive client.

None of these fit your needs? Need something oddly specific?
Check out the [Office Click-To-Run Configuration XML Editor](https://officedev.github.io/Office-IT-Pro-Deployment-Scripts/XmlEditor.html) from [@OfficeDev](https://github.com/OfficeDev)