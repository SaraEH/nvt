###############################################################################
# OpenVAS Vulnerability Test
#
# Microsoft Windows Journal Remote Code Execution Vulnerability (2975689)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.804473");
  script_version("2019-05-03T12:31:27+0000");
  script_cve_id("CVE-2014-1824");
  script_bugtraq_id(68396);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2019-05-03 12:31:27 +0000 (Fri, 03 May 2019)");
  script_tag(name:"creation_date", value:"2014-07-09 09:01:16 +0530 (Wed, 09 Jul 2014)");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Microsoft Windows Journal Remote Code Execution Vulnerability (2975689)");


  script_tag(name:"summary", value:"This host is missing an critical security update according to
Microsoft Bulletin MS14-038");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"The flaw is due to an unspecified error within Windows Journal when handling
Journal (JNT) files.");
  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to execute arbitrary code
and compromise a user's system.");
  script_tag(name:"affected", value:"Microsoft Windows 8
Windows 8.1 x32/x64 Edition
Microsoft Windows Server 2012/R2
Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior
Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior");
  script_tag(name:"solution", value:"The vendor has released updates. Please see the references for more information.");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://secunia.com/advisories/59776");
  script_xref(name:"URL", value:"https://support.microsoft.com/kb/2971850");
  script_xref(name:"URL", value:"https://technet.microsoft.com/en-us/security/bulletin/ms14-038");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, win8:1,
                   win2012:1, win2012R2:1, win8_1:1, win8_1x64:1) <= 0){
  exit(0);
}

sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                           item:"CommonFilesDir");
if(!sysPath){
  exit(0);
}

sysPath = sysPath + "\Microsoft Shared\ink";

Win32sysVer = fetch_file_version(sysPath:sysPath, file_name:"Journal.dll");
if(!Win32sysVer){
  exit(0);
}

## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(version_is_less(version:Win32sysVer, test_version:"6.0.6002.19116") ||
     version_in_range(version:Win32sysVer, test_version:"6.0.6002.22000", test_version2:"6.0.6002.23414")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(version_is_less(version:Win32sysVer, test_version:"6.1.7601.18493") ||
     version_in_range(version:Win32sysVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.22708")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

else if(hotfix_check_sp(win8:1, win2012:1) > 0)
{
  if(version_is_less(version:Win32sysVer, test_version:"6.2.9200.17016") ||
     version_in_range(version:Win32sysVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21134")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}

## Win 8.1 Windows Server 2012 R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  if(version_is_less(version:Win32sysVer, test_version:"6.3.9600.16670") ||
     version_in_range(version:Win32sysVer, test_version:"6.3.9600.17000", test_version2:"6.3.9600.17194")){
    security_message( port: 0, data: "The target host was found to be vulnerable" );
  }
  exit(0);
}
