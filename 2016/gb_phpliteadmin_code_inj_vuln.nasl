###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_phpliteadmin_code_inj_vuln.nasl 5782 2017-03-30 09:01:05Z teissa $
#
# phpLiteAdmin PHP Code Injection Vulnerability
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = "cpe:/a:phpliteadmin_project:phpliteadmin";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106117");
  script_version("$Revision: 5782 $");
  script_tag(name: "last_modification", value: "$Date: 2017-03-30 11:01:05 +0200 (Thu, 30 Mar 2017) $");
  script_tag(name: "creation_date", value: "2016-07-05 12:29:33 +0700 (Tue, 05 Jul 2016)");
  script_tag(name: "cvss_base", value: "7.5");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:S/C:C/I:P/A:N");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("phpLiteAdmin PHP Code Injection Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_phpliteadmin_detect.nasl");
  script_mandatory_keys("phpliteadmin/installed");

  script_tag(name: "summary", value: "phpLiteAdmin is prone to a PHP code injection vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "An authenticated attacker can create a sqlite Database with a php
extension and insert PHP Code as text fields. When done the attacker can execute it simply by access the
database file with the Webbrowser.");

  script_tag(name: "impact", value: "An attacker may execute arbitrary PHP code.");

  script_tag(name: "affected", value: "Version <= 1.9.3");

  script_tag(name: "solution", value: "Update to 1.9.4 or newer.");

  script_xref(name: "URL", value: "https://www.exploit-db.com/exploits/24044/");


  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE))
  exit(0);

if (version_is_less(version: version, test_version: "1.9.4")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "1.9.4");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);