###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for qt4 RHSA-2011:1324-01
#
# Authors:
# System Generated Check
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

include("revisions-lib.inc");
tag_insight = "Qt 4 is a software toolkit that simplifies the task of writing and
  maintaining GUI (Graphical User Interface) applications for the X Window
  System. HarfBuzz is an OpenType text shaping engine.

  A flaw in the way Qt 4 expanded certain UTF-8 characters could be used to
  prevent a Qt 4 based application from properly sanitizing user input.
  Depending on the application, this could allow an attacker to perform
  directory traversal, or for web applications, a cross-site scripting (XSS)
  attack. (CVE-2007-0242)
  
  A buffer overflow flaw was found in the harfbuzz module in Qt 4. If a user
  loaded a specially-crafted font file with an application linked against Qt
  4, it could cause the application to crash or, possibly, execute arbitrary
  code with the privileges of the user running the application.
  (CVE-2011-3193)
  
  Users of Qt 4 should upgrade to these updated packages, which contain
  backported patches to correct these issues. All running applications linked
  against Qt 4 libraries must be restarted for this update to take effect.";

tag_affected = "qt4 on Red Hat Enterprise Linux (v. 5 server)";
tag_solution = "Please Install the Updated Packages.";


if(description)
{
  script_xref(name : "URL" , value : "https://www.redhat.com/archives/rhsa-announce/2011-September/msg00036.html");
  script_id(870493);
  script_version("$Revision: 6685 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:44:46 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-09-23 16:39:49 +0200 (Fri, 23 Sep 2011)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "RHSA", value: "2011:1324-01");
  script_cve_id("CVE-2007-0242", "CVE-2011-3193");
  script_name("RedHat Update for qt4 RHSA-2011:1324-01");

  script_summary("Check for the Version of qt4");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_5")
{

  if ((res = isrpmvuln(pkg:"qt4", rpm:"qt4~4.2.1~1.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-debuginfo", rpm:"qt4-debuginfo~4.2.1~1.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-devel", rpm:"qt4-devel~4.2.1~1.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-doc", rpm:"qt4-doc~4.2.1~1.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-mysql", rpm:"qt4-mysql~4.2.1~1.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-odbc", rpm:"qt4-odbc~4.2.1~1.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-postgresql", rpm:"qt4-postgresql~4.2.1~1.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"qt4-sqlite", rpm:"qt4-sqlite~4.2.1~1.el5_7.1", rls:"RHENT_5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}