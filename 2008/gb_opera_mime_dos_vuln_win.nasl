###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_opera_mime_dos_vuln_win.nasl 6532 2017-07-05 07:42:05Z cfischer $
#
# Opera Web Browser DoS attacks on MIME via malformed MIME emails (Windows)
#
# Authors:
# Chandan S <schandan@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation could result in web browser crash.
  Impact Level: Application";
tag_affected = "Opera version 9.51 on Windows.";
tag_insight = "Flaw is due to improper handling of multipart/mixed e-mail messages
  with many MIME parts and e-mail messages with many Content-type: message/rfc822
  headers.";
tag_solution = "Upgrade to higher version of Opera
  http://www.opera.com/download/";
tag_summary = "The host is installed with Opera Web Browser and is prone to
  denial of service vulnerability.";

if(description)
{
  script_id(800081);
  script_version("$Revision: 6532 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-05 09:42:05 +0200 (Wed, 05 Jul 2017) $");
  script_tag(name:"creation_date", value:"2008-12-16 16:12:00 +0100 (Tue, 16 Dec 2008)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_cve_id("CVE-2008-5428");
  script_name("Opera Web Browser DoS attacks on MIME via malformed MIME emails (Windows)");
  script_xref(name : "URL" , value : "http://mime.recurity.com/cgi-bin/twiki/view/Main/AttackIntro");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_opera_detection_win_900036.nasl");
  script_mandatory_keys("Opera/Win/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}

if( ! version = get_kb_item( "Opera/Win/Version" ) ) exit( 0 );

if( version =~ "9.51" ) {
  security_message( port:0 );
  exit( 0 );
}

exit( 99 );