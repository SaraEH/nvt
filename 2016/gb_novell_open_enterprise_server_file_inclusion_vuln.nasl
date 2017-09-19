###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_novell_open_enterprise_server_file_inclusion_vuln.nasl 7174 2017-09-18 11:48:08Z asteins $
#
# Novell Open Enterprise Server File Inclusion Vulnerability
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

CPE = "cpe:/a:novell:open_enterprise_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809480");
  script_version("$Revision: 7174 $");
  script_cve_id("CVE-2016-5763");
  script_bugtraq_id(94348);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-09-18 13:48:08 +0200 (Mon, 18 Sep 2017) $");
  script_tag(name:"creation_date", value:"2016-11-25 10:29:09 +0530 (Fri, 25 Nov 2016)");
  script_name("Novell Open Enterprise Server File Inclusion Vulnerability");

  script_tag(name:"summary", value:"This host is installed with Novell Open
  Enterprise Server and is prone to file inclusion vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to 'namuseradd -a' creates
  incorrectly named der files in '/var/lib/novell-lum'.");

  script_tag(name:"impact", value:"Successful exploitation will allow authenticated
  remote attackers to perform unauthorized file access and modification.

  Impact Level: System/Application.");

  script_tag(name:"affected", value:"
  Novell OES2015 SP1 before Scheduled Maintenance Update 10992,
  Novell OES2015 before Scheduled Maintenance Update 10990,
  Novell OES11 SP3 before Scheduled Maintenance Update 10991,
  Novell OES11 SP2 before Scheduled Maintenance Update 10989.");

  script_tag(name:"solution", value:"Upgrade to Novell OES2015 SP1 Scheduled
  Maintenance Update 10992, OES2015 Scheduled Maintenance Update 10990,
  OES11 SP3 Scheduled Maintenance Update 10991, OES11 SP2 Scheduled Maintenance
  Update 10989 or later. For updates refer to http://download.novell.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name:"URL", value:"http://download.novell.com/Download?buildid=dfqmrymc0Rg~");
  script_xref(name:"URL", value:"http://download.novell.com/Download?buildid=s9_RxhgC8KU~");

  script_family("Web application abuses");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_novell_open_enterprise_server_remote_detect.nasl");
  script_mandatory_keys("Novell/Open/Enterprise/Server/Installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
report = "";
novellVer = "";
novellPort = "";

# Get HTTP Port
if(!novellPort = get_app_port(cpe:CPE)){
  exit(0);
}

# Get MovableType Version
if(!novellVer = get_app_version(cpe:CPE, port:novellPort)){
  exit(0);
}

# Check for vulnerable version 
if(version_is_less(version:novellVer, test_version:"11.SP3") ||
   version_is_less(version:novellVer, test_version:"2015.SP1"))
{
  report = report_fixed_ver(installed_version:novellVer, fixed_version:"Upgrade to Appropriate Scheduled Maintenance Update");
  security_message(data:report, port:novellPort);
  exit(0);
}