###############################################################################
# OpenVAS Vulnerability Test
#
# SuSE Update for Mozilla openSUSE-SU-2017:1099-1 (Mozilla)
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.851540");
  script_version("$Revision: 6677 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:58:27 +0200 (Tue, 11 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-04-25 06:34:14 +0200 (Tue, 25 Apr 2017)");
  script_cve_id("CVE-2017-5429", "CVE-2017-5443", "CVE-2017-5444", "CVE-2017-5446",
                "CVE-2017-5447", "CVE-2017-5448", "CVE-2017-5449", "CVE-2017-5460",
                "CVE-2017-5461", "CVE-2017-5464", "CVE-2017-5465", "CVE-2017-5466",
                "CVE-2017-5467");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("SuSE Update for Mozilla openSUSE-SU-2017:1099-1 (Mozilla)");
  script_tag(name: "summary", value: "Check the version of Mozilla");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "
  Mozilla Firefox was updated to Firefox 52.1.0esr.

  The following vulnerabilities were fixed (bsc#1035082):

  - CVE-2017-5443: Out-of-bounds write during BinHex decoding
  - CVE-2017-5429: Memory safety bugs fixed in Firefox 53, Firefox ESR 45.9,
  and Firefox ESR 52.1
  - CVE-2017-5464: Memory corruption with accessibility and DOM manipulation
  - CVE-2017-5465: Out-of-bounds read in ConvolvePixel
  - CVE-2017-5466: Origin confusion when reloading isolated data:text/html
  URL
  - CVE-2017-5467: Memory corruption when drawing Skia content
  - CVE-2017-5460: Use-after-free in frame selection
  - CVE-2017-5461: Out-of-bounds write in Base64 encoding in NSS
  - CVE-2017-5448: Out-of-bounds write in ClearKeyDecryptor
  - CVE-2017-5449: Crash during bidirectional unicode manipulation with
  animation
  - CVE-2017-5446: Out-of-bounds read when HTTP/2 DATA frames are sent with
  incorrect data
  - CVE-2017-5447: Out-of-bounds read during glyph processing
  - CVE-2017-5444: Buffer overflow while parsing
  application/http-index-format content

  The package is now following the ESR 52 branch:

  - Enable plugin support by default
  - service workers are disabled by default
  - push notifications are disabled by default
  - WebAssembly (wasm) is disabled
  - Less use of multiprocess architecture Electrolysis (e10s)");
  script_tag(name: "affected", value: "Mozilla on openSUSE Leap 42.2, openSUSE Leap 42.1");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "openSUSE-SU", value: "2017:1099_1");
  script_xref(name: "URL" , value: "http://lists.opensuse.org/opensuse-security-announce/2017-04/msg00029.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
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

if(release == "openSUSELeap42.2")
{

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~52.1.0~57.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-branding-upstream", rpm:"MozillaFirefox-branding-upstream~52.1.0~57.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-buildsymbols", rpm:"MozillaFirefox-buildsymbols~52.1.0~57.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-debuginfo", rpm:"MozillaFirefox-debuginfo~52.1.0~57.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-debugsource", rpm:"MozillaFirefox-debugsource~52.1.0~57.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-devel", rpm:"MozillaFirefox-devel~52.1.0~57.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations-common", rpm:"MozillaFirefox-translations-common~52.1.0~57.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations-other", rpm:"MozillaFirefox-translations-other~52.1.0~57.6.1", rls:"openSUSELeap42.2")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}


if(release == "openSUSELeap42.1")
{

  if ((res = isrpmvuln(pkg:"MozillaFirefox", rpm:"MozillaFirefox~52.1.0~61.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-branding-upstream", rpm:"MozillaFirefox-branding-upstream~52.1.0~61.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-buildsymbols", rpm:"MozillaFirefox-buildsymbols~52.1.0~61.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-debuginfo", rpm:"MozillaFirefox-debuginfo~52.1.0~61.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-debugsource", rpm:"MozillaFirefox-debugsource~52.1.0~61.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-devel", rpm:"MozillaFirefox-devel~52.1.0~61.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations-common", rpm:"MozillaFirefox-translations-common~52.1.0~61.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"MozillaFirefox-translations-other", rpm:"MozillaFirefox-translations-other~52.1.0~61.1", rls:"openSUSELeap42.1")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}