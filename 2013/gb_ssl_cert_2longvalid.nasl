###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ssl_cert_2longvalid.nasl 4765 2016-12-14 10:43:39Z cfi $
#
# SSL/TLS: Certificate Too Long Valid
#
# Authors:
# Werner Koch <wk@gnupg.org>
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

# The maximum number of years a certificate may be valid.
max_valid_years = 15;

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103958");
  script_version("$Revision: 4765 $");
  script_tag(name:"last_modification", value:"$Date: 2016-12-14 11:43:39 +0100 (Wed, 14 Dec 2016) $");
  script_tag(name:"creation_date", value:"2013-11-28 11:39:30 +0700 (Thu, 28 Nov 2013)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("SSL/TLS: Certificate Too Long Valid");
  script_category(ACT_GATHER_INFO);
  script_family("SSL and TLS");
  script_copyright("This script is Copyright (C) 2013 Greenbone Networks GmbH");
  script_dependencies("ssl_cert_details.nasl");
  script_mandatory_keys("ssl/cert/avail");

  script_tag(name:"insight", value:"This script checks expiry dates of certificates associated with
  SSL/TLS-enabled services on the target and reports whether any do not have a reasonable expiration date.");

  script_tag(name:"solution", value:"Replace the SSL/TLS certificate by a new one.");

  script_tag(name:"summary", value:"The remote server's SSL/TLS certificate expiration date is too far
  in the future.");

  script_tag(name:"qod_type", value:"remote_app");

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("ssl_funcs.inc");
include("byte_func.inc");

# The current time
now = isotime_now();

# The current time plus the years which are reasonable
far_future = isotime_add( now, years:max_valid_years );

# List of keys with problematic expiration dates
problematic_keys = make_array();

ssls = get_kb_list( "HostDetails/SSLInfo/*" );

if( ! isnull( ssls ) ) {

  check_for = "too_long_valid";

  foreach key( keys( ssls ) ) {

    tmp = split( key, sep:"/", keep:FALSE );
    port = tmp[2];
    vhost = tmp[3];

    fprlist = get_kb_item( key );
    if( ! fprlist ) continue;

    result = check_cert_validity( fprlist:fprlist, port:port, vhost:vhost,
                                  check_for:check_for, now:now, timeframe:far_future );
    if( result ) {
      problematic_keys[port] = result;
    }
  }

  foreach port( keys( problematic_keys ) ) {
    report = "The certificate of the remote service is valid for more than " + max_valid_years;
    report += " years from now and will expire on ";
    report += isotime_print( get_kb_item( problematic_keys[port] + "notAfter" ) ) + '.\n';
    report += cert_summary( key:problematic_keys[port] );
    log_message( data:report, port:port );
  }

  exit( 0 );
}

exit( 99 );