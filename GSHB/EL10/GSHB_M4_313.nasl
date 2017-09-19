###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M4_313.nasl 7067 2017-09-06 11:50:33Z teissa $
#
# IT-Grundschutz, 10. EL, Ma�nahme 4.313
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "IT-Grundschutz M4.313: Bereitstellung von sicheren Dom�nen-Controllern (Windows).

  ACHTUNG: Dieser Test wird nicht mehr unterst�tzt. Er wurde ersetzt durch
  den entsprechenden Test der nun permanent and die aktuelle EL angepasst
  wird: OID 1.3.6.1.4.1.25623.1.0.94232

  Diese Pr�fung bezieht sich auf die 10. Erg�nzungslieferung (10. EL) des IT-
  Grundschutz. Die detaillierte Beschreibung zu dieser Ma�nahme findet sich unter
  nachfolgendem Verweis. Es ist zu beachten, dass der dortige Text sich immer auf
  die aktuellste Erg�nzungslieferung bezieht. Titel und Inhalt k�nnen sich bei einer
  Aktualisierung �ndern, allerdings nicht die Kernthematik.

";


if(description)
{
  script_id(94313);
  script_version("$Revision: 7067 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-06 13:50:33 +0200 (Wed, 06 Sep 2017) $");
  script_tag(name:"creation_date", value:"2010-01-14 14:29:35 +0100 (Thu, 14 Jan 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("IT-Grundschutz M4.313: Bereitstellung von sicheren Dom�nen-Controllern (Windows)");
  script_xref(name : "URL", value : "http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m04/m04313.html");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"registry");
  script_copyright("Copyright (c) 2009 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-10");
  script_mandatory_keys("Tools/Present/wmi");
  script_mandatory_keys("Compliance/Launch/GSHB-10");
  script_dependencies("GSHB/GSHB_WMI_PolSecSet.nasl", "GSHB/GSHB_WMI_OSInfo.nasl", "GSHB/GSHB_WMI_DomContrTest.nasl", "GSHB/GSHB_WMI_pre2000comp.nasl", "GSHB/GSHB_SMB_SDDL.nasl");

  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"deprecated", value:TRUE);
  exit(0);
}

exit(66);