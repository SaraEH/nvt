###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for sysstat CESA-2011:1005 centos5 i386
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
tag_insight = "The sysstat package contains a set of utilities which enable system
  monitoring of disks, network, and other I/O activity.

  It was found that the sysstat initscript created a temporary file in an
  insecure way. A local attacker could use this flaw to create arbitrary
  files via a symbolic link attack. (CVE-2007-3852)
  
  This update fixes the following bugs:
  
  * On systems under heavy load, the sadc utility would sometimes output the
  following error message if a write() call was unable to write all of the
  requested input:
  
  &quot;Cannot write data to system activity file: Success.&quot;
  
  In this updated package, the sadc utility tries to write the remaining
  input, resolving this issue. (BZ#454617)
  
  * On the Itanium architecture, the &quot;sar -I&quot; command provided incorrect
  information about the interrupt statistics of the system. With this update,
  the &quot;sar -I&quot; command has been disabled for this architecture, preventing
  this bug. (BZ#468340)
  
  * Previously, the &quot;iostat -n&quot; command used invalid data to create
  statistics for read and write operations. With this update, the data source
  for these statistics has been fixed, and the iostat utility now returns
  correct information. (BZ#484439)
  
  * The &quot;sar -d&quot; command used to output invalid data about block devices.
  With this update, the sar utility recognizes disk registration and disk
  overflow statistics properly, and only correct and relevant data is now
  displayed. (BZ#517490)
  
  * Previously, the sar utility set the maximum number of days to be logged
  in one month too high. Consequently, data from a month was appended to
  data from the preceding month. With this update, the maximum number of days
  has been set to 25, and data from a month now correctly replaces data from
  the preceding month. (BZ#578929)
  
  * In previous versions of the iostat utility, the number of NFS mount
  points was hard-coded. Consequently, various issues occurred while iostat
  was running and NFS mount points were mounted or unmounted; certain values
  in iostat reports overflowed and some mount points were not reported at
  all. With this update, iostat properly recognizes when an NFS mount point
  mounts or unmounts, fixing these issues. (BZ#675058, BZ#706095, BZ#694767)
  
  * When a device name was longer than 13 characters, the iostat utility
  printed a redundant new line character, making its output less readable.
  This bug has been fixed and now, no extra characters are printed if a long
  device name occurs in iostat output. (BZ#604637)
  
  * Previously, if kernel inte ... 

  Description truncated, for more information please check the Reference URL";
tag_solution = "Please Install the Updated Packages.";

tag_affected = "sysstat on CentOS 5";


if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-September/018036.html");
  script_id(880987);
  script_version("$Revision: 6653 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:46:53 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2011-09-23 16:39:49 +0200 (Fri, 23 Sep 2011)");
  script_tag(name:"cvss_base", value:"4.4");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "CESA", value: "2011:1005");
  script_cve_id("CVE-2007-3852");
  script_name("CentOS Update for sysstat CESA-2011:1005 centos5 i386");

  script_summary("Check for the Version of sysstat");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2011 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"sysstat", rpm:"sysstat~7.0.2~11.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}