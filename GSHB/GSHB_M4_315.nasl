###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M4_315.nasl 7076 2017-09-07 11:53:47Z teissa $
#
# IT-Grundschutz, 14. EL, Ma�nahme 4.315
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_id(94233);
  script_version("$Revision: 7076 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-07 13:53:47 +0200 (Thu, 07 Sep 2017) $");
  script_tag(name:"creation_date", value:"2015-03-25 10:14:11 +0100 (Wed, 25 Mar 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"general_note");
  script_name("IT-Grundschutz M4.315: Aufrechterhaltung der Betriebssicherheit von Active Directory");
  script_xref(name : "URL" , value : "http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m04/m04315.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Compliance/Launch/GSHB");
  script_tag(name : "summary" , value :
"IT-Grundschutz M4.315: Aufrechterhaltung der Betriebssicherheit von Active Directory.

Stand: 14. Erg�nzungslieferung (14. EL).
");

  exit(0);
}

include("itg.inc");

name = 'IT-Grundschutz M4.315: Aufrechterhaltung der Betriebssicherheit von Active Directory\n';

gshbm =  "IT-Grundschutz M4.315: ";

result = 'Pr�fung dieser Ma�nahme ist nicht implementierbar.';
desc = 'Pr�fung dieser Ma�nahme ist nicht implementierbar.';

set_kb_item(name:"GSHB/M4_315/result", value:result);
set_kb_item(name:"GSHB/M4_315/desc", value:desc);
set_kb_item(name:"GSHB/M4_315/name", value:name);

silence = get_kb_item("GSHB/silence");
if (!silence) itg_send_details (itg_id: 'GSHB/M4_315');

exit(0);