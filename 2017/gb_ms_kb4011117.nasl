###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_kb4011117.nasl 7118 2017-09-13 15:08:32Z santu $
#
# Microsoft SharePoint Foundation 2013 Service Pack 1 Elevation of Privilege Vulnerability (KB4011117)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.811668");
  script_version("$Revision: 7118 $");
  script_cve_id("CVE-2017-8745");
  script_bugtraq_id(100753);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-09-13 17:08:32 +0200 (Wed, 13 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-09-13 09:20:23 +0530 (Wed, 13 Sep 2017)");
  script_name("Microsoft SharePoint Foundation 2013 Service Pack 1 Elevation of Privilege Vulnerability (KB4011117)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft KB4011117");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exists due to Microsoft SharePoint
  Server does not properly sanitize a specially crafted web request to an
  affected SharePoint server.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to perform cross-site scripting attacks on affected systems and
  run script in the security context of the current user. 

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft SharePoint Foundation 2013 Service Pack 1");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://support.microsoft.com/en-us/help/4011117");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/4011117");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_sharepoint_sever_n_foundation_detect.nasl");
  script_mandatory_keys("MS/SharePoint/Foundation/Ver");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");


## Variable Initialization
shareVer = "";
dllVer = "";
path = "";

if( ! infos = get_app_version_and_location( cpe:'cpe:/a:microsoft:sharepoint_foundation' ) ) exit( 0 );

## Get SharePoint Version
shareVer = infos['version'];
if(!shareVer){
  exit(0);
}

path = infos['location'];
if(!path || "Could not find the install location" >< path){
  exit(0);
}

##Check for Sharepoint 2013
if(shareVer =~ "^(15\.)")
{
  ## Get Common Files Directory
  path = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                         item:"CommonFilesDir");
  if(path)
  {
    ## Installation Path
    path = path + "\microsoft shared\Web Server Extensions\15\BIN";

    ## Get Version from 'Onetutil.dll' file
    dllVer = fetch_file_version(sysPath:path, file_name:"Onetutil.dll");
    if(dllVer)
    {
      if(version_in_range(version:dllVer, test_version:"15.0", test_version2:"15.0.4963.0999"))
      {
        report = 'File checked:     ' +  path + "\Onetutil.dll"+ '\n' +
                 'File version:     ' +  dllVer  + '\n' +
                 'Vulnerable range: ' +  "15.0 - 15.0.4963.0999" + '\n' ;
        security_message(data:report);
        exit(0);
      }
    }
  }
}
exit(0);