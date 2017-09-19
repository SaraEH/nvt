# OpenVAS Vulnerability Test 
# Description: Amazon Linux security check 
# $Id: alas-2016-661.nasl 6574 2017-07-06 13:41:26Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@iki.fi> 
#
# OpenVAS and security consultance available from openvas@solinor.com
# see https://solinor.fi/openvas-en/ for more information
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://ping-viini.org 
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
script_oid("1.3.6.1.4.1.25623.1.0.120651");
script_version("$Revision: 6574 $");
script_tag(name:"creation_date", value:"2016-03-11 07:09:14 +0200 (Fri, 11 Mar 2016)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 15:41:26 +0200 (Thu, 06 Jul 2017) $");
script_name("Amazon Linux Local Check: alas-2016-661");
script_tag(name: "insight", value: "A padding oracle flaw was found in the Secure Sockets Layer version 2.0 (SSLv2) protocol. An attacker can potentially use this flaw to decrypt RSA-encrypted cipher text from a connection using a newer SSL/TLS protocol version, allowing them to decrypt such connections. This cross-protocol attack is publicly referred to as DROWN (CVE-2016-0800 ). Prior to this advisory, SSLv2 has been disabled by default in OpenSSL on the Amazon Linux AMI. However, application configurations may still re-enable SSLv2.A flaw was found in the way TLS 1.2 could use the MD5 hash function for signing ServerKeyExchange and Client Authentication packets during a TLS handshake. A man-in-the-middle attacker able to force a TLS connection to use the MD5 hash function could use this flaw to conduct collision attacks to impersonate a TLS server or an authenticated TLS client. (CVE-2015-7575 , Medium)A flaw was found in the way malicious SSLv2 clients could negotiate SSLv2 ciphers that have been disabled on the server. This could result in weak SSLv2 ciphers being used for SSLv2 connections, making them vulnerable to man-in-the-middle attacks. (CVE-2015-3197 , Low)A side-channel attack was found that makes use of cache-bank conflicts on the Intel Sandy-Bridge microarchitecture. An attacker who has the ability to control code in a thread running on the same hyper-threaded core as the victim&#039;s thread that is performing decryption, could use this flaw to recover RSA private keys. (CVE-2016-0702 , Low)A double-free flaw was found in the way OpenSSL parsed certain malformed DSA (Digital Signature Algorithm) private keys. An attacker could create specially crafted DSA private keys that, when processed by an application compiled against OpenSSL, could cause the application to crash. (CVE-2016-0705 , Low)An integer overflow flaw, leading to a NULL pointer dereference or a heap-based memory corruption, was found in the way some BIGNUM functions of OpenSSL were implemented. Applications that use these functions with large untrusted input could crash or, potentially, execute arbitrary code. (CVE-2016-0797 , Low)The fmtstr function in crypto/bio/b_print.c in OpenSSL improperly calculated string lengths, which allows remote attackers to cause a denial of service (overflow and out-of-bounds read) or possibly have unspecified other impact via a long string, as demonstrated by a large amount of ASN.1 data. (CVE-2016-0799 , Low)"); 
script_tag(name : "solution", value : "Run yum update openssl to update your system.");
script_tag(name : "solution_type", value : "VendorFix");
script_xref(name : "URL" , value : "https://alas.aws.amazon.com/ALAS-2016-661.html");
script_cve_id("CVE-2016-0702","CVE-2015-7575","CVE-2016-0705","CVE-2016-0800","CVE-2016-0799","CVE-2015-3197","CVE-2016-0797");
script_tag(name:"cvss_base", value:"10.0");
script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/amazon_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_tag(name:"summary", value:"Amazon Linux Local Security Checks");
script_copyright("Eero Volotinen");
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
if ((res = isrpmvuln(pkg:"openssl-static", rpm:"openssl-static~1.0.1k~14.89.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl-debuginfo", rpm:"openssl-debuginfo~1.0.1k~14.89.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl-devel", rpm:"openssl-devel~1.0.1k~14.89.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl-perl", rpm:"openssl-perl~1.0.1k~14.89.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if ((res = isrpmvuln(pkg:"openssl", rpm:"openssl~1.0.1k~14.89.amzn1", rls:"AMAZON")) != NULL) {
  security_message(data:res);
  exit(0);
}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
}