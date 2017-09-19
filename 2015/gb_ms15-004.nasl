###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-004.nasl 6211 2017-05-25 09:04:14Z teissa $
#
# Microsoft Windows Components Privilege Elevation Vulnerability (3025421)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.805037");
  script_version("$Revision: 6211 $");
  script_cve_id("CVE-2015-0016");
  script_bugtraq_id(71965);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-25 11:04:14 +0200 (Thu, 25 May 2017) $");
  script_tag(name:"creation_date", value:"2015-01-14 10:22:41 +0530 (Wed, 14 Jan 2015)");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Microsoft Windows Components Privilege Elevation Vulnerability (3025421)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-005.");

  script_tag(name: "vuldetect" , value: "Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name: "insight" , value: "The flaw is due to an error when
  handling directory traversal sequences within the TS WebProxy Windows
  component, which can be exploited to gain otherwise restricted privileges.");


  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to gain restricted privileges.

  Impact Level: System");

  script_tag(name: "affected" , value:"
  Microsoft Windows 8 x32/x64
  Microsoft Windows Server 2012/R2
  Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior");

  script_tag(name: "solution" , value: "Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS15-004");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/62076");
  script_xref(name : "URL" , value : "https://support.microsoft.com/kb/3025421");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-004");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
dllVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, win8:1,
                   win8x64:1, win2012:1, win2012R2:1, win8_1:1, win8_1x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllVer = fetch_file_version(sysPath, file_name:"system32\Tswbprxy.exe");
if(!dllVer){
  exit(0);
}

## Windows Vista and Windows Server 2008
## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Tswbprxy.exe version
  if(version_is_less(version:dllVer, test_version:"6.0.6002.19250") ||
     version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23556")){
    security_message(0);
  }
  exit(0);
}

## Windows 7 and Windows Server 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Tswbprxy.exe version
  if(version_is_less(version:dllVer, test_version:"6.1.7601.18699") ||
     version_in_range(version:dllVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22906")||
     version_in_range(version:dllVer, test_version:"6.2.9200.17000", test_version2:"6.2.9200.17211") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21328") ||
     version_in_range(version:dllVer, test_version:"6.3.9600.17000", test_version2:"6.3.9600.17552") ||
     version_in_range(version:dllVer, test_version:"6.1.7600.17000", test_version2:"6.1.7600.17714") ||
     version_in_range(version:dllVer, test_version:"6.1.7600.21000", test_version2:"6.1.7600.21908")){
    security_message(0);
  }
  exit(0);
}

## Windows 8 and Windows Server 2012
if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
  ## Check for Tswbprxy.exe version
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17213") ||
     version_in_range(version:dllVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21328")){
    security_message(0);
  }
  exit(0);
}

## Win 8.1 and win2012R2
if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Tswbprxy.exe version
  if(version_is_less(version:dllVer, test_version:"6.3.9600.17555")){
    security_message(0);
  }
  exit(0);
}