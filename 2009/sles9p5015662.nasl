# OpenVAS Vulnerability Test
# $Id: sles9p5015662.nasl 6666 2017-07-11 13:13:36Z cfischer $
# Description: Security update for PHP4
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

include("revisions-lib.inc");
tag_summary = "The remote host is missing updates to packages that affect
the security of your system.  One or more of the following packages
are affected:

    php4-zlib
    php4-shmop
    php4-ftp
    php4-filepro
    php4-mcrypt
    php4-servlet
    php4-gmp
    php4-bz2
    php4-snmp
    php4-mysql
    php4-mime_magic
    php4
    php4-pgsql
    mod_php4-servlet
    php4-swf
    php4-unixODBC
    php4-fastcgi
    php4-mbstring
    php4-domxml
    php4-xslt
    php4-imap
    php4-sysvshm
    mod_php4-apache2
    php4-dbase
    mod_php4-core
    php4-mhash
    php4-session
    php4-ctype
    php4-pear
    php4-gettext
    php4-iconv
    php4-sockets
    php4-devel
    apache-mod_php4
    apache2-mod_php4
    php4-wddx
    php4-exif
    php4-ldap
    php4-gd
    php4-bcmath
    php4-calendar
    php4-readline
    php4-mcal
    php4-qtdom
    php4-yp
    php4-curl
    php4-recode
    php4-sysvsem
    php4-dba
    mod_php4

For more information, please visit the referenced security
advisories.

More details may also be found by searching for keyword
5015662 within the SuSE Enterprise Server 9 patch
database at http://download.novell.com/patch/finder/";

tag_solution = "Please install the updates provided by SuSE.";
                                                                                
if(description)
{
 script_id(65266);
 script_version("$Revision: 6666 $");
 script_tag(name:"last_modification", value:"$Date: 2017-07-11 15:13:36 +0200 (Tue, 11 Jul 2017) $");
 script_tag(name:"creation_date", value:"2009-10-10 16:11:46 +0200 (Sat, 10 Oct 2009)");
 script_cve_id("CVE-2007-1660", "CVE-2006-7225", "CVE-2006-7224", "CVE-2006-7226", "CVE-2007-1659", "CVE-2006-7230", "CVE-2007-5898", "CVE-2007-4825", "CVE-2007-4782", "CVE-2007-4840", "CVE-2007-4784", "CVE-2007-3998", "CVE-2007-4661", "CVE-2007-2872", "CVE-2007-3996", "CVE-2007-4658");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_name("SLES9: Security update for PHP4");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2009 E-Soft Inc. http://www.securityspace.com");
 script_family("SuSE Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/suse_sles", "ssh/login/rpms");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-rpm.inc");

res = "";
report = "";
if ((res = isrpmvuln(pkg:"php4-zlib", rpm:"php4-zlib~4.3.4~43.85", rls:"SLES9.0")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}