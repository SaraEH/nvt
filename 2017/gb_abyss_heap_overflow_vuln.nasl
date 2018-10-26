###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_abyss_heap_overflow_vuln.nasl 12106 2018-10-26 06:33:36Z cfischer $
#
# Abyss Web Server Heap Overflow Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = 'cpe:/a:aprelium:abyss_web_server';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.140581");
  script_version("$Revision: 12106 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 08:33:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2017-12-05 13:18:33 +0700 (Tue, 05 Dec 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Abyss Web Server Heap Overflow Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_abyss_detect.nasl");
  script_mandatory_keys("abyss/installed");

  script_tag(name:"summary", value:"Abyss Web Server is prone to a heap overflow vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"It is possible to corrupt heap memory of the Abyss Web Server by sending
specially crafted HTML in repeated HTTP POST requests.");

  script_tag(name:"impact", value:"An unauthenticated attacker may conduct a denial of service attack or
execute arbitrary code.");

  script_tag(name:"affected", value:"Abyss Web Server prior to version 2.11.6.");

  script_tag(name:"solution", value:"Update to version 2.11.6 or later.");

  script_xref(name:"URL", value:"http://hyp3rlinx.altervista.org/advisories/ABYSS-WEB-SERVER-MEMORY-HEAP-CORRUPTION.txt");
  script_xref(name:"URL", value:"https://aprelium.com/news/abws2-11-6.html");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2.11.6")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.11.6");
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
