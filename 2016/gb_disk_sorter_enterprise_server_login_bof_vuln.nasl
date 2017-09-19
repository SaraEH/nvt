##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_disk_sorter_enterprise_server_login_bof_vuln.nasl 6586 2017-07-07 06:23:25Z cfischer $
#
# Disk Sorter Enterprise Server Buffer Overflow Vulnerability
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:disksorter:disksorter_enterprise_web_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810301");
  script_version("$Revision: 6586 $");
  script_cve_id("CVE-2017-7230");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-07 08:23:25 +0200 (Fri, 07 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-12-02 17:06:55 +0530 (Fri, 02 Dec 2016)");
  script_name("Disk Sorter Enterprise Server Buffer Overflow Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_disk_sorter_enterprise_server_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("DiskSorter/Enterprise/Server/installed");

  script_xref(name:"URL", value:"http://www.disksorter.com");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/41666/");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/40833/");
  script_xref(name:"URL", value:"https://www.exploit-db.com/exploits/40458/");

  script_tag(name:"summary", value:"The host is running Disk Sorter Enterprise
  Server and is prone to a buffer overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help of
  detect NVT and check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an improper handling of
  'Login' and 'GET' requests.");

  script_tag(name:"impact", value:"Successful exploitation may allow remote
  attackers to execute remote code or cause the application to crash, creating
  a denial-of-service condition.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Disk Sorter Enterprise Server version 9.5.12
  and prior.");

  script_tag(name:"solution", value:"No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore. General solution options
  are to upgrade to a newer release, disable respective features, remove the product or replace the product
  by another one.");

  script_tag(name:"solution_type", value:"WillNotFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less_equal( version:vers, test_version:"9.5.12" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"None Available" );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );