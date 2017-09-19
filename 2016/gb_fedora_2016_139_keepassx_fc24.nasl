###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for keepassx FEDORA-2016-139
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807796");
  script_version("$Revision: 6631 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:36:10 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-04-19 05:17:41 +0200 (Tue, 19 Apr 2016)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for keepassx FEDORA-2016-139");
  script_tag(name: "summary", value: "Check the version of keepassx");

  script_tag(name: "vuldetect", value: "Get the installed version with the help
  of detect NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight", value: "KeePassX is an application for people
  with extremly high demands on secure personal data management.
  KeePassX saves many different information e.g. user names, passwords, urls,
  attachemts and comments in one single database. For a better management
  user-defined titles and icons can be specified for each single entry.
  Furthermore the entries are sorted in groups, which are customizable as well.
  The integrated search function allows to search in a single group or the
  complete database.
  KeePassX offers a little utility for secure password generation. The password
  generator is very customizable, fast and easy to use. Especially someone who
  generates passwords frequently will appreciate this feature.
  The complete database is always encrypted either with AES (alias Rijndael) or
  Twofish encryption algorithm using a 256 bit key. Therefore the saved
  information can be considered as quite safe. KeePassX uses a database format
  that is compatible with KeePass Password Safe for MS Windows.");

  script_tag(name: "affected", value: "keepassx on Fedora 24");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2016-139");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2016-April/182670.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC24")
{

  if ((res = isrpmvuln(pkg:"keepassx", rpm:"keepassx~0.4.4~1.fc24", rls:"FC24")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}