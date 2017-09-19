###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for xen FEDORA-2013-23457
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");

if(description)
{
  script_id(867199);
  script_version("$Revision: 6628 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:32:47 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-12-30 11:04:59 +0530 (Mon, 30 Dec 2013)");
  script_cve_id("CVE-2013-6400", "CVE-2013-6885", "CVE-2013-4553", "CVE-2013-4554",
                "CVE-2013-6375", "CVE-2013-4551", "CVE-2013-4494", "CVE-2013-4416",
                "CVE-2013-4368", "CVE-2013-4369", "CVE-2013-4370", "CVE-2013-4371",
                "CVE-2013-4375", "CVE-2013-4355", "CVE-2013-4361", "CVE-2013-1442",
                "CVE-2013-4329", "CVE-2013-1918", "CVE-2013-1432", "CVE-2013-2211",
                "CVE-2013-2194", "CVE-2013-2195", "CVE-2013-2196");
  script_tag(name:"cvss_base", value:"7.9");
  script_tag(name:"cvss_base_vector", value:"AV:A/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Fedora Update for xen FEDORA-2013-23457");

  tag_insight = "This package contains the XenD daemon and xm command line
tools, needed to manage virtual machines running under the
Xen hypervisor
";

  tag_affected = "xen on Fedora 19";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2013-23457");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2013-December/125111.html");
  script_summary("Check for the Version of xen");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC19")
{

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.2.3~12.fc19", rls:"FC19")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}