###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_moxa_iologik_devices_detect.nasl 11885 2018-10-12 13:47:20Z cfischer $
#
# Moxa ioLogik Devices Detection
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
  script_oid("1.3.6.1.4.1.25623.1.0.106359");
  script_version("$Revision: 11885 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-12 15:47:20 +0200 (Fri, 12 Oct 2018) $");
  script_tag(name:"creation_date", value:"2016-10-31 15:52:13 +0700 (Mon, 31 Oct 2016)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");

  script_tag(name:"qod_type", value:"remote_banner");

  script_name("Moxa ioLogik Devices Detection");

  script_tag(name:"summary", value:"Detection of Moxa ioLogik Devices.

The script sends a connection request to the server and attempts to detect Moxa ioLogik Devices and its
version.");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_xref(name:"URL", value:"http://www.moxa.com/");

  exit(0);
}

include("cpe.inc");
include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default: 80);

req = http_get(port: port, item: "/01.htm");
res = http_keepalive_send_recv(port: port, data: req);

if ("Server: ioLogik Web Server" >!< res)
  exit(0);

mo = eregmatch(pattern: "Model Name</TD>.*(E[0-9]{4})</TD>", string: res);
if (isnull(mo[1]))
  exit(0);
else
  model = mo[1];

set_kb_item(name: "moxa_iologik/detected", value: TRUE);
set_kb_item(name: "moxa_iologik/model", value: model);

version = "unknown";
build = "unknown";
ver = eregmatch(pattern: "Firmware Version</TD>.*V([0-9.]+)( Build([0-9]+))?", string: res);
if (!isnull(ver[1])) {
  version = ver[1];
  set_kb_item(name: "moxa_iologik/fw_version", value: version);
}
if (!isnull(ver[3])) {
  build = ver[3];
  set_kb_item(name: "moxa_iologik/fw_build", value: build);
}

cpe = build_cpe(value: version, exp: "^([0-9.]+)", base: "cpe:/a:moxa:iologik_" + tolower(model) + ":");
if (!cpe)
  cpe = 'cpe:/a:moxa:iologik_' + tolower(model);

register_product(cpe: cpe, location: "/", port: port);

log_message(data: build_detection_report(app: "Moxa ioLogik " + model, version: version, install: "/", cpe: cpe,
                                         concluded: ver[0]),
            port: port);

exit(0);
