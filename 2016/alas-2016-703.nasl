# OpenVAS Vulnerability Test
# Description: Amazon Linux security check
# $Id: alas-2016-703.nasl 6574 2017-07-06 13:41:26Z cfischer $
# 
# Authors:
# Autogenerated by alas-generator developed by Eero Volotinen <eero.volotinen@iki.fi>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.120692");
script_version("$Revision: 6574 $");
script_tag(name:"creation_date", value:"2016-10-26 15:38:09 +0300 (Wed, 26 Oct 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:41:26 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2016-703");
script_tag(name: "insight", value: "The Linux kernel did not properly suppress hugetlbfs support in x86 PV guests, which could allow local PV guest users to cause a denial of service (guest OS crash) by attempting to access a hugetlbfs mapped area. (CVE-2016-3961  / XSA-174)A flaw was found in the way the Linux kernel&#039;s ASN.1 DER decoder processed certain certificate files with tags of indefinite length. A local, unprivileged user could use a specially crafted X.509 certificate DER file to crash the system or, potentially, escalate their privileges on the system. (CVE-2016-0758 )Multiple race conditions in the ext4 filesystem implementation in the Linux kernel before 4.5 allow local users to cause a denial of service (disk corruption) by writing to a page that is associated with a different user&#039;s file after unsynchronized hole punching and page-fault handling. (CVE-2015-8839 )The following flaws were also fixed in this version:CVE-2016-4557 : Use after free vulnerability via double fdputCVE-2016-4581 : Slave being first propagated copy causes oops in propagate_mntCVE-2016-4486 : Information leak in rtnetlinkCVE-2016-4485 : Information leak in llc moduleCVE-2016-4558 : bpf: refcnt overflowCVE-2016-4565 : infiniband: Unprivileged process can overwrite kernel memory using rdma_ucm.koCVE-2016-0758 : tags with indefinite length can corrupt pointers in asn1_find_indefinite_length()CVE-2015-8839 : ext4 filesystem page fault race condition with fallocate call."); 
script_tag(name : "solution", value : "Run yum update kernel to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2016-703.html");
script_cve_id("CVE-2016-4557","CVE-2016-3961","CVE-2016-4581","CVE-2016-4486","CVE-2016-4485","CVE-2016-4558","CVE-2016-4565","CVE-2016-0758","CVE-2015-8839");
script_tag(name:"cvss_base", value:"7.2");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
script_family("Amazon Linux Local Security Checks");
exit(0);

}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");
res = "";

if(release == NULL)
{
 exit(0);
}

if(release == "AMAZON")
{
  if ((res = isrpmvuln(pkg:"perf-debuginfo", rpm:"perf-debuginfo~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-tools-debuginfo", rpm:"kernel-tools-debuginfo~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-i686", rpm:"kernel-debuginfo-common-i686~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-tools-devel", rpm:"kernel-tools-devel~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-debuginfo", rpm:"kernel-debuginfo~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-debuginfo-common-x86_64", rpm:"kernel-debuginfo-common-x86_64~4.4.10~22.54.amzn1", rls:"AMAZON")) != NULL) {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); #Not vulnerable
    exit(0);
}