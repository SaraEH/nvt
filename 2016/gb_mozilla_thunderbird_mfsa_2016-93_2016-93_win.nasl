###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mfsa_2016-93_2016-93_win.nasl 4660 2016-12-02 12:23:55Z antu123 $
#
# Mozilla Thunderbird Security Updates( mfsa_2016-93_2016-93 )-Windows
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mozilla:thunderbird";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809821");
  script_version("$Revision: 4660 $");
  script_cve_id("CVE-2016-5296", "CVE-2016-5294", "CVE-2016-5297", "CVE-2016-9066", 
                "CVE-2016-5291", "CVE-2016-9074", "CVE-2016-5290");
  script_bugtraq_id(94339, 94336, 94341, 94335);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2016-12-02 13:23:55 +0100 (Fri, 02 Dec 2016) $");
  script_tag(name:"creation_date", value:"2016-12-01 11:45:00 +0530 (Thu, 01 Dec 2016)");
  script_name("Mozilla Thunderbird Security Updates( mfsa_2016-93_2016-93 )-Windows");

  script_tag(name: "summary" , value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exist due to,
  - Heap-buffer-overflow WRITE in rasterize_edges_1.
  - Arbitrary target directory for result files of update process.
  - Incorrect argument length checking in JavaScript.
  - Integer overflow leading to a buffer overflow in nsScriptLoadHandler.
  - Same-origin policy violation using local HTML file and saved shortcut file.
  - Insufficient timing side-channel resistance in divSpoiler.");

  script_tag(name: "impact" , value:"Successful exploitation of this vulnerability
  will allow remote attackers to execute arbitrary code, to delete arbitrary files
  by leveraging certain local file execution, to obtain sensitive information, and
  to cause a denial of service.

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Mozilla Thunderbird version before
  45.5 on Windows.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Thunderbird version 45.5
  or later. For updates refer https://www.mozilla.org/en-US/thunderbird");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-93");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_thunderbird_detect_win.nasl");
  script_mandatory_keys("Thunderbird/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
tbVer = "";

## Get version
if(!tbVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(version_is_less(version:tbVer, test_version:"45.5"))
{
  report = report_fixed_ver(installed_version:tbVer, fixed_version:"45.5");
  security_message(data:report);
  exit(0);
}