###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssh_mult_vuln_jan17_win.nasl 6599 2017-07-07 09:50:33Z cfischer $
#
# OpenSSH Multiple Vulnerabilities Jan17 (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:openbsd:openssh";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810325");
  script_version("$Revision: 6599 $");
  script_cve_id("CVE-2016-10009", "CVE-2016-10010", "CVE-2016-10011", "CVE-2016-10012");
  script_bugtraq_id(94968, 94972, 94977, 94975);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:50:33 +0200 (Fri, 07 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-01-06 10:55:34 +0530 (Fri, 06 Jan 2017)");
  script_name("OpenSSH Multiple Vulnerabilities Jan17 (Windows)");

  script_tag(name:"summary", value:"This host is installed with openssh and
  is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to,
  - An 'authfile.c' script does not properly consider the effects of realloc
    on buffer contents.
  - The shared memory manager (associated with pre-authentication compression)
    does not ensure that a bounds check is enforced by all compilers.
  - The sshd in OpenSSH creates forwarded Unix-domain sockets as root, when
    privilege separation is not used.
  - An untrusted search path vulnerability in ssh-agent.c in ssh-agent.");

  script_tag(name:"impact", value:"Successfully exploiting this issue allows
  local users to obtain sensitive private-key information, to gain privileges,
  and allows remote attackers to execute arbitrary local PKCS#11 modules.

  Impact Level: Application");

  script_tag(name:"affected", value:"OpenSSH versions before 7.4 on Windows");

  script_tag(name:"solution", value:"Upgrade to OpenSSH version 7.4 or later.
  For updates refer to http://www.openssh.com");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_xref(name : "URL" , value : "https://www.openssh.com/txt/release-7.4");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2016/12/19/2");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("ssh_detect.nasl", "os_detection.nasl");
  script_require_ports("Services/ssh", 22);
  script_mandatory_keys("openssh/detected", "Host/runs_windows");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");


# Variable Initialization
sshPort = "";
sshVer = "";

## exit, if its not Windows
if(host_runs("Windows") != "yes") exit(0);

## get the port
if(!sshPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
if(!sshVer = get_app_version(cpe:CPE, port:sshPort)){
  exit(0);
}

##Check for vulnerable version
if(version_is_less(version:sshVer, test_version:"7.4"))
{
  report = report_fixed_ver(installed_version:sshVer, fixed_version:'7.4');
  security_message(port:sshPort, data:report);
  exit(0);
}