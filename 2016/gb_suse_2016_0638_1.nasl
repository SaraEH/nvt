###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for openssl openSUSE-SU-2016:0638-1 (openssl)
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
  script_oid("1.3.6.1.4.1.25623.1.0.851221");
  script_version("$Revision: 6676 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:56:06 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2016-03-08 12:37:56 +0530 (Tue, 08 Mar 2016)");
  script_cve_id("CVE-2016-0800", "CVE-2016-0702", "CVE-2016-0705", "CVE-2016-0797", 
                "CVE-2016-0798", "CVE-2016-0799", "CVE-2015-3197", "CVE-2015-0293", 
                "CVE-2016-0703", "CVE-2016-0704");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for openssl openSUSE-SU-2016:0638-1 (openssl)");
  script_tag(name: "summary", value: "Check the version of openssl");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  This update for openssl fixes various security issues:

  Security issues fixed:
  - CVE-2016-0800 aka the 'DROWN' attack (bsc#968046): OpenSSL was
  vulnerable to a cross-protocol attack that could lead to decryption of
  TLS sessions by using a server supporting SSLv2 and EXPORT cipher suites
  as a Bleichenbacher RSA padding oracle.

  This update changes the openssl library to:

  * Disable SSLv2 protocol support by default.

  This can be overridden by setting the environment variable
  'OPENSSL_ALLOW_SSL2' or by using SSL_CTX_clear_options using the
  SSL_OP_NO_SSLv2 flag.

  Note that various services and clients had already disabled SSL
  protocol 2 by default previously.

  * Disable all weak EXPORT ciphers by default. These can be reenabled if
  required by old legacy software using the environment variable
  'OPENSSL_ALLOW_EXPORT'.

  - CVE-2016-0702 aka the 'CacheBleed' attack. (bsc#968050) Various changes
  in the modular exponentation code were added that make sure that it is
  not possible to recover RSA secret keys by analyzing cache-bank
  conflicts on the Intel Sandy-Bridge microarchitecture.

  Note that this was only exploitable if the malicious code was running
  on the same hyper threaded Intel Sandy Bridge processor as the victim
  thread performing decryptions.

  - CVE-2016-0705 (bnc#968047): A double free() bug in the DSA ASN1 parser
  code was fixed that could be abused to facilitate a denial-of-service
  attack.

  - CVE-2016-0797 (bnc#968048): The BN_hex2bn() and BN_dec2bn() functions
  had a bug that could result in an attempt to de-reference a NULL pointer
  leading to crashes. This could have security consequences if these
  functions were ever called by user applications with large untrusted
  hex/decimal data. Also, internal usage of these functions in OpenSSL
  uses data from config files or application command line arguments. If
  user developed applications generated config file data based on
  untrusted data, then this could have had security consequences as well.

  - CVE-2016-0798 (bnc#968265) The SRP user database lookup method
  SRP_VBASE_get_by_user() had a memory leak that attackers could abuse to
  facility DoS attacks. To mitigate the issue, the seed handling in
  SRP_VBASE_get_by_user() was disabled even if the user has configured a
  seed. Applications are advised to migrate to SRP_VBASE_get1_by_user().

  - CVE-2016-0799 (bnc#968374) On many 64 bit systems, the internal fmtstr()
  and doapr_outch() functions could miscalculate the length of a string
  and attempt to access out-of-bounds memory locations. These problems
  could have enabled  ... 

  Description truncated, for more information please check the Reference URL");
  script_tag(name: "affected", value: "openssl on openSUSE 13.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2016:0638_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2016-03/msg00010.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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

if(release == "openSUSE13.1")
{

  if ((res = isrpmvuln(pkg:"libopenssl-devel", rpm:"libopenssl-devel~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl1_0_0", rpm:"libopenssl1_0_0~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl1_0_0-debuginfo", rpm:"libopenssl1_0_0-debuginfo~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-debuginfo", rpm:"openssl-debuginfo~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-debugsource", rpm:"openssl-debugsource~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl-devel-32bit", rpm:"libopenssl-devel-32bit~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl1_0_0-32bit", rpm:"libopenssl1_0_0-32bit~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libopenssl1_0_0-debuginfo-32bit", rpm:"libopenssl1_0_0-debuginfo-32bit~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"openssl-doc", rpm:"openssl-doc~1.0.1k~11.84.1", rls:"openSUSE13.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}