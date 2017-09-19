###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-033_macosx.nasl 6964 2017-08-18 12:07:12Z asteins $
#
# Microsoft Office Word Remote Code Execution Vulnerabilities-3048019 (Mac OS X)
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
  script_oid("1.3.6.1.4.1.25623.1.0.805064");
  script_version("$Revision: 6964 $");
  script_cve_id("CVE-2015-1641", "CVE-2015-1639");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-08-18 14:07:12 +0200 (Fri, 18 Aug 2017) $");
  script_tag(name:"creation_date", value:"2015-04-15 11:36:46 +0530 (Wed, 15 Apr 2015)");
  script_name("Microsoft Office Word Remote Code Execution Vulnerabilities-3048019 (Mac OS X)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS15-033.");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"Multiple flaws are exists when,
  - The Office software improperly handles objects in memory while parsing
    specially crafted Office files.
  - The Office software fails to properly handle rich text format files in
    memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user and
  to perform actions in the security context of the current user. 

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Office 2011 on Mac OS X");

  script_tag(name:"solution", value:"Apply the patch from below link,
  https://technet.microsoft.com/en-us/security/bulletin/ms15-033");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/2965210");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/help/3051737");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/ms15-033");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gb_microsoft_office_detect_macosx.nasl");
  script_mandatory_keys("MS/Office/MacOSX/Ver");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
offVer = "";

## Get the version from KB
offVer = get_kb_item("MS/Office/MacOSX/Ver");

## check the version from KB
if(!offVer || !(offVer =~ "^(14)")){
  exit(0);
}

## Check for Office Version < 2011 (14.4.9 )
if(version_in_range(version:offVer, test_version:"14.0", test_version2:"14.4.8"))
{
  security_message(0);
  exit(0);
}