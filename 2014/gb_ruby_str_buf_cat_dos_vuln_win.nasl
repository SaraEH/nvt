###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ruby_str_buf_cat_dos_vuln_win.nasl 6750 2017-07-18 09:56:47Z teissa $
#
# Ruby 'str_buf_cat' function Denial-of-Service Vulnerability (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:ruby-lang:ruby";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804888");
  script_version("$Revision: 6750 $");
  script_cve_id("CVE-2014-3916");
  script_bugtraq_id(67705);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-18 11:56:47 +0200 (Tue, 18 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-11-21 11:58:24 +0530 (Fri, 21 Nov 2014)");
  script_name("Ruby 'str_buf_cat' function Denial-of-Service Vulnerability (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Ruby and is
  prone to denial-of-service vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help of
  detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Flaw exists due to an error in 'str_buf_cat'
  function in string.c script triggered when handling an overly long string.");

  script_tag(name: "impact" , value:"Successful exploitation will allow attackers
  to cause a denial of service (crash) condition.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Ruby versions 1.9.3, 2.0.0 and 2.1.0 on
  Windows.");

  script_tag(name: "solution" , value:"Upgrade to Ruby 2.1.3 or later. For updates
  refer http://www.ruby-lang.org");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://bugs.ruby-lang.org/issues/9709");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/93505");
  script_xref(name:"URL", value:"http://svn.ruby-lang.org/repos/ruby/tags/v2_1_3/ChangeLog");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_ruby_detect_win.nasl");
  script_mandatory_keys("Ruby/Win/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
rubyVer = "";

## Get version from KB
if(!rubyVer = get_app_version(cpe:CPE)){
  exit(0);
}

if(rubyVer)
{
  ## Check for version
  if(version_in_range(version:rubyVer, test_version:"1.9.3.0", test_version2:"2.1.0"))
  {
    security_message(0);
  }
}

if(rubyVer =~ "^(2\.1\.0\.)")
{
  ## Check for version
  if(version_is_less(version:rubyVer, test_version:"2.1.1"))
  {
    security_message(0);
    exit(0);
  }
}