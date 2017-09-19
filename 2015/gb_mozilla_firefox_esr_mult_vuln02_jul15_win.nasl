###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_esr_mult_vuln02_jul15_win.nasl 6229 2017-05-29 09:04:10Z teissa $
#
# Mozilla Firefox ESR Multiple Vulnerabilities-02 July15 (Windows)
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

CPE = "cpe:/a:mozilla:firefox_esr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805909");
  script_version("$Revision: 6229 $");
  script_cve_id("CVE-2015-2725", "CVE-2015-2727", "CVE-2015-2729", "CVE-2015-2731",
                "CVE-2015-2741");
  script_bugtraq_id(75541);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-05-29 11:04:10 +0200 (Mon, 29 May 2017) $");
  script_tag(name:"creation_date", value:"2015-07-08 15:59:57 +0530 (Wed, 08 Jul 2015)");
  script_name("Mozilla Firefox ESR Multiple Vulnerabilities-02 July15 (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Mozilla
  Firefox ESR and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exist due to,
  - Multiple unspecified memory related errors.
  - An error within the 'AudioParamTimeline::AudioNodeInputValue' function in the
  Web Audio implementation .
  - An use-after-free error.
  - An overridable error allowing for skipping pinning checks.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code, obtain sensitive information, conduct
  man-in-the-middle attack and conduct denial-of-service attack.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Mozilla Firefox ESR 38.x before 38.1");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox ESR version
  38.1 or later, For updates refer to
  https://www.mozilla.org/en-US/firefox/organizations");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-59");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-67");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-63");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox-ESR/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ffVer = "";

## Get version
if(!ffVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check for vulnerable version
if(ffVer =~ "^(38)\.")
{
  if(version_is_less(version:ffVer, test_version:"38.1"))
  {
    report = 'Installed version: ' + ffVer +    '\n' +
             'Fixed version:     ' + "38.1" +   '\n';

    security_message(data:report);
    exit(0);
  }
}