# Office Configuration

This folder contains various XML configuration files for use with the Microsoft Office Deployment Toolkit (ODT)

The ODT can be downloaded from Microsoft [here](https://www.microsoft.com/en-us/download/details.aspx?id=49117)

For a typical install, you'd run the following from an elevated command prompt:

~~~ cmd
> setup.exe /configure <insert configuration XML file here
~~~

If you just want to download, but not immediately install, run the following:

~~~ cmd
> setup.exe /download <insert configuration XML file here>
~~~

Current XML Files

* Business
  * 64-bit Monthly Channel
  * 64-bit Monthly Channel, Silent
  * 64-bit Semi Annual Channel
  * 64-bit Semi Annual Channel, Silent
* ProPlus
  * 64-bit Monthly Channel
  * 64-bit Monthly Channel, Silent
  * 64-bit Semi Annual Channel
  * 64-bit Semi Annual Channel, Silent

All configuration files are configured to exclude Groove. Groove is the old OneDrive for Business client and has been deprecated in favor of the new OneDrive client.