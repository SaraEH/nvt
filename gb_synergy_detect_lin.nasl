###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_synergy_detect_lin.nasl 5877 2017-04-06 09:01:48Z teissa $
#
# Synergy Version Detection (Linux)
#
# Authors:
# Sooraj KS <kssooraj@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "This script finds the installed Synergy version and saves the
  version in KB.";

if(description)
{
  script_id(801874);
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 5877 $");
  script_tag(name:"last_modification", value:"$Date: 2017-04-06 11:01:48 +0200 (Thu, 06 Apr 2017) $");
  script_tag(name:"creation_date", value:"2011-04-22 16:38:12 +0200 (Fri, 22 Apr 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("Synergy Version Detection (Linux)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Service detection");
  script_mandatory_keys("login/SSH/Linux");
  script_dependencies("gather-package-list.nasl");
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("ssh_func.inc");
include("version_func.inc");

## Confirm Linux, as SSH can be installed on Windows as well
result = get_kb_item( "ssh/login/uname" );
if("Linux" >!< result){
  exit(0);
}

sock = ssh_login_or_reuse_connection();
if(!sock){
  exit(0);
}

## get the possible paths
paths = find_bin(prog_name:"synergys", sock:sock);
foreach bin (paths)
{
  ## check for each path
  synVer = get_bin_version(full_prog_name:chomp(bin), sock:sock, version_argv:"--version",
                           ver_pattern:"synergys ([0-9.]+)");

  if(synVer[1] != NULL)
  {
    ## Set the KB value
    set_kb_item(name:"Synergy/Lin/Ver", value:synVer[1]);
    log_message(data:"Synergy version " + synVer[1] + " was detected on the host");
  }
}

close(sock);
ssh_close_connection();