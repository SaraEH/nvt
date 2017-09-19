###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_puppet_enterprise_dos_vuln.nasl 5558 2017-03-13 10:17:05Z antu123 $
#
# Puppet Enterprise DoS Vulnerability 
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

CPE = "cpe:/a:puppet:enterprise";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106582");
  script_version("$Revision: 5558 $");
  script_tag(name: "last_modification", value: "$Date: 2017-03-13 11:17:05 +0100 (Mon, 13 Mar 2017) $");
  script_tag(name: "creation_date", value: "2017-02-09 13:27:28 +0700 (Thu, 09 Feb 2017)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

  script_cve_id("CVE-2016-9686");

  script_tag(name: "qod_type", value: "remote_banner_unreliable");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Puppet Enterprise DoS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_puppet_enterprise_detect.nasl");
  script_mandatory_keys("puppet_enterprise/installed");

  script_tag(name: "summary", value: "Puppet Enterprise is prone to a denial of service vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "The Puppet Communications Protocol (PCP) broker incorrectly validates
message header sizes. An attacker could use this vulnerability to crash the PCP broker, preventing commands from
being sent to agents.");

  script_tag(name: "affected", value: "Puppet Enterprise 2015.3.x and 2016.x.");

  script_tag(name: "solution", value: "Update to version 2016.4.3, 2016.5.2 or later.");

  script_xref(name: "URL", value: "https://puppet.com/security/cve/cve-2016-9686");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "2016.4.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2016.4.3");
  security_message(port: port, data: report);
  exit(0);
}

if (version =~ "^2016\.5") {
  if (version_is_less(version: version, test_version:"2016.5.2")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "2016.5.2");
    security_message(port: port, data: report);
    exit(0);
  }
}

exit(0);