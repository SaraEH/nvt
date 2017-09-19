###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_mult_vuln01_sep14_win.nasl 6735 2017-07-17 09:56:49Z teissa $
#
# Google Chrome Multiple Vulnerabilities - 01 Sep14 (Windows)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804763");
  script_version("$Revision: 6735 $");
  script_cve_id("CVE-2014-3177", "CVE-2014-3176", "CVE-2014-3175", "CVE-2014-3174",
                "CVE-2014-3173", "CVE-2014-3172", "CVE-2014-3171", "CVE-2014-3170",
                "CVE-2014-3169", "CVE-2014-3168");
  script_bugtraq_id(69404, 69402, 69407, 69403, 69401, 69406, 69400, 69405, 69398);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-17 11:56:49 +0200 (Mon, 17 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-09-11 11:23:16 +0530 (Thu, 11 Sep 2014)");

  script_name("Google Chrome Multiple Vulnerabilities - 01 Sep14 (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple Flaws are due to,
  - Some errors within V8, IPC, sync, and extensions.
  - A use-after-free error exists within SVG.
  - A use-after-free error exists within DOM.
  - An error within Extension permission dialog.
  - A use-after-free error exists within bindings.
  - An error exists within extension debugging.
  - An uninitialized memory read error exists in WebGL.
  - An uninitialized memory read error exists in Web Audio.
  - and some unspecified errors exist.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to spoof certain content, bypass certain security restrictions, and compromise
  a user's system.");

  script_tag(name: "affected" , value:"Google Chrome version prior to 37.0.2062.94
  on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Google Chrome version 37.0.2062.94
  or later, For updates refer to http://www.google.com/chrome");
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/60268");
  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1030767");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.com/2014/08/stable-channel-update_26.html");

  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_win.nasl");
  script_mandatory_keys("GoogleChrome/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
chromeVer = "";

## Get version
if(!chromeVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:chromeVer, test_version:"37.0.2062.94"))
{
  security_message(0);
  exit(0);
}