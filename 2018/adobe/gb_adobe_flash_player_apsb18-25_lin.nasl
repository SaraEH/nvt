##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_flash_player_apsb18-25_lin.nasl 12116 2018-10-26 10:01:35Z mmartin $
#
# Adobe Flash Player Security Updates(apsb18-25)-Linux
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.813831");
  script_version("$Revision: 12116 $");
  script_cve_id("CVE-2018-12824", "CVE-2018-12825", "CVE-2018-12826", "CVE-2018-12827",
                "CVE-2018-12828");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:01:35 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-08-15 09:36:46 +0530 (Wed, 15 Aug 2018)");
  script_name("Adobe Flash Player Security Updates(apsb18-25)-Linux");

  script_tag(name:"summary", value:"This host is installed with Adobe Flash Player
  and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,

  - Multiple out-of-bounds read errors.

  - Use of a component with a known vulnerability.

  - An unknown security bypass vulnerability.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to escalate privileges, disclose sensitive information and bypass
  security restrictions.");

  script_tag(name:"affected", value:"Adobe Flash Player version before 30.0.0.154
  on Linux.");

  script_tag(name:"solution", value:"Upgrade to Adobe Flash Player version
  30.0.0.154, or later. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/flash-player/apsb18-25.html");
  script_xref(name:"URL", value:"http://get.adobe.com/flashplayer");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_adobe_flash_player_detect_lin.nasl");
  script_mandatory_keys("AdobeFlashPlayer/Linux/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE);
vers = infos['version'];
path = infos['location'];

if(version_is_less(version:vers, test_version:"30.0.0.154"))
{
  report =  report_fixed_ver(installed_version:vers, fixed_version:"30.0.0.154", install_path:path);
  security_message(data:report);
  exit(0);
}
