###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for xen SUSE-SU-2015:1908-1 (xen)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851125");
  script_version("$Revision: 6665 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:01:58 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-11-05 06:19:12 +0100 (Thu, 05 Nov 2015)");
  script_cve_id("CVE-2014-0222", "CVE-2015-4037", "CVE-2015-5239", "CVE-2015-6815",
                "CVE-2015-7311", "CVE-2015-7835", "CVE-2015-7969", "CVE-2015-7971");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for xen SUSE-SU-2015:1908-1 (xen)");
  script_tag(name: "summary", value: "Check the version of xen");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  xen was updated to version 4.4.3 to fix nine security issues.

  These security issues were fixed:
  - CVE-2015-4037: The slirp_smb function in net/slirp.c created temporary
  files with predictable names, which allowed local users to cause a
  denial of service (instantiation failure) by creating /tmp/qemu-smb.*-*
  files before the program (bsc#932267).
  - CVE-2014-0222: Integer overflow in the qcow_open function allowed remote
  attackers to cause a denial of service (crash) via a large L2 table in a
  QCOW version 1 image (bsc#877642).
  - CVE-2015-7835: Uncontrolled creation of large page mappings by PV guests
  (bsc#950367).
  - CVE-2015-7311: libxl in Xen did not properly handle the readonly flag on
  disks when using the qemu-xen device model, which allowed local guest
  users to write to a read-only disk image (bsc#947165).
  - CVE-2015-5239: Integer overflow in vnc_client_read() and
  protocol_client_msg() (bsc#944463).
  - CVE-2015-6815: With e1000 NIC emulation support it was possible to enter
  an infinite loop (bsc#944697).
  - CVE-2015-7969: Leak of main per-domain vcpu pointer array leading to
  denial of service (bsc#950703).
  - CVE-2015-7969: Leak of per-domain profiling- related vcpu pointer array
  leading to denial of service (bsc#950705).
  - CVE-2015-7971: Some pmu and profiling hypercalls log without rate
  limiting (bsc#950706).

  These non-security issues were fixed:
  - bsc#907514: Bus fatal error: SLES 12 sudden reboot has been observed
  - bsc#910258: SLES12 Xen host crashes with FATAL NMI after shutdown of
  guest with VT-d NIC
  - bsc#918984: Bus fatal error: SLES11-SP4 sudden reboot has been observed
  - bsc#923967: Partner-L3: Bus fatal error: SLES11-SP3 sudden reboot has
  been observed
  - bnc#901488: Intel ixgbe driver assigns rx/tx queues per core resulting
  in irq problems on servers with a large amount of CPU cores
  - bsc#945167: Running command: xl pci-assignable-add 03:10.1 secondly show
  errors
  - bsc#949138: Setting vcpu affinity under Xen causes libvirtd abort");
  script_tag(name: "affected", value: "xen on SUSE Linux Enterprise Server 12, SUSE Linux Enterprise Desktop 12");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "SUSE-SU", value: "2015:1908_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2015-11/msg00011.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "SLED12.0SP0")
{

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.4.3_02~22.12.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-debugsource", rpm:"xen-debugsource~4.4.3_02~22.12.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default", rpm:"xen-kmp-default~4.4.3_02_k3.12.48_52.27~22.12.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default-debuginfo", rpm:"xen-kmp-default-debuginfo~4.4.3_02_k3.12.48_52.27~22.12.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-32bit", rpm:"xen-libs-32bit~4.4.3_02~22.12.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs", rpm:"xen-libs~4.4.3_02~22.12.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo-32bit", rpm:"xen-libs-debuginfo-32bit~4.4.3_02~22.12.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo", rpm:"xen-libs-debuginfo~4.4.3_02~22.12.1", rls:"SLED12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "SLES12.0SP0")
{

  if ((res = isrpmvuln(pkg:"xen", rpm:"xen~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-debugsource", rpm:"xen-debugsource~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-doc-html", rpm:"xen-doc-html~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default", rpm:"xen-kmp-default~4.4.3_02_k3.12.48_52.27~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-kmp-default-debuginfo", rpm:"xen-kmp-default-debuginfo~4.4.3_02_k3.12.48_52.27~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-32bit", rpm:"xen-libs-32bit~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs", rpm:"xen-libs~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo-32bit", rpm:"xen-libs-debuginfo-32bit~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-libs-debuginfo", rpm:"xen-libs-debuginfo~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools", rpm:"xen-tools~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-debuginfo", rpm:"xen-tools-debuginfo~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-domU", rpm:"xen-tools-domU~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"xen-tools-domU-debuginfo", rpm:"xen-tools-domU-debuginfo~4.4.3_02~22.12.1", rls:"SLES12.0SP0")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}