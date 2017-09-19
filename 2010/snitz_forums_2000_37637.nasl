###############################################################################
# OpenVAS Vulnerability Test
# $Id: snitz_forums_2000_37637.nasl 5401 2017-02-23 09:46:07Z teissa $
#
# Snitz Forums 2000 'X-Forwarded-For' SQL Injection Vulnerability
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

tag_summary = "Snitz Forums 2000 is prone to an SQL-injection vulnerability because
it fails to sufficiently sanitize user-supplied data before using it
in an SQL query.

Exploiting this issue could allow an attacker to compromise the
application, access or modify data, or exploit latent vulnerabilities
in the underlying database.

Snitz Forums 2000 3.4.07 is vulnerable; other versions may also
be affected.";


if (description)
{
 script_id(100431);
 script_version("$Revision: 5401 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-23 10:46:07 +0100 (Thu, 23 Feb 2017) $");
 script_tag(name:"creation_date", value:"2010-01-06 18:07:55 +0100 (Wed, 06 Jan 2010)");
 script_bugtraq_id(37637);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("Snitz Forums 2000 'X-Forwarded-For' SQL Injection Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37637");
 script_xref(name : "URL" , value : "http://forum.snitz.com/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2010 Greenbone Networks GmbH");
 script_dependencies("snitz_forums_2000_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if (!can_host_asp(port:port)) exit(0);

if(!version = get_kb_item(string("www/", port, "/SnitzForums")))exit(0);
if(!matches = eregmatch(string:version, pattern:"^(.+) under (/.*)$"))exit(0);

vers = matches[1];

if(!isnull(vers) && vers >!< "unknown") {

  if(version_is_equal(version: vers, test_version: "3.4.07")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);