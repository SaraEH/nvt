###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_caucho_resin_mult_xss_vuln.nasl 14326 2019-03-19 13:40:32Z jschulte $
#
# Caucho Resin Multiple Cross-Site Scripting Vulnerabilities
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.901115");
  script_version("$Revision: 14326 $");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 14:40:32 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2010-05-28 16:52:49 +0200 (Fri, 28 May 2010)");
  script_bugtraq_id(40251);
  script_cve_id("CVE-2010-2032");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Caucho Resin Multiple Cross-Site Scripting Vulnerabilities");


  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Web application abuses");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 8080);
  script_tag(name:"impact", value:"Successful exploitation will allow attackers to execute arbitrary web
  script or HTML in a user's browser session in the context of an affected
  site.");
  script_tag(name:"affected", value:"Caucho Technology Resin Professional 3.1.5, 3.1.10 and 4.0.6.");
  script_tag(name:"insight", value:"The flaw is caused by improper validation of user-supplied input via the
  'digest_username' and 'digest_realm' parameters in resin-admin/digest.php
  that allows the attackers to insert arbitrary HTML and script code.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"solution", value:"Upgrade to the latest version of Caucho Technology Resin Professional 4.0.7");
  script_tag(name:"summary", value:"The host is running Caucho Resin and is prone to multiple
  cross-site scripting vulnerabilities.");
  script_xref(name:"URL", value:"http://www.caucho.com/download");
  script_xref(name:"URL", value:"http://secunia.com/advisories/39839");
  script_xref(name:"URL", value:"http://www.securityfocus.com/archive/1/511341");
  script_xref(name:"URL", value:"http://packetstormsecurity.org/1005-exploits/cauchoresin312-xss.txt");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:8080);
if(!port){
  exit(0);
}

req = http_get(item:"/resin-admin/", port:port);
res = http_keepalive_send_recv(port:port,data:req);

if('>Resin Admin Login<' >< res)
{
  if(http_vuln_check(port:port, url:'/resin-admin/digest.php?'+
                   'digest_attempt=1&digest_realm="><script>alert'+
                   "('OpenVAS-XSS-Test')</script><a&digest_username[]=",
                   pattern:"<script>alert\('OpenVAS-XSS-Test'\)</script>", check_header:TRUE)) {
    security_message(port:port);
  }
}
