###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms14-007.nasl 5346 2017-02-19 08:43:11Z cfi $
#
# Microsoft Windows Direct2D Remote Code Execution Vulnerability (2912390)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2014 SecPod, http://www.secpod.com
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
  script_id(903431);
  script_version("$Revision: 5346 $");
  script_cve_id("CVE-2014-0263");
  script_bugtraq_id(65393);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-19 09:43:11 +0100 (Sun, 19 Feb 2017) $");
  script_tag(name:"creation_date", value:"2014-02-12 11:41:52 +0530 (Wed, 12 Feb 2014)");
  script_name("Microsoft Windows Direct2D Remote Code Execution Vulnerability (2912390)");

  tag_summary =
"This host is missing a critical security update according to Microsoft
Bulletin MS14-007.";

  tag_vuldetect =
"Get the vulnerable file version and check appropriate patch is applied
or not.";

  tag_insight =
"The flaw is due to an unspecified error within Direct2D when handling
specially crafted 2D geometric figures and can be exploited to cause
memory corruption.";

  tag_impact =
"Successful exploitation will allow attackers to execute arbitrary code and
take complete control of an affected system.

Impact Level: System";

  tag_affected =
"Microsoft Windows 8
Microsoft Windows 8.1 x32/x64
Microsoft Windows Server 2012
Microsoft Windows 7 x32/x64 Service Pack 1 and prior
Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior";

  tag_solution =
"Run Windows Update and update the listed hotfixes or download and
update mentioned hotfixes in the advisory from the below link,
http://technet.microsoft.com/en-us/security/bulletin/ms14-007";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/56781");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/2912390");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/security/bulletin/ms14-007");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
sysVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2,
   win8:1, win8x64:1, win2012:1, win8_1:1, win8_1x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version from D2d1.dll file
sysVer = fetch_file_version(sysPath, file_name:"system32\D2d1.dll");
if(!sysVer){
  exit(0);
}

## Windows 7 and Windows 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## As only systems running Windows 7 or Windows Server 2008 R2 that
  ## have platform update 2670838 installed are vulnerable.
  ## After update KB2670838, D2d1.dll == 6.2.9200.16492

  ## Check if platform update 2670838 is installed
  ## Check for D2d1.dll version
  if(version_is_equal(version:sysVer, test_version:"6.2.9200.16492")){
    security_message(0);
  }
  exit(0);
}

## Win 8 and 2012
else if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
 ## Check for D2d1.dll version
  if(version_is_less(version:sysVer, test_version:"6.2.9200.16765") ||
     version_in_range(version:sysVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.20881")){
    security_message(0);
  }
  exit(0);
}

## Win 8.1
## Currently not supporting for Windows Server 2012 R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1) > 0)
{
  if(version_is_less(version:sysVer, test_version:"6.3.9600.16473")){
   security_message(0);
  }
  exit(0);
}