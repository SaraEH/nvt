###############################################################################
# OpenVAS Vulnerability Test
# Id: gb_unrealircd_local_priv_esc_vuln.nasl 66332 2017-02-02 14:01:01Z antu123 $
#
# UnrealIRCd Local Privilege Escalation Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:unrealircd:unrealircd";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811317");
  script_version("$Revision: 7066 $");
  script_cve_id("CVE-2017-13649");
  script_bugtraq_id(100507);
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-09-06 12:29:37 +0200 (Wed, 06 Sep 2017) $");
  script_tag(name:"creation_date", value:"2017-08-31 14:02:54 +0530 (Thu, 31 Aug 2017)");
  script_name("UnrealIRCd Local Privilege Escalation Vulnerability");

  script_tag(name: "summary" , value:"This host is installed with UnrealIRCd
  and is prone to local privilege escalation vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to error in handling
  of PID file. A PID file after dropping privileges to a non-root account, which
  might allow local users to kill arbitrary processes by leveraging access to
  this non-root account for PID file modification before a root script executes
  a 'kill cat /pathname' command.");

  script_tag(name: "impact" , value:"Successful exploitation of this vulnerability
  will allow attackers to gain elevated privileges. 

  Impact Level: Application.");

  script_tag(name: "affected" , value:"UnrealIRCd versions 4.0.13  and prior.");

  script_tag(name: "solution" , value:"No solution or patch is available as
  of 31st August, 2017. Information regarding this issue will be updated once the
  solution details are available.
  For updates refer to https://www.unrealircd.org");
 
  script_tag(name:"solution_type", value:"NoneAvailable");
  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name:"URL", value:"https://vuldb.com/?id.105695");
  script_xref(name:"URL", value:"http://seclists.org/oss-sec/2017/q3/343");
  script_xref(name:"URL", value:"https://bugs.unrealircd.org/view.php?id=4990");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_unrealircd_detect.nasl");
  script_mandatory_keys("UnrealIRCD/Detected");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

##Get port from CPE
if(!UnPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Get Version from CPE
if(!UnVer = get_app_version(cpe:CPE, port:UnPort)){
  exit(0);
}

## Check for vulnerable versions
if(version_is_less_equal(version:UnVer, test_version:"4.0.13"))
{
  report = report_fixed_ver(installed_version:UnVer, fixed_version:"NoneAvailable");
  security_message(data:report, port:UnPort);
  exit(0);
}
exit(0);