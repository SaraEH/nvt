###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_code_exec_vuln_jan15_lin.nasl 6513 2017-07-04 09:59:28Z teissa $
#
# Adobe Flash Player Unspecified Code Execution Vulnerability - Jan15 (Linux)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = "cpe:/a:adobe:flash_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805261");
  script_version("$Revision: 6513 $");
  script_cve_id("CVE-2015-0311", "CVE-2015-0312");
  script_bugtraq_id(72283, 72343);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-04 11:59:28 +0200 (Tue, 04 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-01-27 16:19:35 +0530 (Tue, 27 Jan 2015)");
  script_name("Adobe Flash Player Unspecified Code Execution Vulnerability - Jan15 (Linux)");

  script_tag(name: "summary" , value: "This host is installed with Adobe Flash
  Player and is prone to unspecified arbitrary code execution vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The flaw exists due to some unspecified
  error and double-free flaw that is triggered as user-supplied input is not
  properly validated.");

  script_tag(name: "impact" , value: "Successful exploitation will allow
  remote attackers to compromise a user's system.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Adobe Flash Player through version
  11.2.202.438 on Linux.");

  script_tag(name: "solution" , value:"Upgrade to Adobe Flash Player version
  11.2.202.440 or later. For updates refer http://get.adobe.com/flashplayer");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name: "URL" , value : "http://secunia.com/advisories/62432");
  script_xref(name: "URL" , value : "http://helpx.adobe.com/security/products/flash-player/apsa15-01.html");
  script_xref(name: "URL" , value : "http://www.rapid7.com/db/vulnerabilities/adobe-flash-apsb15-03-cve-2015-0312");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Linux/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
playerVer = "";

## Get version
if(!playerVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:playerVer, test_version:"11.2.202.440"))
{
  report = 'Installed version: ' + playerVer + '\n' +
           'Fixed version:     11.2.202.440\n';
  security_message(data:report);
  exit(0);
}