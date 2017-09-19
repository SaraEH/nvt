##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_7zip_detect_win.nasl 7000 2017-08-24 11:51:46Z teissa $
#
# 7zip Version Detection (Windows)
#
# Authors:
# Sujit Ghosal <sghosal@secpod.com>
#
# Kashinath T <tkashinath@secpod.com>
# - Updated to detect beta version.
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http//www.greenbone.net
#
# Updated By: Thanga Prakash S <tprakash@secpod.com> on 2014-05-07
# Updated according to CR57 and to support 32 and 64 bit.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800260");
  script_version("$Revision: 7000 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-08-24 13:51:46 +0200 (Thu, 24 Aug 2017) $");
  script_tag(name:"creation_date", value:"2009-04-02 08:15:32 +0200 (Thu, 02 Apr 2009)");
  script_tag(name:"qod_type", value:"registry");
  script_name("7zip Version Detection (Windows)");

  script_tag(name : "summary" , value : "Detection of installed version of
  7zip on Windows.

  The script logs in via smb, searches for 7zip in the registry
  and gets the version from 'DisplayName' string in registry.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("cpe.inc");
include("host_details.inc");
include("smb_nt.inc");
include("secpod_smb_func.inc");

## Variable Initialization
appExists = FALSE;
os_arch = "";
appName = "";
insloc = "";
appVer = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}

## Check for 7-Zip
appKey_list = make_list("SOFTWARE\7-Zip", "SOFTWARE\Wow6432Node\7-Zip",
                        "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\7-Zip");
foreach appKey (appKey_list)
{
  if(registry_key_exists(key:appKey))
  {
    appExists = TRUE;
    break;
  }
}

if (!appExists) exit(0);

## Check for 32 bit platform
if("x86" >< os_arch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

## Check for 64 bit platform
else if("x64" >< os_arch)
{
  key_list =  make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                        "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    ## Get the Application name
    appName = registry_get_sz(key:key + item, item:"DisplayName");

    ## Confirm the Application
    if("7-Zip" >< appName)
    {
      ## Extract the version
      appVer = eregmatch(pattern:"7-Zip (([0-9.]+)\ ?(beta)?)", string:appName);
      appVer = ereg_replace( pattern:" ", replace:":", string:appVer[1] );

      if(appVer != NULL)
      {
        insloc = registry_get_sz(key:key + item, item:"InstallLocation");
        if(!insloc)
            insloc = "Unable to find the install location";

        set_kb_item(name:"7zip/Win/Ver", value:appVer);

        ## Build CPE
        cpe = build_cpe(value:appVer, exp:"^([0-9.]+):?([a-z]+)?", base:"cpe:/a:7-zip:7-zip:");
        if(isnull(cpe))
          cpe = "cpe:/a:7-zip:7-zip";

        ## Register for 64 bit app on 64 bit OS once again
        if("64" >< os_arch && "Wow6432Node" >!< key)
        {
          set_kb_item(name:"7zip64/Win/Ver", value:appVer);

          ## Build CPE
          cpe = build_cpe(value:appVer, exp:"^([0-9.]+):?([a-z]+)?", base:"cpe:/a:7-zip:7-zip:x64:");
          if(isnull(cpe))
            cpe = "cpe:/a:7-zip:7-zip:x64";
        }

        register_product(cpe:cpe, location:insloc);
        
        ## Building report
        log_message(data: build_detection_report(app: appName,
                                           version: appVer,
                                           install: insloc,
                                           cpe: cpe,
                                           concluded: appVer));

      }
    }
  }
}