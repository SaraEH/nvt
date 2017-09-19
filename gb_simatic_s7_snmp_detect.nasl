###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_simatic_s7_snmp_detect.nasl 6160 2017-05-18 09:39:36Z ckuerste $
#
# Siemens SIMATIC S7 Device Detection (SNMP)
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.106097");
 script_version ("$Revision: 6160 $");
 script_tag(name: "last_modification", value: "$Date: 2017-05-18 11:39:36 +0200 (Thu, 18 May 2017) $");
 script_tag(name: "creation_date", value: "2016-06-15 15:54:49 +0700 (Wed, 15 Jun 2016)");
 script_tag(name: "cvss_base", value: "0.0");
 script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:N/I:N/A:N");

 script_tag(name: "qod_type", value: "remote_banner");

 script_name("Siemens SIMATIC S7 Device Detection (SNMP)");

 script_tag(name: "summary" , value: "This script performs SNMP based detection of Siemens SIMATIC S7
devices.");

 script_category(ACT_GATHER_INFO);

 script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
 script_family("Product detection");
 script_dependencies("gb_snmp_sysdesc.nasl");
 script_require_udp_ports("Services/udp/snmp", 161);


 exit(0);
}

port = get_kb_item("Services/udp/snmp");
if (!port)
  port = 161;

if (!get_udp_port_state(port))
  exit(0);

sysdesc = get_kb_item("SNMP/sysdesc");
if (!sysdesc)
  exit(0);

if (egrep(string: sysdesc, pattern: "Siemens, SIMATIC( S7,)|(, S7)")) {
  mo = eregmatch(pattern: "SIMATIC( S7)?, (S7-|CPU-|IM|CPU)([^,]+)", string: sysdesc);
  model = mo[3];

  version = "unknown";
  sp = split(sysdesc, sep: ",", keep: FALSE);
  if (!isnull(sp[5])) {
    ver = eregmatch(pattern: "V(\.)?([0-9.]+)", string: sp[5]);
    if (!isnull(ver[2]))
      version = ver[2];
  }

  set_kb_item(name: 'simatic_s7/detected', value: TRUE);
  set_kb_item(name: 'simatic_s7/snmp/model', value: model);
  if (version != 'unknown')
    set_kb_item(name: 'simatic_s7/snmp/version', value: version);
  set_kb_item(name: 'simatic_s7/snmp/port', value: port);
}

exit(0);
