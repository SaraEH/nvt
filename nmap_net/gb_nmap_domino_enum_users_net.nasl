###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_domino_enum_users_net.nasl 5505 2017-03-07 10:00:18Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
###############################################################################

tag_summary = "Attempts to discover valid IBM Lotus Domino users and download their ID files by exploiting the
CVE-2006-5835 vulnerability.


SYNTAX:

userdb:  The filename of an alternate username database.


domino-id.username:  the name of the user from which to retrieve the ID.
If this parameter is not specified, the unpwdb library will be used to
brute force names of users.

For more information see:
http://www-01.ibm.com/support/docview.wss?rs=463&uid=swg21248026

Credits
-------
o Ollie Whitehouse for bringing this to my attention back in the days when
it was first discovered and for the c-code on which this is based.


passdb:  The filename of an alternate password database.


unpwdb.passlimit:  The maximum number of passwords
'passwords' will return (default unlimited).


domino-id.path:  the location to which any retrieved ID files are stored


unpwdb.userlimit:  The maximum number of usernames
'usernames' will return (default unlimited).


unpwdb.timelimit:  The maximum amount of time that any iterator will run
before stopping. The value is in seconds by default and you can follow it
with 'ms', 's', 'm', or 'h' for
milliseconds, seconds, minutes, or hours. For example,
'unpwdb.timelimit=30m' or 'unpwdb.timelimit=.5h' for
30 minutes. The default depends on the timing template level (see the module
description). Use the value '0' to disable the time limit.";

if(description)
{
    script_id(104022);
    script_version("$Revision: 5505 $");
    script_cve_id("CVE-2006-5835");
    script_bugtraq_id(20960);
    script_tag(name:"last_modification", value:"$Date: 2017-03-07 11:00:18 +0100 (Tue, 07 Mar 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"5.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
    script_name("Nmap NSE net: domino-enum-users");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"userdb", value:"", type:"entry");
    script_add_preference(name:"domino-id.username", value:"", type:"entry");
    script_add_preference(name:"passdb", value:"", type:"entry");
    script_add_preference(name:"unpwdb.passlimit", value:"", type:"entry");
    script_add_preference(name:"domino-id.path", value:"", type:"entry");
    script_add_preference(name:"unpwdb.userlimit", value:"", type:"entry");
    script_add_preference(name:"unpwdb.timelimit", value:"", type:"entry");

    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");

# The corresponding NSE script does't belong to the 'safe' category
if (safe_checks()) exit(0);

phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();

    pref = script_get_preference("userdb");
    if (!isnull(pref) && pref != "") {
        argv["userdb"] = string('"', pref, '"');
    }
    pref = script_get_preference("domino-id.username");
    if (!isnull(pref) && pref != "") {
        argv["domino-id.username"] = string('"', pref, '"');
    }
    pref = script_get_preference("passdb");
    if (!isnull(pref) && pref != "") {
        argv["passdb"] = string('"', pref, '"');
    }
    pref = script_get_preference("unpwdb.passlimit");
    if (!isnull(pref) && pref != "") {
        argv["unpwdb.passlimit"] = string('"', pref, '"');
    }
    pref = script_get_preference("domino-id.path");
    if (!isnull(pref) && pref != "") {
        argv["domino-id.path"] = string('"', pref, '"');
    }
    pref = script_get_preference("unpwdb.userlimit");
    if (!isnull(pref) && pref != "") {
        argv["unpwdb.userlimit"] = string('"', pref, '"');
    }
    pref = script_get_preference("unpwdb.timelimit");
    if (!isnull(pref) && pref != "") {
        argv["unpwdb.timelimit"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"domino-enum-users", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"domino-enum-users");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (domino-enum-users.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}