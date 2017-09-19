###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for rrdtool FEDORA-2013-10309
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Please Install the Updated Packages.";
tag_insight = "RRD is the Acronym for Round Robin Database. RRD is a system to store and
  display time-series data (i.e. network bandwidth, machine-room temperature,
  server load average). It stores the data in a very compact way that will not
  expand over time, and it presents useful graphs by processing the data to
  enforce a certain data density. It can be used either via simple wrapper
  scripts (from shell or Perl) or via frontends that poll network devices and
  put a friendly user interface on it.";
tag_affected = "rrdtool on Fedora 18";


if(description)
{
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_id(865979);
  script_version("$Revision: 6628 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:32:47 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-06-18 10:38:08 +0530 (Tue, 18 Jun 2013)");
  script_cve_id("CVE-2013-2131");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_name("Fedora Update for rrdtool FEDORA-2013-10309");

  script_xref(name: "FEDORA", value: "2013-10309");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2013-June/109369.html");
  script_summary("Check for the Version of rrdtool");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
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

if(release == "FC18")
{

  if ((res = isrpmvuln(pkg:"rrdtool", rpm:"rrdtool~1.4.8~2.fc18", rls:"FC18")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}