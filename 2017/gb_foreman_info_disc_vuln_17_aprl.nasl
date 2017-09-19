###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foreman_info_disc_vuln_17_aprl.nasl 7107 2017-09-12 09:26:09Z teissa $
#
# Foreman CVE-2017-2672 Information Disclosure Vulnerability
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = 'cpe:/a:theforeman:foreman';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107147");
  script_version("$Revision: 7107 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-12 11:26:09 +0200 (Tue, 12 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-04-11 07:35:49 +0200 (Tue, 11 Apr 2017)");
  script_cve_id("CVE-2017-2672");

  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("Foreman CVE-2017-2672 Information Disclosure Vulnerability");
  script_tag(name: "summary", value: "Foreman is prone to an information disclosure vulnerability.");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "When images for compute resources (e.g. an OpenStack image) are added/registered in Foreman, the password used to log in is recorded in plain text in the audit log. This may allow users with access to view the audit log to access newly provisioned hosts using the stored credentials. ");

  script_tag(name: "impact" , value: "Successful exploits may allow an attacker to gain access to sensitive information that may aid in further attacks.");

  script_tag(name: "affected", value: "Foreman 1.4 and later are vulnerable");

  script_tag(name: "solution", value: "A patch is available. Visit https://github.com/theforeman/foreman/commit/02489389f1a4443e1f437b86aa7ce245f1437020 for more information.");

  script_xref(name: "URL" , value: "http://www.securityfocus.com/bid/97526");
  script_tag(name:"solution_type", value:"VendorFix");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");

  script_family("Web application abuses");

  script_dependencies("gb_foreman_detect.nasl");
  script_mandatory_keys("foreman/installed");
  script_require_ports("Services/www", 443);

  exit(0);
}

include("host_details.inc");
include("version_func.inc");


if(!Port = get_app_port(cpe:CPE)){
  exit(0);
}

if(!Ver = get_app_version(cpe:CPE)){
  exit(0);
}

if(version_is_greater_equal(version: Ver, test_version:"1.4"))
{
  report =  report_fixed_ver(installed_version:Ver, fixed_version:"See Vendor");
  security_message(data:report);
  exit(0);
}