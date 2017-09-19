###############################################################################
# OpenVAS Vulnerability Test
# $Id: samba_37992.nasl 4396 2016-11-01 09:04:50Z cfi $
#
# Samba 'mount.cifs' Utility Local Privilege Escalation Vulnerability
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH
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

CPE = "cpe:/a:samba:samba";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.100476");
  script_version("$Revision: 4396 $");
  script_tag(name:"last_modification", value:"$Date: 2016-11-01 10:04:50 +0100 (Tue, 01 Nov 2016) $");
  script_tag(name:"creation_date", value:"2010-01-29 17:41:41 +0100 (Fri, 29 Jan 2010)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_bugtraq_id(37992);
  script_cve_id("CVE-2009-3297", "CVE-2010-0787");
  script_name("Samba 'mount.cifs' Utility Local Privilege Escalation Vulnerability");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
  script_dependencies("smb_nativelanman.nasl", "gb_samba_detect.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("samba/detected");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/37992");
  script_xref(name:"URL", value:"http://www.samba.org");

  tag_summary = "Samba is prone to a local privilege-escalation vulnerability in the
  'mount.cifs' utility.";

  tag_impact = "Local attackers can exploit this issue to gain elevated privileges on
  affected computers.";

  tag_solution = "Updates are available. Please see the references for more information.";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"solution", value:tag_solution);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less_equal( version:vers, test_version:"3.4.5" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"3.4.6");
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );