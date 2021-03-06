###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_safari_webkit_mult_vuln_may13_macosx.nasl 11865 2018-10-12 10:03:43Z cfischer $
#
# Apple Safari Webkit Multiple Vulnerabilities - May13 (Mac OS X)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803379");
  script_version("$Revision: 11865 $");
  script_cve_id("CVE-2013-0960", "CVE-2013-0961");
  script_bugtraq_id(58496, 58495);
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 12:03:43 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-05-02 15:50:15 +0530 (Thu, 02 May 2013)");
  script_name("Apple Safari Webkit Multiple Vulnerabilities - May13 (Mac OS X)");
  script_xref(name:"URL", value:"http://secunia.com/advisories/52658");
  script_xref(name:"URL", value:"http://support.apple.com/kb/HT5671");
  script_xref(name:"URL", value:"http://securitytracker.com/id/1028292");
  script_xref(name:"URL", value:"http://lists.apple.com/archives/security-announce/2013/Mar/msg00003.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("macosx_safari_detect.nasl");
  script_mandatory_keys("AppleSafari/MacOSX/Version");
  script_tag(name:"impact", value:"Successful exploitation will let the attacker cause memory corruption,
  arbitrary code execution or denial of service.");
  script_tag(name:"affected", value:"Apple Safari versions prior to 6.0.3 on Mac OS X");
  script_tag(name:"insight", value:"Multiple flaws due to unspecified memory corruption issues in WebKit.");
  script_tag(name:"solution", value:"Upgrade to Apple Safari version 6.0.3 or later.");
  script_tag(name:"summary", value:"The host is installed with Apple Safari web browser and is prone
  to multiple vulnerabilities.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.apple.com/support/downloads");
  exit(0);
}


include("version_func.inc");

osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit(0);
}

osVer = get_kb_item("ssh/login/osx_version");
if(!osVer){
  exit(0);
}

if("Mac OS X" >< osName)
{
  if(version_is_equal(version:osVer, test_version:"10.7.5")||
     version_is_equal(version:osVer, test_version:"10.8.2"))
  {
    safVer = get_kb_item("AppleSafari/MacOSX/Version");
    if(!safVer){
      exit(0);
    }

    if(version_is_less(version:safVer, test_version:"6.0.3"))
    {
      security_message( port: 0, data: "The target host was found to be vulnerable" );
      exit(0);
    }
  }
}
