###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for kernel CESA-2011:0927 centos5 x86_64
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

include("revisions-lib.inc");
tag_insight = "The kernel packages contain the Linux kernel, the core of any Linux
  operating system.

  This update fixes the following security issues:
  
  * An integer overflow flaw in ib_uverbs_poll_cq() could allow a local,
  unprivileged user to cause a denial of service or escalate their
  privileges. (CVE-2010-4649, Important)
  
  * A race condition in the way new InfiniBand connections were set up could
  allow a remote user to cause a denial of service. (CVE-2011-0695,
  Important)
  
  * A flaw in the Stream Control Transmission Protocol (SCTP) implementation
  could allow a remote attacker to cause a denial of service if the sysctl
  &quot;net.sctp.addip_enable&quot; variable was turned on (it is off by default).
  (CVE-2011-1573, Important)
  
  * Flaws in the AGPGART driver implementation when handling certain IOCTL
  commands could allow a local, unprivileged user to cause a denial of
  service or escalate their privileges. (CVE-2011-1745, CVE-2011-2022,
  Important)
  
  * An integer overflow flaw in agp_allocate_memory() could allow a local,
  unprivileged user to cause a denial of service or escalate their
  privileges. (CVE-2011-1746, Important)
  
  * A flaw allowed napi_reuse_skb() to be called on VLAN (virtual LAN)
  packets. An attacker on the local network could trigger this flaw by
  sending specially-crafted packets to a target system, possibly causing a
  denial of service. (CVE-2011-1576, Moderate)
  
  * An integer signedness error in next_pidmap() could allow a local,
  unprivileged user to cause a denial of service. (CVE-2011-1593, Moderate)
  
  * A flaw in the way the Xen hypervisor implementation handled CPUID
  instruction emulation during virtual machine exits could allow an
  unprivileged guest user to crash a guest. This only affects systems that
  have an Intel x86 processor with the Intel VT-x extension enabled.
  (CVE-2011-1936, Moderate)
  
  * A flaw in inet_diag_bc_audit() could allow a local, unprivileged user to
  cause a denial of service (infinite loop). (CVE-2011-2213, Moderate)
  
  * A missing initialization flaw in the XFS file system implementation
  could lead to an information leak. (CVE-2011-0711, Low)
  
  * A flaw in ib_uverbs_poll_cq() could allow a local, unprivileged user to
  cause an information leak. (CVE-2011-1044, Low)
  
  * A missing validation check was found in the signals implementation. A
  local, unprivileged user could use this flaw to send signals via the
  sigqueueinfo system call, with the si_code set to SI_TKILL and with spoofed
  process and user IDs, to other processes. Note: This flaw does not allow
  existing permission chec ... 

  Description truncated, for more information please check the Reference URL";

tag_affected = "kernel on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2011-July/017647.html");
  script_id(881342);
  script_version("$Revision: 6654 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 13:48:17 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2012-07-30 17:27:32 +0530 (Mon, 30 Jul 2012)");
  script_cve_id("CVE-2010-4649", "CVE-2011-0695", "CVE-2011-0711", "CVE-2011-1044",
                "CVE-2011-1182", "CVE-2011-1573", "CVE-2011-1576", "CVE-2011-1593",
                "CVE-2011-1745", "CVE-2011-1746", "CVE-2011-1776", "CVE-2011-1936",
                "CVE-2011-2022", "CVE-2011-2213", "CVE-2011-2492");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_xref(name: "CESA", value: "2011:0927");
  script_name("CentOS Update for kernel CESA-2011:0927 centos5 x86_64");

  script_summary("Check for the Version of kernel");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
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

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.18~238.19.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.18~238.19.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.18~238.19.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.18~238.19.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.18~238.19.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.18~238.19.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen", rpm:"kernel-xen~2.6.18~238.19.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"kernel-xen-devel", rpm:"kernel-xen-devel~2.6.18~238.19.1.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}