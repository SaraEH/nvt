###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sigplus_pro_activex_detect.nasl 5372 2017-02-20 16:26:11Z cfi $
#
# SigPlus Pro ActiveX Version Detection
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "This script finds the installed SigPlus Pro ActiveX version and
  saves the version in KB.";

if(description)
{
  script_id(801251);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 5372 $");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 17:26:11 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2010-08-10 14:39:31 +0200 (Tue, 10 Aug 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("SigPlus Pro ActiveX Version Detection");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Service detection");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.801251";
SCRIPT_DESC = "SigPlus Pro ActiveX Version Detection";

## Confirm Windows OS
if(!get_kb_item("SMB/WindowsVersion")){
  exit(0);
}

key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
if(!registry_key_exists(key:key)){
    exit(0);
}

## Get SigPlus Pro ActiveX version from registry
foreach item (registry_enum_keys(key:key))
{
  name = registry_get_sz(key:key + item, item:"DisplayName");
  if("Topaz e-Signatures SigPlus" >< name)
  {
    ver = registry_get_sz(key:key + item, item:"DisplayVersion");
    if(ver != NULL)
    {
      set_kb_item(name:"SigPlus/Ver", value:ver);
      log_message(data: "Topaz e-Signatures SigPlus version " + ver +
                          " was detected on the host");
      
      ## build cpe and store it as host_detail
      cpe = build_cpe(value:ver, exp:"^([0-9.]+)", base:"cpe:/a:topazsystems:sigplus_pro_activex_control:");
      if(!isnull(cpe))
         register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

    }
  }
}