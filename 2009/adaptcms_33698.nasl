###############################################################################
# OpenVAS Vulnerability Test
# $Id: adaptcms_33698.nasl 5768 2017-03-29 13:37:01Z cfi $
#
# AdaptCMS Lite Cross Site Scripting and Remote File Include Vulnerabilities
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "AdaptCMS Lite is prone to multiple cross-site scripting
vulnerabilities and a remote file-include vulnerability because it
fails to sufficiently sanitize user-supplied data.

An attacker can exploit these issues to execute malicious PHP code
in the context of the webserver process. This may allow the attacker
to compromise the application and the underlying system. The
attacker may also execute script code in an unsuspecting user's
browser or steal cookie-based authentication credentials; other
attacks are also possible.

AdaptCMS Lite 1.4 and 1.5 are vulnerable; other versions may also
be affected.";

if (description)
{
 script_id(100373);
 script_version("$Revision: 5768 $");
 script_tag(name:"last_modification", value:"$Date: 2017-03-29 15:37:01 +0200 (Wed, 29 Mar 2017) $");
 script_tag(name:"creation_date", value:"2009-12-02 19:43:26 +0100 (Wed, 02 Dec 2009)");
 script_bugtraq_id(33698);
 script_tag(name:"cvss_base", value:"4.3");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
 script_cve_id("CVE-2009-0526");
 script_name("AdaptCMS Lite Cross Site Scripting and Remote File Include Vulnerabilities");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/33698");
 script_xref(name : "URL" , value : "http://www.adaptcms.com");
 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
   
port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);

foreach dir( make_list_unique( "/adaptcms", "/cms", cgi_dirs( port:port ) ) ) {

  if( dir == "/" ) dir = "";
  url = string(dir, "/sitemap.xml"); 
  buf = http_get_cache(item:url, port:port);
  if( buf == NULL )continue;

  if(egrep(pattern: "Generated by AdaptCMS", string: buf, icase: TRUE)) {
     
    url = string(dir, "/index.php?view=redirect&url=javascript:alert(%22openvas-xss-test%22)");

    if(http_vuln_check(port:port, url:url, pattern:'"openvas-xss-test"', check_header:TRUE)) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
}

exit( 99 );